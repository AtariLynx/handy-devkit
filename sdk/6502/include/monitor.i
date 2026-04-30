
* === monitor.i =============================================================
*
* 6502 Debugger Monitor Definitions File  --  Handy Software
*
* Confidential and Proprietary
* Copyright (C) 1988, Epyx, Inc.
*
* Date		Name		Description
* ---------	--------------	---------------------------------------------
* 26-Feb-90	SHL		Minor cleanup
* 7-Feb-90	SHL		Removed Apple emulation compatibility
* 1 May 89	-RJ		Changed MONITOR_ZP_RESERVED to $F8
* 19 Mar 89	-RJ		Changed MONITOR_RAM_RESERVED to $F800
* 16 Mar 89	-RJ		Changed values of BUS_MONITOR and TRACE,
*				added LARGE_DATA
* 14 Mar 89	-RJ		Changed value of MONITOR_RAM_RESERVED
* 26-Dec-88	-RJ		Added HANDEM_NEWDISPLAY
* Early 88	=RJ Mical=	Created this file!
*
* ===========================================================================



	#IFDEF	MONITOR_I	; prevent multiple inclusion
	.END
	#ENDIF
MONITOR_I	.EQU	1



* The hardware interrupt vector table starts at this address
IntTable		.=	$FC00-{8*2}



* These constants define the memory locations reserved by the monitor
* program.  The zero-page definition describes the first reserved address
* in zero-page; all locations from there to the end of zero-page are
* reserved.  With the RAM definition, all locations
* are reserved from that address to the start of Handy hardware, which
* currently lives at $FC00
* Note that the Howard board does not require RAM for its monitor
MONITOR_ZP_RESERVED	.EQU	$00F8
MONITOR_RAM_RESERVED	.EQU	$F900



* These are the offsets of the register data both in the buffer and in the
* data stream when host and monitor are passing the register packet
A_OFFSET		.EQU	0
X_OFFSET		.EQU	1
Y_OFFSET		.EQU	2
S_OFFSET		.EQU	3
PC_OFFSET		.EQU	4
P_OFFSET		.EQU	6



* These define the monitor memory block sizes
REGISTER_BYTECOUNT	.EQU	7
MONITOR_BYTECOUNT	.EQU	16



* These are the definitions of the signals that can be sent to
* the Handebug monitor program after a warm restart.
NOP_REQUEST		.EQU	0
DOWNLOAD_REQUEST	.EQU	1
UPLOAD_REQUEST		.EQU	2
CONTINUE_REQUEST	.EQU	3
SLAVE_REQUEST		.EQU	4
GO_REQUEST		.EQU	5
SEE_HOWARD_REQUEST	.EQU	6
HIDE_HOWARD_REQUEST	.EQU	7



* These are the definitions of the upload/download types
END_OF_FILE		.EQU	$00
ORIGIN			.EQU	$01
DATA			.EQU	$02
RUN_ADDRESS		.EQU	$03
* The assembler reserves the remainder of the low defines up to $0F
REGISTER		.EQU	$10
FILL_MEM		.EQU	$11
LARGE_DATA		.EQU	$12
BUS_MONITOR		.EQU	$13
TRACE			.EQU	$14
BREAK_CONTROLS		.EQU	$15
HOWARD_ABUS		.EQU	$16
HOWARD_BBUS		.EQU	$17
HOWARD_CBUS		.EQU	$18
HOWARD_DBUS		.EQU	$19
ROM			.EQU	$1A


* These are the monitor to host slave requests
UP_THIS_PAGE		.EQU	1
UP_CURRENT_PAGE		.EQU	2
UP_REGISTERS		.EQU	3
UP_MEMWATCH		.EQU	4
UP_HAHDATA		.EQU	5


