#include "exec/types.h"
#include "intuition/intuition.h"


#include "handycmds.h"
#include "proto/exec.h"
#include "string.h"
#include "stdlib.h"

struct HandyMessage msg;

void usage(name)
char *name;
{
	printf("Usage:\n");
	printf("   %s <file> BIN | RAW @aaaa\n",name);
	printf("      <file>    name of data file\n");
	printf("      BIN       specifies assembler .bin format\n");
	printf("      RAW       specifies raw data\n");
	printf("      @aaaa     hex download address for RAW data\n");
	printf("\n performs Bootstrap, then Download\n");
	exit(20);
}

void main(argc,argv)
int argc;
char **argv;
{
	int exitcode = 0;
	int i;
	USHORT code;
	struct MsgPort *port = NULL;
	struct MsgPort *replyport = NULL;
	long temp;
	char path[128];


	if (argc < 3) usage(argv[0]);


	/* Forbid() to make sure that once we've got the port it 
	 * won't go away until we're done with it
	 */


	Forbid();
	port = FindPort(HANDEBUG_COMMANDS);  
	if (port == NULL)
		{
		Permit();
		printf("Handebug not running!\n");
		exitcode = 20;
		goto alldone;
		}

	
	if (strchr(argv[1],':') == NULL)
		{
		getcd(0,path);
		i = strlen(path);
		if (strchr(path,':')) 	path[i] = '/';
		else			path[i] = ':';
		path[i+1] = '\0';
		strncat(path,argv[1],128);
		argv[1] = path;
		}

	if (stricmp(argv[2],"BIN") == 0) 
		code = HDB_DNLOAD_BIN;
	else if (stricmp(argv[2],"RAW") == 0) 
		{
		code = HDB_DNLOAD_RAW;
		if (*(argv[3]++) != '@') usage(argv[0]);
		if (stch_l(argv[3],&temp) == 0) usage(argv[0]);
		}		
	else 	usage(argv[0]);

	replyport = CreatePort(0,0);
	if (replyport == NULL)
		{
		printf("Can't allocate reply port\n");
		exitcode = 20;
		goto alldone;
		}
	msg.Msg.mn_Node.ln_Type = NT_MESSAGE;
	msg.Msg.mn_ReplyPort    = replyport;

	msg.Cmds.Code = HHC_F9;
	PutMsg(port, (struct Message *)&msg);
	Permit();
	WaitPort(replyport);
	GetMsg(replyport);
/*	Delay(10); */
	Forbid();

	if (code == HDB_DNLOAD_RAW)	/* if RAW, do ORG first */
		{
		msg.Cmds.Code = HDB_ORG;
		msg.Cmds.Size = temp;
		PutMsg(port, (struct Message *)&msg);
		Permit();
		WaitPort(replyport);
		GetMsg(replyport);
		if (msg.Cmds.Code == FALSE) goto error;
		Forbid();
		}

	msg.Cmds.Code = code;
	msg.Cmds.Buffer = argv[1];
	printf("Downloading file %s\n",argv[1]);
	PutMsg(port, (struct Message *)&msg);
	Permit();

	WaitPort(replyport);
	GetMsg(replyport);
	if (msg.Cmds.Code == FALSE) goto error;

	if (code == HDB_DNLOAD_BIN)
		{
		if ((argc == 4) && (stricmp(argv[3],"GO") == 0))
			{
			msg.Cmds.Code = HANDY_GO;
			PutMsg(port, (struct Message *)&msg);
			WaitPort(replyport);
			GetMsg(replyport);
			if (msg.Cmds.Code == FALSE) goto error;
			}
		}
alldone:
	if (replyport) DeletePort(replyport);
	exit(exitcode);

error:
	printf("Download failed!\n");
	exitcode = 20;
	goto alldone;

}
