; Fri Oct 12 11:48:01 1990
*============================================================================
* 
* Handy ComLink
* 
* Confidential and Proprietary
* Copyright (c) 1989,1990 Epyx, Inc.
* 
* Date		Name	Description
* ---------	------	-----------------------------------------------------
* 11-Oct-90	SHL	Added REDEYE_SLOWNESS support for "slow" Redeye
* 15-Mar-90	SHL	Added Long_TIMEOUT
* 12-Mar-90	SHL	Added InterMsgTimeout support
* 26-Feb-90	SHL	Moved hardware bit definitions to harddefs.i
* Aug 28 89	LEA	Created this file
*============================================================================



*---------------------------------------------------------------------------
* COMPILE TIME DEFS
*
*===========================================================================

 #IFNDEF REDEYE_SLOWNESS
REDEYE_SLOWNESS	.EQ 0
 #ENDIF

STDCOM		.eq	PAREN+TXOPEN	; default communication params

COMLINK_TIMER	.eq	1	; used by message manager
COMLINK_TIMER_ADDR .eq TIMER0+{COMLINK_TIMER*4}



MSG_GAP_Divider	.EQ	AUD_4
MSG_GAP_TIMEOUT .eq	380/4	; actual value stuffed into timer

TxToRx_Divider	.EQ	AUD_1
TxToRx_TIMEOUT	.EQ	176-60	; actual value stuffed into timer for fast irq

 #IF REDEYE_SLOWNESS = 0
TxToRx_SLOW	.eq	176-60	; actual value stuffed into timer for fast irq
 #ENDIF
 #IF REDEYE_SLOWNESS = 1
TxToRx_SLOW	.eq	176-30	; actual value stuffed into timer for fast irq
 #ENDIF
 #IF REDEYE_SLOWNESS = 2
TxToRx_SLOW	.eq	176-15	; actual value stuffed into timer for fast irq
 #ENDIF
 #IF REDEYE_SLOWNESS = 3
TxToRx_SLOW	.eq	176-0	; actual value stuffed into timer for fast irq
 #ENDIF

InterMsg_Divider .EQ	AUD_4
InterMsg_TIMEOUT .eq	1000/4

Long_Divider	.eq	AUD_64
Long_TIMEOUT	.eq	16000/64



* RxMsgStat bit definitions
MSG_CHECKSUM_ERR	.eq $80
MSG_SIZE_ERR		.eq $40
;PARERR			.eq $10		; same as SERCTL bit
;OVERRUN		.eq $08		; same as SERCTL bit
;FRAMERR		.eq $04		; same as SERCTL bit


