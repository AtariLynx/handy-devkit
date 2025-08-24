
struct HandyCommands {
	USHORT Code;
	struct Screen *Screen;
	struct Window *Window;
	USHORT Flags;
	SHORT Size;
	UBYTE *Buffer;
	};

struct HandyMessage {
	struct Message Msg;
	struct HandyCommands Cmds;
	};


/* Handycraft <-> Handebug commands */

#define HHC_F1		1	/* send "GO" command to Handy 		*/
#define HHC_F2		2	/* send "Continue" to Handy		*/
#define HHC_F3		3	/* perform "Step" operation		*/
#define HHC_F4		4	/* perform "Step Flat" operation 	*/
#define HHC_F5		5	/* Initiate "Download" on my screen 	*/
#define HHC_F6		6	/* Initiate "Upload" on my screen 	*/
#define HHC_F7		7	/* Setup "Bus Monitor" from my screen	*/
#define HHC_F8		8	/* Perform "Fill Memory" 		*/
#define HHC_F9		9	/* Bootstrap from my screen		*/
#define HHC_F10		10	/* Interrupt Handy with an NMI		*/

#define HHC_SHIFT_F1	11
#define HHC_SHIFT_F2	12
#define HHC_SHIFT_F3	13
#define HHC_SHIFT_F4	14
#define HHC_SHIFT_F5	15
#define HHC_SHIFT_F6	16
#define HHC_SHIFT_F7	17
#define HHC_SHIFT_F8	18
#define HHC_SHIFT_F9	19
#define HHC_SHIFT_F10	20

#define HHC_CTRL_C	21
#define HHC_CTRL_D	22
#define HHC_CTRL_S	23
#define HHC_CTRL_T	24
#define HHC_CTRL_Q	25

/* Miscellaneous commands */

#define HDB_ORG		   100	/* set display/upload/download raw address */
#define HDB_DNLOAD_BIN	   101	/* Download specified .BIN format file     */
#define HDB_DNLOAD_RAW	   102	/* Download specified file as raw data     */
#define HDB_DNLOAD_DATA    103	/* Download data buffer as raw data	   */
#define HDB_UPLOAD_BIN	   104	/* Upload data as .BIN format file         */
#define HDB_UPLOAD_RAW	   105	/* Upload data to unformatted file         */
#define HDB_UPLOAD_DATA    106	/* Upload raw data to buffer		   */
#define	HDB_LOAD_REGS	   110	/* load new register values                */
#define	HDB_SET_GO	   111	/* set the starting address for a GO cmd   */ 
#define	HDB_SET_MEMWATCH   112	/* set the specified MEMWATCH field        */
#define	HDB_SET_BREAKPOINT 113  /* set the specified breakpoint            */

/*
 * Special considerations:
 *
 *  For the following commands, "HandyCommands.Buffer" is a pointer to a
 *  buffer containing a null-terminated file name string:
 *	HDB_DNLOAD_BIN	HDB_UPLOAD_BIN
 *	HDB_DNLOAD_RAW	HDB_UPLOAD_RAW
 *
 *  For the following commands, "HandyCommands.Buffer" is a pointer to a
 *  data buffer, and "HandyCommands.Size" is the buffer size:
 *	HDB_DNLOAD_DATA	HDB_UPLOAD_DATA
 *
 *  For the following commands, "HandyCommands.Size" is a 16-bit 
 *  6502 address:
 *	HDB_ORG         HDB_SET_GO
 *
 *  For all the miscellaneous commands, a return code is placed in the 
 *  field "HandyCommands.Code" before replying to the message:
 *	TRUE	if the command was successful
 *	FALSE	if the command failed
 */


#define HANDEBUG_COMMANDS	((UBYTE *)"HandebugCommands")
#define HHC_REPLY_NAME		((UBYTE *)"HHCReplyPort")


#define HANDY_GO			HHC_F1
#define HANDY_CONTINUE		HHC_F2
#define HANDY_STEP			HHC_F3
#define HANDY_STEPFLAT		HHC_F4
#define HANDY_DOWNLOAD		HHC_F5
#define HANDY_UPLOAD		HHC_F6
#define HANDY_BUSMONITOR	HHC_F7
#define HANDY_FILLMEMORY	HHC_F8
#define HANDY_BOOTLOAD		HHC_F9
#define	HANDY_NMI			HHC_F10


