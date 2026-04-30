
* === hsfx.i ================================================================
* 
* Handy Sound Effects Driver Definitions  --  Handy Software
* 
* Confidential and Proprietary
* Copyright (C) 1989, Epyx, Inc.
* 
* Date       Name              Description
* ---------  ----------------  ----------------------------------------------
* 11 May 89  -RJ               Made AUDIO_TIMER definition redefinable.  
*                              Added AUDIO_CLOCK and AUDIO_PRELOAD
* 22 Mar 89  -RJ               Added FREECHANNEL and NOCHANNEL definitions
* 21 Mar 89  -RJ               Commented out CES_SLOWCLOCK
* 4 Jan 88   =RJ Mical=        Added AUDIO_TIMER definition and more
* Late 88    RG Goudy          Created this file!
* 
* ===========================================================================


* This defines the total number of accumulators and interpolators

	#IFNDEF	HSFX_CHANNELCOUNT
HSFX_CHANNELCOUNT	.=	4	; number of HSFX channels
	#ENDIF				; you may redefine from 1 to 4

HSFX_REGSIZE		.EQU	2	; bytes per accumulator or interpolator
					; (must be 2 for this code)
HSFX_ACCUMCOUNT		.EQU	4	; number of accumulators
					;
HSFX_REGCOUNT		.EQU	2*HSFX_ACCUMCOUNT ; total number of hsfx registers




 #IFNDEF AUDIO_TIMER
AUDIO_TIMER		.=	6
 #ENDIF
 #IFNDEF AUDIO_CLOCK_MASK
AUDIO_CLOCK_MASK	.=	6		; 64uS clock
 #ENDIF
 #IFNDEF AUDIO_PRELOAD
AUDIO_PRELOAD		.=	64
 #ENDIF


HSFX_FREECHANNEL	.EQU	0	; This channel is free and available
HSFX_LILPRIORITY	.EQU	$01	; Minimum allowable priority
HSFX_BIGPRIORITY	.EQU	$FE	; Maximum allowable priority
HSFX_NOCHANNEL		.EQU	$FF	; Channel not available to HSFX


* HSFX keyframe entry flags
LOOP0			.EQU $8000	; one 'loop start' flag
NEXT0			.EQU $4000	; one 'loop end' flag
LOOP1			.EQU $2000	; another 'loop start' flag
NEXT1			.EQU $1000	; another 'loop end' flag
FREQ_ACCUM		.EQU $0800	; frequency accumulator
SHIFT_ACCUM		.EQU $0400	; shifter absolute store
FBACK_ACCUM		.EQU $0200	; feedback accumulator
VOL_ACCUM		.EQU $0100	; volume accumulator
FREQ_INTERP		.EQU $80	; frequency interpolation
SHIFT_INTERP		.EQU $40	; shifter interpolation
FBACK_INTERP		.EQU $20	; feedback interpolation
VOL_INTERP		.EQU $10	; volume interpolation
INTEGRATE		.EQU $08	; integration - 1=on, 0=off
SHIFT_ALWAYS		.EQU $04	; store shifter every frame
; 			.EQU $02	; ignored
END_OF_EFFECT		.EQU $01	; end of effect (last bit tested)


