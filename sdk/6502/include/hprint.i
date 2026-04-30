
* === hprint.i ==============================================================
* 
* HandyPrint Include File  --  Handy Software
* 
* Confidential and Proprietary
* Copyright (C) 1989, Epyx, Inc.
* 
* Date       Name              Description
* ---------  ----------------  ----------------------------------------------
* 8 Feb 89   =RJ Mical=        Created this file!
* 
* ===========================================================================



* These are the different font types you can request
HPR_DIGIT	.EQU $01
HPR_UPPER	.EQU $02
HPR_LOWER	.EQU $04
HPR_PUNC	.EQU $08
HPR_OTHER	.EQU $10


* These are some common font types
HPR_ALPHA	.EQU HPR_UPPER+HPR_LOWER
HPR_BASIC	.EQU HPR_DIGIT+HPR_UPPER+HPR_PUNC
HPR_ALL		.EQU HPR_DIGIT+HPR_UPPER+HPR_LOWER+HPR_PUNC+HPR_OTHER

	.END


