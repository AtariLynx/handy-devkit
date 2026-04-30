; Tuesday 24-Apr-90 15:14:27
* === hmusic.i ==============================================================
* 
* Handy Music Definitions  --  Handy Software
* 
* Confidential and Proprietary
* Copyright (C) 1989, Epyx, Inc.
* 
* Date		Name		Description
* ---------	--------------	----------------------------------------------
* 18-Apr-90	SHL		Added HMUSIC_DEFAULT_PRIORITY
* 11 Sep 89	Stephen Jungels	Added song header and note masks.
* 17 Apr 89	-RJ		Added "safe" declaration of HMUSIC_USERCOUNT 
*				and HMUSIC_CHANNELCOUNT
* 21 Mar 89	=RJ Mical=	Added HANDYMUSIC definition, comments, header
* Feb 89	RG Goudy	Created this file!
* 
* ===========================================================================



	#IFNDEF	HANDYMUSIC
HANDYMUSIC	.EQU	1
	#ENDIF


* These declarations are done in case the programmer wishes to use the 
* defaults.  If any of these constants is already defined, it isn't 
* redefined here. However, if not yet defined then when defined it's defined 
* using .= so the programmer can safely redefine these after this file 
* has been included. (though they must defined to the true values before 
* the hmusic source code is included!)
	#IFNDEF	HMUSIC_USERCOUNT
HMUSIC_USERCOUNT	.= 4
	#ENDIF
	#IFNDEF	HMUSIC_CHANNELCOUNT
HMUSIC_CHANNELCOUNT	.= 4
	#ENDIF

	#IFNDEF HMUSIC_DEFAULT_PRIORITY
HMUSIC_DEFAULT_PRIORITY	.= 100
	#ENDIF

* music table flags
; LOOP0		.EQU $8000	; inner 'loop start' flag
; NEXT0		.EQU $4000	; inner 'loop end' flag
; LOOP1		.EQU $2000	; outer 'loop start' flag
; NEXT1		.EQU $1000	; outer 'loop end' flag
RING		.EQU $0800	; gosub to programmers
; future [AGS?]	.EQU $0400	;
ASD		.EQU $0200	;
AGD		.EQU $0100	;

COMMAND		.EQU $80	; Command Flag Word
EXPAND_CFW	.EQU $40	; Expand CFW to 2 words of flags
MSFX		.EQU $20	; "Music calls an effect" flag
USER		.EQU $10	; Call user routine
DURATION	.EQU $08	; New duration table pointer follows
PITCH		.EQU $04	; New pitch table pointer follows
ESCAPE		.EQU $02	; Do direct store sequence 
END_OF_VOICE	.EQU $01	; Bye-bye!



* Song header layout

SONG_STARTUPVOICE0	.EQU	0	; offsets for "start-up" voice 0
SONG_STARTUPVOICE1	.EQU	2	; offsets for "start-up" voice 1
SONG_STARTUPVOICE2	.EQU	4	; offsets for "start-up" voice 2
SONG_STARTUPVOICE3	.EQU	6	; offsets for "start-up" voice 3
SONG_MAINVOICES		.EQU	8	; number of start-up voices
					; (must change HSPL to make this true)
SONG_VOICEFX_OFFSETS	.EQU	9	; beginning of voice/fx offset table

; 16 bit offsets for each voice or sound effect in the song follow.
; All offsets are relative to the song base address.


* Note bit definition masks

; notes look like 0dddpppp, where d=duration and p=pitch
; bit 7 on signifies this is the beginning of a Command Flag Word
SONG_DURATIONBITS	.EQU	%01110000
SONG_PITCHBITS		.EQU	%00001111
