opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6446"

opt pagewidth 120

	opt lm

	processor	16F684
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 1 "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\header.h"
	psect config,class=CONFIG,delta=2 ;#
# 1 "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\header.h"
	dw 0x37FF & 0x3BFF & 0x3DFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FEF & 0x3FF7 & 0x3FFC ;#
	FNCALL	_main,_init
	FNCALL	_main,_delay
	FNCALL	_main,_Wand_Text
	FNCALL	_Wand_Text,_karakteratvalto
	FNCALL	_Wand_Text,_karakter
	FNCALL	_karakter,___wmul
	FNCALL	_karakter,_delay
	FNROOT	_main
	FNCALL	_isr,i1_delay
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	karakteratvalto@chars
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
	line	211

;initializer for karakteratvalto@chars
	retlw	041h
	retlw	042h
	retlw	043h
	retlw	044h
	retlw	045h
	retlw	046h
	retlw	047h
	retlw	048h
	retlw	049h
	retlw	04Ah
	retlw	04Bh
	retlw	04Ch
	retlw	04Dh
	retlw	04Eh
	retlw	04Fh
	retlw	050h
	retlw	051h
	retlw	052h
	retlw	053h
	retlw	054h
	retlw	055h
	retlw	056h
	retlw	057h
	retlw	058h
	retlw	059h
	retlw	05Ah
	retlw	030h
	retlw	031h
	retlw	032h
	retlw	033h
	retlw	034h
	retlw	035h
	retlw	036h
	retlw	037h
	retlw	038h
	retlw	039h
	retlw	02Dh
	retlw	03Ah
	retlw	02Eh
	retlw	020h
	global	_ABC
psect	stringtext,class=STRCODE,delta=2,reloc=256
global __pstringtext
__pstringtext:
;	global	stringtab,__stringbase
stringtab:
;	String table - string pointers are 2 bytes each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:
	movf btemp+1,w
andlw 7Fh
movwf	pclath
	movf	fsr,w
incf fsr
skipnz
incf btemp+1
	movwf pc
__stringbase:
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\abc.c"
	line	2
_ABC:
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	011h
	retlw	01Fh
	retlw	011h
	retlw	011h
	retlw	0
	retlw	01Eh
	retlw	011h
	retlw	01Eh
	retlw	011h
	retlw	011h
	retlw	01Eh
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	010h
	retlw	010h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	01Eh
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	01Eh
	retlw	0
	retlw	01Fh
	retlw	010h
	retlw	01Ch
	retlw	010h
	retlw	010h
	retlw	01Fh
	retlw	0
	retlw	01Fh
	retlw	010h
	retlw	01Ch
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	0
	retlw	0Fh
	retlw	010h
	retlw	017h
	retlw	015h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	011h
	retlw	011h
	retlw	01Fh
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	0
	retlw	0Eh
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	0Eh
	retlw	0
	retlw	07h
	retlw	01h
	retlw	01h
	retlw	01h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	011h
	retlw	012h
	retlw	01Ch
	retlw	014h
	retlw	012h
	retlw	011h
	retlw	0
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	01Fh
	retlw	0
	retlw	011h
	retlw	01Bh
	retlw	015h
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	0
	retlw	011h
	retlw	019h
	retlw	015h
	retlw	015h
	retlw	013h
	retlw	011h
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	01Eh
	retlw	011h
	retlw	01Eh
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	012h
	retlw	0Dh
	retlw	0
	retlw	01Eh
	retlw	011h
	retlw	01Eh
	retlw	014h
	retlw	012h
	retlw	011h
	retlw	0
	retlw	0Fh
	retlw	010h
	retlw	0Ch
	retlw	03h
	retlw	01h
	retlw	01Eh
	retlw	0
	retlw	01Fh
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	0
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	0Ah
	retlw	0Ah
	retlw	04h
	retlw	0
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	015h
	retlw	015h
	retlw	0Ah
	retlw	0
	retlw	011h
	retlw	011h
	retlw	0Ah
	retlw	04h
	retlw	0Ah
	retlw	011h
	retlw	0
	retlw	011h
	retlw	011h
	retlw	0Ah
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	0
	retlw	01Fh
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	01Fh
	retlw	0
	retlw	0Eh
	retlw	013h
	retlw	015h
	retlw	019h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	0Ch
	retlw	014h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	01h
	retlw	06h
	retlw	08h
	retlw	01Fh
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	06h
	retlw	01h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	06h
	retlw	0Ah
	retlw	012h
	retlw	01Fh
	retlw	02h
	retlw	02h
	retlw	0
	retlw	01Fh
	retlw	010h
	retlw	01Eh
	retlw	01h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	0Fh
	retlw	010h
	retlw	016h
	retlw	019h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	01Fh
	retlw	02h
	retlw	04h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	0Eh
	retlw	011h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	0Fh
	retlw	01h
	retlw	01h
	retlw	0Eh
	retlw	0
	retlw	0
	retlw	0
	retlw	0Eh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	04h
	retlw	0
	retlw	0
	retlw	04h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	01h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	abc@ABC
psect	stringtext
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\abc.c"
abc@ABC:
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	011h
	retlw	01Fh
	retlw	011h
	retlw	011h
	retlw	0
	retlw	01Eh
	retlw	011h
	retlw	01Eh
	retlw	011h
	retlw	011h
	retlw	01Eh
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	010h
	retlw	010h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	01Eh
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	01Eh
	retlw	0
	retlw	01Fh
	retlw	010h
	retlw	01Ch
	retlw	010h
	retlw	010h
	retlw	01Fh
	retlw	0
	retlw	01Fh
	retlw	010h
	retlw	01Ch
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	0
	retlw	0Fh
	retlw	010h
	retlw	017h
	retlw	015h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	011h
	retlw	011h
	retlw	01Fh
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	0
	retlw	0Eh
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	0Eh
	retlw	0
	retlw	07h
	retlw	01h
	retlw	01h
	retlw	01h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	011h
	retlw	012h
	retlw	01Ch
	retlw	014h
	retlw	012h
	retlw	011h
	retlw	0
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	01Fh
	retlw	0
	retlw	011h
	retlw	01Bh
	retlw	015h
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	0
	retlw	011h
	retlw	019h
	retlw	015h
	retlw	015h
	retlw	013h
	retlw	011h
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	01Eh
	retlw	011h
	retlw	01Eh
	retlw	010h
	retlw	010h
	retlw	010h
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	012h
	retlw	0Dh
	retlw	0
	retlw	01Eh
	retlw	011h
	retlw	01Eh
	retlw	014h
	retlw	012h
	retlw	011h
	retlw	0
	retlw	0Fh
	retlw	010h
	retlw	0Ch
	retlw	03h
	retlw	01h
	retlw	01Eh
	retlw	0
	retlw	01Fh
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	0
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	0Ah
	retlw	0Ah
	retlw	04h
	retlw	0
	retlw	011h
	retlw	011h
	retlw	011h
	retlw	015h
	retlw	015h
	retlw	0Ah
	retlw	0
	retlw	011h
	retlw	011h
	retlw	0Ah
	retlw	04h
	retlw	0Ah
	retlw	011h
	retlw	0
	retlw	011h
	retlw	011h
	retlw	0Ah
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	0
	retlw	01Fh
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	01Fh
	retlw	0
	retlw	0Eh
	retlw	013h
	retlw	015h
	retlw	019h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	0Ch
	retlw	014h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	04h
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	01h
	retlw	06h
	retlw	08h
	retlw	01Fh
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	06h
	retlw	01h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	06h
	retlw	0Ah
	retlw	012h
	retlw	01Fh
	retlw	02h
	retlw	02h
	retlw	0
	retlw	01Fh
	retlw	010h
	retlw	01Eh
	retlw	01h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	0Fh
	retlw	010h
	retlw	016h
	retlw	019h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	01Fh
	retlw	02h
	retlw	04h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	0Eh
	retlw	011h
	retlw	011h
	retlw	0Eh
	retlw	0
	retlw	0Eh
	retlw	011h
	retlw	0Fh
	retlw	01h
	retlw	01h
	retlw	0Eh
	retlw	0
	retlw	0
	retlw	0
	retlw	0Eh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	04h
	retlw	0
	retlw	0
	retlw	04h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	01h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_ABC
	global	abc@ABC
	global	_timer_count
	global	_mp_count
	global	_CCP1CON
_CCP1CON	set	21
	global	_CMCON0
_CMCON0	set	25
	global	_INTCON
_INTCON	set	11
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_TMR0
_TMR0	set	1
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RAIE
_RAIE	set	91
	global	_RAIF
_RAIF	set	88
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_ANSEL
_ANSEL	set	145
	global	_IOCA
_IOCA	set	150
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PCON
_PCON	set	142
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	
STR_9:	
	retlw	87	;'W'
	retlw	65	;'A'
	retlw	78	;'N'
	retlw	68	;'D'
	retlw	32	;' '
	retlw	67	;'C'
	retlw	0
psect	stringtext
	
STR_6:	
	retlw	66	;'B'
	retlw	69	;'E'
	retlw	65	;'A'
	retlw	67	;'C'
	retlw	72	;'H'
	retlw	0
psect	stringtext
	
STR_4:	
	retlw	77	;'M'
	retlw	65	;'A'
	retlw	82	;'R'
	retlw	84	;'T'
	retlw	73	;'I'
	retlw	0
psect	stringtext
	
STR_7:	
	retlw	84	;'T'
	retlw	73	;'I'
	retlw	82	;'R'
	retlw	79	;'O'
	retlw	76	;'L'
	retlw	0
psect	stringtext
	
STR_8:	
	retlw	77	;'M'
	retlw	85	;'U'
	retlw	84	;'T'
	retlw	69	;'E'
	retlw	82	;'R'
	retlw	0
psect	stringtext
	
STR_3:	
	retlw	76	;'L'
	retlw	65	;'A'
	retlw	67	;'C'
	retlw	73	;'I'
	retlw	0
psect	stringtext
	
STR_2:	
	retlw	65	;'A'
	retlw	78	;'N'
	retlw	68	;'D'
	retlw	73	;'I'
	retlw	0
psect	stringtext
	
STR_1:	
	retlw	80	;'P'
	retlw	69	;'E'
	retlw	84	;'T'
	retlw	73	;'I'
	retlw	0
psect	stringtext
	
STR_5:	
	retlw	79	;'O'
	retlw	80	;'P'
	retlw	69	;'E'
	retlw	76	;'L'
	retlw	0
psect	stringtext
	
STR_10:	
	retlw	68	;'D'
	retlw	80	;'P'
	retlw	84	;'T'
	retlw	80	;'P'
	retlw	0
psect	stringtext
	file	"wandclock.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_timer_count:
       ds      2

_mp_count:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
	line	211
karakteratvalto@chars:
       ds      40

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+40)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?i1_delay
?i1_delay:	; 0 bytes @ 0x0
	global	?_karakteratvalto
?_karakteratvalto:	; 1 bytes @ 0x0
	global	?_isr
?_isr:	; 2 bytes @ 0x0
	global	i1delay@ms
i1delay@ms:	; 2 bytes @ 0x0
	ds	2
	global	??i1_delay
??i1_delay:	; 0 bytes @ 0x2
	ds	1
	global	i1delay@i
i1delay@i:	; 2 bytes @ 0x3
	ds	2
	global	??_isr
??_isr:	; 0 bytes @ 0x5
	ds	5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_init
??_init:	; 0 bytes @ 0x0
	global	??_karakteratvalto
??_karakteratvalto:	; 0 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	delay@ms
delay@ms:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	ds	1
	global	karakteratvalto@karakter
karakteratvalto@karakter:	; 1 bytes @ 0x1
	ds	1
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	karakteratvalto@result
karakteratvalto@result:	; 1 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	ds	1
	global	karakteratvalto@i
karakteratvalto@i:	; 1 bytes @ 0x3
	global	delay@i
delay@i:	; 2 bytes @ 0x3
	ds	1
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	2
	global	?_karakter
?_karakter:	; 0 bytes @ 0x6
	global	karakter@irany
karakter@irany:	; 1 bytes @ 0x6
	ds	1
	global	??_karakter
??_karakter:	; 0 bytes @ 0x7
	ds	5
	global	_karakter$287
_karakter$287:	; 2 bytes @ 0xC
	ds	2
	global	karakter@i
karakter@i:	; 1 bytes @ 0xE
	ds	1
	global	karakter@karakter
karakter@karakter:	; 1 bytes @ 0xF
	ds	1
	global	karakter@mask
karakter@mask:	; 1 bytes @ 0x10
	ds	1
	global	?_Wand_Text
?_Wand_Text:	; 0 bytes @ 0x11
	global	Wand_Text@pointer
Wand_Text@pointer:	; 2 bytes @ 0x11
	ds	2
	global	Wand_Text@irany
Wand_Text@irany:	; 1 bytes @ 0x13
	ds	1
	global	??_Wand_Text
??_Wand_Text:	; 0 bytes @ 0x14
	ds	1
	global	Wand_Text@i
Wand_Text@i:	; 1 bytes @ 0x15
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x16
	ds	1
	global	main@gido
main@gido:	; 2 bytes @ 0x17
	ds	2
	global	main@m
main@m:	; 1 bytes @ 0x19
	ds	1
;;Data sizes: Strings 56, constant 560, data 40, bss 3, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      13
;; BANK0           80     26      66
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; Wand_Text@pointer	PTR unsigned char  size(2) Largest target is 7
;;		 -> STR_10(CODE[5]), STR_9(CODE[7]), STR_8(CODE[6]), STR_7(CODE[6]), 
;;		 -> STR_6(CODE[6]), STR_5(CODE[5]), STR_4(CODE[6]), STR_3(CODE[5]), 
;;		 -> STR_2(CODE[5]), STR_1(CODE[5]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   _isr->i1_delay
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_Wand_Text
;;   _Wand_Text->_karakter
;;   _karakter->___wmul
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0    1122
;;                                             22 BANK0      4     4      0
;;                               _init
;;                              _delay
;;                          _Wand_Text
;; ---------------------------------------------------------------------------------
;; (1) _Wand_Text                                            5     2      3     830
;;                                             17 BANK0      5     2      3
;;                    _karakteratvalto
;;                           _karakter
;; ---------------------------------------------------------------------------------
;; (2) _karakter                                            11    10      1     583
;;                                              6 BANK0     11    10      1
;;                             ___wmul
;;                              _delay
;;                    _karakteratvalto (ARG)
;; ---------------------------------------------------------------------------------
;; (3) ___wmul                                               6     2      4      92
;;                                              0 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; (2) _karakteratvalto                                      4     4      0     135
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _delay                                                5     3      2      46
;;                                              0 BANK0      5     3      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _isr                                                  5     5      0     120
;;                                              5 COMMON     5     5      0
;;                            i1_delay
;; ---------------------------------------------------------------------------------
;; (5) i1_delay                                              5     3      2     120
;;                                              0 COMMON     5     3      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;   _delay
;;   _Wand_Text
;;     _karakteratvalto
;;     _karakter
;;       ___wmul
;;       _delay
;;       _karakteratvalto (ARG)
;;
;; _isr (ROOT)
;;   i1_delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               20      0       0       5        0.0%
;;BITBANK1            20      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      56       8        0.0%
;;ABS                  0      0      4F       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50     1A      42       4       82.5%
;;BITBANK0            50      0       0       3        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      A       D       1       92.9%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 92 in file "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  gido            2   23[BANK0 ] short 
;;  m               1   25[BANK0 ] unsigned char 
;;  i               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       1       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_init
;;		_delay
;;		_Wand_Text
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
	line	92
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2-btemp+1+pclath+cstack]
	line	93
	
l2150:	
;main.c: 93: unsigned char m = 0, i;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@m)
	line	94
	
l2152:	
;main.c: 94: short int gido = 0;
	movlw	low(0)
	movwf	(main@gido)
	movlw	high(0)
	movwf	((main@gido))+1
	line	96
	
l2154:	
;main.c: 96: init();
	fcall	_init
	line	98
;main.c: 98: while (1){
	
l459:	
	line	101
	
l2156:	
;main.c: 101: if(RA2==1){
	bcf	status, 5	;RP0=0, select bank0
	btfss	(42/8),(42)&7
	goto	u2951
	goto	u2950
u2951:
	goto	l460
u2950:
	line	102
	
l2158:	
;main.c: 102: while(RA2==1);
	goto	l461
	
l462:	
	
l461:	
	btfsc	(42/8),(42)&7
	goto	u2961
	goto	u2960
u2961:
	goto	l462
u2960:
	
l463:	
	line	103
;main.c: 103: RC4 = 1;
	bsf	(60/8),(60)&7
	line	104
	
l2160:	
;main.c: 104: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	105
	
l2162:	
;main.c: 105: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(60/8),(60)&7
	line	106
;main.c: 106: delay(5000);
	movlw	low(01388h)
	movwf	(?_delay)
	movlw	high(01388h)
	movwf	((?_delay))+1
	fcall	_delay
	line	107
	
l2164:	
;main.c: 107: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(60/8),(60)&7
	line	108
;main.c: 108: delay(200);
	movlw	low(0C8h)
	movwf	(?_delay)
	movlw	high(0C8h)
	movwf	((?_delay))+1
	fcall	_delay
	line	109
	
l2166:	
;main.c: 109: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(60/8),(60)&7
	line	110
	
l2168:	
;main.c: 110: m++;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@m),f
	line	111
	
l2170:	
;main.c: 111: delay(100);
	movlw	low(064h)
	movwf	(?_delay)
	movlw	high(064h)
	movwf	((?_delay))+1
	fcall	_delay
	line	112
	
l2172:	
;main.c: 112: if(m==10) m=0;
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@m),w
	xorlw	0Ah
	skipz
	goto	u2971
	goto	u2970
u2971:
	goto	l464
u2970:
	
l2174:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(main@m)
	
l464:	
	line	113
;main.c: 113: mp_count = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_mp_count)
	line	114
	
l460:	
	line	116
	
l2176:	
;main.c: 114: }
;main.c: 116: if(RA1 == 1){
	btfss	(41/8),(41)&7
	goto	u2981
	goto	u2980
u2981:
	goto	l465
u2980:
	line	117
	
l2178:	
;main.c: 117: if(m == 0){
	movf	(main@m),f
	skipz
	goto	u2991
	goto	u2990
u2991:
	goto	l466
u2990:
	line	118
	
l2180:	
;main.c: 118: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	119
	
l2182:	
;main.c: 119: Wand_Text("PETI", '1');
	movlw	low(STR_1|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Wand_Text)
	movlw	high(STR_1|8000h)
	movwf	((?_Wand_Text))+1
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_Wand_Text)+02h
	fcall	_Wand_Text
	line	121
;main.c: 121: }else if(m == 1){
	goto	l467
	
l466:	
	
l2184:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@m),w
	xorlw	01h
	skipz
	goto	u3001
	goto	u3000
u3001:
	goto	l468
u3000:
	line	122
	
l2186:	
;main.c: 122: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	123
	
l2188:	
;main.c: 123: Wand_Text("ANDI", '1');
	movlw	low(STR_2|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Wand_Text)
	movlw	high(STR_2|8000h)
	movwf	((?_Wand_Text))+1
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_Wand_Text)+02h
	fcall	_Wand_Text
	line	125
;main.c: 125: }else if(m == 2){
	goto	l469
	
l468:	
	
l2190:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@m),w
	xorlw	02h
	skipz
	goto	u3011
	goto	u3010
u3011:
	goto	l470
u3010:
	line	126
	
l2192:	
;main.c: 126: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	127
	
l2194:	
;main.c: 127: Wand_Text("LACI", '1');
	movlw	low(STR_3|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Wand_Text)
	movlw	high(STR_3|8000h)
	movwf	((?_Wand_Text))+1
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_Wand_Text)+02h
	fcall	_Wand_Text
	line	129
;main.c: 129: }else if(m == 3){
	goto	l471
	
l470:	
	
l2196:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@m),w
	xorlw	03h
	skipz
	goto	u3021
	goto	u3020
u3021:
	goto	l472
u3020:
	line	130
	
l2198:	
;main.c: 130: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	131
	
l2200:	
;main.c: 131: Wand_Text("MARTI", '1');
	movlw	low(STR_4|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Wand_Text)
	movlw	high(STR_4|8000h)
	movwf	((?_Wand_Text))+1
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_Wand_Text)+02h
	fcall	_Wand_Text
	line	133
;main.c: 133: }else if(m == 4){
	goto	l473
	
l472:	
	
l2202:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@m),w
	xorlw	04h
	skipz
	goto	u3031
	goto	u3030
u3031:
	goto	l474
u3030:
	line	134
	
l2204:	
;main.c: 134: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	135
	
l2206:	
;main.c: 135: Wand_Text("OPEL", '1');
	movlw	low(STR_5|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Wand_Text)
	movlw	high(STR_5|8000h)
	movwf	((?_Wand_Text))+1
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_Wand_Text)+02h
	fcall	_Wand_Text
	line	137
;main.c: 137: }else if(m == 5){
	goto	l475
	
l474:	
	
l2208:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@m),w
	xorlw	05h
	skipz
	goto	u3041
	goto	u3040
u3041:
	goto	l476
u3040:
	line	138
	
l2210:	
;main.c: 138: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	139
	
l2212:	
;main.c: 139: Wand_Text("BEACH", '1');
	movlw	low(STR_6|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Wand_Text)
	movlw	high(STR_6|8000h)
	movwf	((?_Wand_Text))+1
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_Wand_Text)+02h
	fcall	_Wand_Text
	line	141
;main.c: 141: }else if(m == 6){
	goto	l477
	
l476:	
	
l2214:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@m),w
	xorlw	06h
	skipz
	goto	u3051
	goto	u3050
u3051:
	goto	l478
u3050:
	line	142
	
l2216:	
;main.c: 142: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	143
	
l2218:	
;main.c: 143: Wand_Text("TIROL", '1');
	movlw	low(STR_7|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Wand_Text)
	movlw	high(STR_7|8000h)
	movwf	((?_Wand_Text))+1
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_Wand_Text)+02h
	fcall	_Wand_Text
	line	145
;main.c: 145: }else if(m == 7){
	goto	l479
	
l478:	
	
l2220:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@m),w
	xorlw	07h
	skipz
	goto	u3061
	goto	u3060
u3061:
	goto	l480
u3060:
	line	146
	
l2222:	
;main.c: 146: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	147
	
l2224:	
;main.c: 147: Wand_Text("MUTER", '1');
	movlw	low(STR_8|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Wand_Text)
	movlw	high(STR_8|8000h)
	movwf	((?_Wand_Text))+1
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_Wand_Text)+02h
	fcall	_Wand_Text
	line	148
;main.c: 148: }else if(m == 8){
	goto	l481
	
l480:	
	
l2226:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@m),w
	xorlw	08h
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l482
u3070:
	line	149
	
l2228:	
;main.c: 149: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	150
	
l2230:	
;main.c: 150: Wand_Text("WAND C", '1');
	movlw	low(STR_9|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Wand_Text)
	movlw	high(STR_9|8000h)
	movwf	((?_Wand_Text))+1
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_Wand_Text)+02h
	fcall	_Wand_Text
	line	152
;main.c: 152: }else if(m == 9){
	goto	l483
	
l482:	
	
l2232:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@m),w
	xorlw	09h
	skipz
	goto	u3081
	goto	u3080
u3081:
	goto	l484
u3080:
	line	153
	
l2234:	
;main.c: 153: delay(2000);
	movlw	low(07D0h)
	movwf	(?_delay)
	movlw	high(07D0h)
	movwf	((?_delay))+1
	fcall	_delay
	line	154
	
l2236:	
;main.c: 154: Wand_Text("DPTP", '1');
	movlw	low(STR_10|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Wand_Text)
	movlw	high(STR_10|8000h)
	movwf	((?_Wand_Text))+1
	movlw	(031h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_Wand_Text)+02h
	fcall	_Wand_Text
	line	155
	
l484:	
	line	156
	
l483:	
	
l481:	
	
l479:	
	
l477:	
	
l475:	
	
l473:	
	
l471:	
	
l469:	
	
l467:	
	
l2238:	
;main.c: 155: }
;main.c: 156: mp_count = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_mp_count)
	line	157
	
l465:	
	line	159
	
l485:	
	line	98
	goto	l459
	
l486:	
	line	161
	
l487:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_Wand_Text
psect	text226,local,class=CODE,delta=2
global __ptext226
__ptext226:

;; *************** function _Wand_Text *****************
;; Defined at:
;;		line 241 in file "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
;; Parameters:    Size  Location     Type
;;  pointer         2   17[BANK0 ] PTR unsigned char 
;;		 -> STR_10(5), STR_9(7), STR_8(6), STR_7(6), 
;;		 -> STR_6(6), STR_5(5), STR_4(6), STR_3(5), 
;;		 -> STR_2(5), STR_1(5), 
;;  irany           1   19[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  i               1   21[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       3       0
;;      Locals:         0       1       0
;;      Temps:          0       1       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_karakteratvalto
;;		_karakter
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text226
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
	line	241
	global	__size_of_Wand_Text
	__size_of_Wand_Text	equ	__end_of_Wand_Text-_Wand_Text
	
_Wand_Text:	
	opt	stack 7
; Regs used in _Wand_Text: [wreg-fsr0h+status,2-btemp+1+pclath+cstack]
	line	242
	
l2142:	
;main.c: 242: unsigned char i=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Wand_Text@i)
	line	243
;main.c: 243: while(pointer[i]){
	goto	l514
	
l515:	
	line	244
	
l2144:	
;main.c: 244: karakter(karakteratvalto(pointer[i]), irany);
	movf	(Wand_Text@irany),w
	movwf	(??_Wand_Text+0)+0
	movf	(??_Wand_Text+0)+0,w
	movwf	(?_karakter)
	movf	(Wand_Text@i),w
	addwf	(Wand_Text@pointer),w
	movwf	fsr0
	movf	(Wand_Text@pointer+1),w
	skipnc
	incf	(Wand_Text@pointer+1),w
	movwf	btemp+1
	fcall	stringtab
	fcall	_karakteratvalto
	fcall	_karakter
	line	245
	
l2146:	
;main.c: 245: i++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_Wand_Text+0)+0
	movf	(??_Wand_Text+0)+0,w
	addwf	(Wand_Text@i),f
	line	246
	
l514:	
	line	243
	
l2148:	
	movf	(Wand_Text@i),w
	addwf	(Wand_Text@pointer),w
	movwf	fsr0
	movf	(Wand_Text@pointer+1),w
	skipnc
	incf	(Wand_Text@pointer+1),w
	movwf	btemp+1
	fcall	stringtab
	iorlw	0
	skipz
	goto	u2941
	goto	u2940
u2941:
	goto	l515
u2940:
	
l516:	
	line	247
	
l517:	
	return
	opt stack 0
GLOBAL	__end_of_Wand_Text
	__end_of_Wand_Text:
;; =============== function _Wand_Text ends ============

	signat	_Wand_Text,8312
	global	_karakter
psect	text227,local,class=CODE,delta=2
global __ptext227
__ptext227:

;; *************** function _karakter *****************
;; Defined at:
;;		line 222 in file "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
;; Parameters:    Size  Location     Type
;;  karakter        1    wreg     unsigned char 
;;  irany           1    6[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  karakter        1   15[BANK0 ] unsigned char 
;;  mask            1   16[BANK0 ] unsigned char 
;;  i               1   14[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       5       0
;;      Temps:          0       5       0
;;      Totals:         0      11       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___wmul
;;		_delay
;; This function is called by:
;;		_Wand_Text
;; This function uses a non-reentrant model
;;
psect	text227
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
	line	222
	global	__size_of_karakter
	__size_of_karakter	equ	__end_of_karakter-_karakter
	
_karakter:	
	opt	stack 6
; Regs used in _karakter: [wreg-fsr0h+status,2-btemp+1+pclath+cstack]
;karakter@karakter stored from wreg
	line	225
	bcf	status, 5	;RP0=0, select bank0
	movwf	(karakter@karakter)
	
l2104:	
;main.c: 223: unsigned char i;
;main.c: 224: unsigned char mask;
;main.c: 225: for(i=0; i<5; i++){
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(karakter@i)
	
l2106:	
	movlw	(05h)
	subwf	(karakter@i),w
	skipc
	goto	u2701
	goto	u2700
u2701:
	goto	l507
u2700:
	
l2108:	
	goto	l508
	
l507:	
	line	226
	
l2110:	
;main.c: 226: mask = (irany=='0') ? i : 4-i;
	movf	(karakter@i),w
	movwf	(??_karakter+0)+0
	clrf	(??_karakter+0)+0+1
	comf	(??_karakter+0)+0,f
	comf	(??_karakter+0)+1,f
	incf	(??_karakter+0)+0,f
	skipnz
	incf	(??_karakter+0)+1,f
	movf	0+(??_karakter+0)+0,w
	addlw	low(04h)
	movwf	(_karakter$287)
	movf	1+(??_karakter+0)+0,w
	skipnc
	addlw	1
	addlw	high(04h)
	movwf	1+(_karakter$287)
	
l2112:	
	movf	(karakter@irany),w
	xorlw	030h
	skipz
	goto	u2711
	goto	u2710
u2711:
	goto	l510
u2710:
	
l2114:	
	movf	(karakter@i),w
	movwf	(??_karakter+0)+0
	clrf	(??_karakter+0)+0+1
	movf	0+(??_karakter+0)+0,w
	movwf	(_karakter$287)
	movf	1+(??_karakter+0)+0,w
	movwf	(_karakter$287+1)
	
l510:	
	movf	(_karakter$287),w
	movwf	(??_karakter+0)+0
	movf	(??_karakter+0)+0,w
	movwf	(karakter@mask)
	line	227
	
l2116:	
;main.c: 227: RA0 = ABC[karakter][6]>>mask;
	movf	(karakter@karakter),w
	movwf	(??_karakter+0)+0
	clrf	(??_karakter+0)+0+1
	movf	0+(??_karakter+0)+0,w
	movwf	(?___wmul)
	movf	1+(??_karakter+0)+0,w
	movwf	(?___wmul+1)
	movlw	low(07h)
	movwf	0+(?___wmul)+02h
	movlw	high(07h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___wmul)),w
	addlw	low(06h)
	movwf	(??_karakter+2)+0
	movf	(1+(?___wmul)),w
	skipnc
	addlw	1
	addlw	high(06h)
	movwf	1+(??_karakter+2)+0
	movlw	high(_ABC|8000h)
	addwf	1+(??_karakter+2)+0,w
	movwf	btemp+1
	movlw	low(_ABC|8000h)
	addwf	0+(??_karakter+2)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_karakter+4)+0
	incf	(karakter@mask),w
	goto	u2724
u2725:
	clrc
	rrf	(??_karakter+4)+0,f
u2724:
	addlw	-1
	skipz
	goto	u2725
	btfsc	0+(??_karakter+4)+0,0
	goto	u2731
	goto	u2730
	
u2731:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(40/8),(40)&7
	goto	u2744
u2730:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
u2744:
	line	228
	
l2118:	
;main.c: 228: RC0 = ABC[karakter][5]>>mask;
	movf	(karakter@karakter),w
	movwf	(??_karakter+0)+0
	clrf	(??_karakter+0)+0+1
	movf	0+(??_karakter+0)+0,w
	movwf	(?___wmul)
	movf	1+(??_karakter+0)+0,w
	movwf	(?___wmul+1)
	movlw	low(07h)
	movwf	0+(?___wmul)+02h
	movlw	high(07h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___wmul)),w
	addlw	low(05h)
	movwf	(??_karakter+2)+0
	movf	(1+(?___wmul)),w
	skipnc
	addlw	1
	addlw	high(05h)
	movwf	1+(??_karakter+2)+0
	movlw	high(_ABC|8000h)
	addwf	1+(??_karakter+2)+0,w
	movwf	btemp+1
	movlw	low(_ABC|8000h)
	addwf	0+(??_karakter+2)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_karakter+4)+0
	incf	(karakter@mask),w
	goto	u2754
u2755:
	clrc
	rrf	(??_karakter+4)+0,f
u2754:
	addlw	-1
	skipz
	goto	u2755
	btfsc	0+(??_karakter+4)+0,0
	goto	u2761
	goto	u2760
	
u2761:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	u2774
u2760:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
u2774:
	line	229
	
l2120:	
;main.c: 229: RC1 = ABC[karakter][4]>>mask;
	movf	(karakter@karakter),w
	movwf	(??_karakter+0)+0
	clrf	(??_karakter+0)+0+1
	movf	0+(??_karakter+0)+0,w
	movwf	(?___wmul)
	movf	1+(??_karakter+0)+0,w
	movwf	(?___wmul+1)
	movlw	low(07h)
	movwf	0+(?___wmul)+02h
	movlw	high(07h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___wmul)),w
	addlw	low(04h)
	movwf	(??_karakter+2)+0
	movf	(1+(?___wmul)),w
	skipnc
	addlw	1
	addlw	high(04h)
	movwf	1+(??_karakter+2)+0
	movlw	high(_ABC|8000h)
	addwf	1+(??_karakter+2)+0,w
	movwf	btemp+1
	movlw	low(_ABC|8000h)
	addwf	0+(??_karakter+2)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_karakter+4)+0
	incf	(karakter@mask),w
	goto	u2784
u2785:
	clrc
	rrf	(??_karakter+4)+0,f
u2784:
	addlw	-1
	skipz
	goto	u2785
	btfsc	0+(??_karakter+4)+0,0
	goto	u2791
	goto	u2790
	
u2791:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	goto	u2804
u2790:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
u2804:
	line	230
	
l2122:	
;main.c: 230: RC2 = ABC[karakter][3]>>mask;
	movf	(karakter@karakter),w
	movwf	(??_karakter+0)+0
	clrf	(??_karakter+0)+0+1
	movf	0+(??_karakter+0)+0,w
	movwf	(?___wmul)
	movf	1+(??_karakter+0)+0,w
	movwf	(?___wmul+1)
	movlw	low(07h)
	movwf	0+(?___wmul)+02h
	movlw	high(07h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___wmul)),w
	addlw	low(03h)
	movwf	(??_karakter+2)+0
	movf	(1+(?___wmul)),w
	skipnc
	addlw	1
	addlw	high(03h)
	movwf	1+(??_karakter+2)+0
	movlw	high(_ABC|8000h)
	addwf	1+(??_karakter+2)+0,w
	movwf	btemp+1
	movlw	low(_ABC|8000h)
	addwf	0+(??_karakter+2)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_karakter+4)+0
	incf	(karakter@mask),w
	goto	u2814
u2815:
	clrc
	rrf	(??_karakter+4)+0,f
u2814:
	addlw	-1
	skipz
	goto	u2815
	btfsc	0+(??_karakter+4)+0,0
	goto	u2821
	goto	u2820
	
u2821:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(58/8),(58)&7
	goto	u2834
u2820:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(58/8),(58)&7
u2834:
	line	231
	
l2124:	
;main.c: 231: RC5 = ABC[karakter][2]>>mask;
	movf	(karakter@karakter),w
	movwf	(??_karakter+0)+0
	clrf	(??_karakter+0)+0+1
	movf	0+(??_karakter+0)+0,w
	movwf	(?___wmul)
	movf	1+(??_karakter+0)+0,w
	movwf	(?___wmul+1)
	movlw	low(07h)
	movwf	0+(?___wmul)+02h
	movlw	high(07h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___wmul)),w
	addlw	low(02h)
	movwf	(??_karakter+2)+0
	movf	(1+(?___wmul)),w
	skipnc
	addlw	1
	addlw	high(02h)
	movwf	1+(??_karakter+2)+0
	movlw	high(_ABC|8000h)
	addwf	1+(??_karakter+2)+0,w
	movwf	btemp+1
	movlw	low(_ABC|8000h)
	addwf	0+(??_karakter+2)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_karakter+4)+0
	incf	(karakter@mask),w
	goto	u2844
u2845:
	clrc
	rrf	(??_karakter+4)+0,f
u2844:
	addlw	-1
	skipz
	goto	u2845
	btfsc	0+(??_karakter+4)+0,0
	goto	u2851
	goto	u2850
	
u2851:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(61/8),(61)&7
	goto	u2864
u2850:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(61/8),(61)&7
u2864:
	line	232
	
l2126:	
;main.c: 232: RC3 = ABC[karakter][1]>>mask;
	movf	(karakter@karakter),w
	movwf	(??_karakter+0)+0
	clrf	(??_karakter+0)+0+1
	movf	0+(??_karakter+0)+0,w
	movwf	(?___wmul)
	movf	1+(??_karakter+0)+0,w
	movwf	(?___wmul+1)
	movlw	low(07h)
	movwf	0+(?___wmul)+02h
	movlw	high(07h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?___wmul)),w
	addlw	low(01h)
	movwf	(??_karakter+2)+0
	movf	(1+(?___wmul)),w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(??_karakter+2)+0
	movlw	high(_ABC|8000h)
	addwf	1+(??_karakter+2)+0,w
	movwf	btemp+1
	movlw	low(_ABC|8000h)
	addwf	0+(??_karakter+2)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_karakter+4)+0
	incf	(karakter@mask),w
	goto	u2874
u2875:
	clrc
	rrf	(??_karakter+4)+0,f
u2874:
	addlw	-1
	skipz
	goto	u2875
	btfsc	0+(??_karakter+4)+0,0
	goto	u2881
	goto	u2880
	
u2881:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(59/8),(59)&7
	goto	u2894
u2880:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(59/8),(59)&7
u2894:
	line	233
	
l2128:	
;main.c: 233: RC4 = ABC[karakter][0]>>mask;
	movf	(karakter@karakter),w
	movwf	(??_karakter+0)+0
	clrf	(??_karakter+0)+0+1
	movf	0+(??_karakter+0)+0,w
	movwf	(?___wmul)
	movf	1+(??_karakter+0)+0,w
	movwf	(?___wmul+1)
	movlw	low(07h)
	movwf	0+(?___wmul)+02h
	movlw	high(07h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movlw	high(_ABC|8000h)
	bcf	status, 5	;RP0=0, select bank0
	addwf	(1+(?___wmul)),w
	movwf	btemp+1
	movlw	low(_ABC|8000h)
	addwf	(0+(?___wmul)),w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_karakter+2)+0
	incf	(karakter@mask),w
	goto	u2904
u2905:
	clrc
	rrf	(??_karakter+2)+0,f
u2904:
	addlw	-1
	skipz
	goto	u2905
	btfsc	0+(??_karakter+2)+0,0
	goto	u2911
	goto	u2910
	
u2911:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(60/8),(60)&7
	goto	u2924
u2910:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(60/8),(60)&7
u2924:
	line	234
	
l2130:	
;main.c: 234: delay(80);
	movlw	low(050h)
	movwf	(?_delay)
	movlw	high(050h)
	movwf	((?_delay))+1
	fcall	_delay
	line	235
	
l2132:	
;main.c: 235: RA0 = RC0 = RC1 = RC2 = RC5 = RC3 = RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(60/8),(60)&7
	bcf	(59/8),(59)&7
	bcf	(61/8),(61)&7
	bcf	(58/8),(58)&7
	bcf	(57/8),(57)&7
	bcf	(56/8),(56)&7
	bcf	(40/8),(40)&7
	line	236
	
l2134:	
;main.c: 236: delay(80);
	movlw	low(050h)
	movwf	(?_delay)
	movlw	high(050h)
	movwf	((?_delay))+1
	fcall	_delay
	line	225
	
l2136:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_karakter+0)+0
	movf	(??_karakter+0)+0,w
	addwf	(karakter@i),f
	
l2138:	
	movlw	(05h)
	subwf	(karakter@i),w
	skipc
	goto	u2931
	goto	u2930
u2931:
	goto	l507
u2930:
	
l508:	
	line	238
	
l2140:	
;main.c: 237: }
;main.c: 238: delay(120);
	movlw	low(078h)
	movwf	(?_delay)
	movlw	high(078h)
	movwf	((?_delay))+1
	fcall	_delay
	line	239
	
l511:	
	return
	opt stack 0
GLOBAL	__end_of_karakter
	__end_of_karakter:
;; =============== function _karakter ends ============

	signat	_karakter,8312
	global	___wmul
psect	text228,local,class=CODE,delta=2
global __ptext228
__ptext228:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[BANK0 ] unsigned int 
;;  multiplicand    2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_karakter
;; This function uses a non-reentrant model
;;
psect	text228
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 5
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l2092:	
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___wmul@product)
	movlw	high(0)
	movwf	((___wmul@product))+1
	line	6
	
l528:	
	line	7
	
l2094:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2661
	goto	u2660
u2661:
	goto	l529
u2660:
	line	8
	
l2096:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l529:	
	line	9
	movlw	01h
	
u2675:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u2675
	line	10
	
l2098:	
	movlw	01h
	
u2685:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u2685
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2691
	goto	u2690
u2691:
	goto	l528
u2690:
	
l530:	
	line	12
	
l2100:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	
l2102:	
	line	13
	
l531:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_karakteratvalto
psect	text229,local,class=CODE,delta=2
global __ptext229
__ptext229:

;; *************** function _karakteratvalto *****************
;; Defined at:
;;		line 210 in file "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
;; Parameters:    Size  Location     Type
;;  karakter        1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  karakter        1    1[BANK0 ] unsigned char 
;;  i               1    3[BANK0 ] unsigned char 
;;  result          1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       1       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Wand_Text
;; This function uses a non-reentrant model
;;
psect	text229
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
	line	210
	global	__size_of_karakteratvalto
	__size_of_karakteratvalto	equ	__end_of_karakteratvalto-_karakteratvalto
	
_karakteratvalto:	
	opt	stack 6
; Regs used in _karakteratvalto: [wreg-fsr0h+status,2+status,0]
;karakteratvalto@karakter stored from wreg
	line	213
	bcf	status, 5	;RP0=0, select bank0
	movwf	(karakteratvalto@karakter)
	
l2074:	
;main.c: 211: static char chars[40] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-:. ";
;main.c: 212: unsigned char i, result;
;main.c: 213: for(i=0; i<40; i++){
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(karakteratvalto@i)
	
l2076:	
	movlw	(028h)
	subwf	(karakteratvalto@i),w
	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l501
u2630:
	
l2078:	
	goto	l502
	
l501:	
	line	214
	
l2080:	
;main.c: 214: if(karakter == chars[i]){
	movf	(karakteratvalto@i),w
	addlw	karakteratvalto@chars&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(karakteratvalto@karakter),w
	skipz
	goto	u2641
	goto	u2640
u2641:
	goto	l503
u2640:
	line	215
	
l2082:	
;main.c: 215: result = i;
	movf	(karakteratvalto@i),w
	movwf	(??_karakteratvalto+0)+0
	movf	(??_karakteratvalto+0)+0,w
	movwf	(karakteratvalto@result)
	line	216
;main.c: 216: break;
	goto	l502
	line	217
	
l503:	
	line	213
	
l2084:	
	movlw	(01h)
	movwf	(??_karakteratvalto+0)+0
	movf	(??_karakteratvalto+0)+0,w
	addwf	(karakteratvalto@i),f
	
l2086:	
	movlw	(028h)
	subwf	(karakteratvalto@i),w
	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l501
u2650:
	
l502:	
	line	219
	
l2088:	
;main.c: 217: }
;main.c: 218: }
;main.c: 219: return result;
	movf	(karakteratvalto@result),w
	
l2090:	
	line	220
	
l504:	
	return
	opt stack 0
GLOBAL	__end_of_karakteratvalto
	__end_of_karakteratvalto:
;; =============== function _karakteratvalto ends ============

	signat	_karakteratvalto,4217
	global	_init
psect	text230,local,class=CODE,delta=2
global __ptext230
__ptext230:

;; *************** function _init *****************
;; Defined at:
;;		line 166 in file "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text230
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
	line	166
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 7
; Regs used in _init: [wreg+status,2]
	line	168
	
l2046:	
;main.c: 168: ANSEL = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(145)^080h	;volatile
	line	169
	
l2048:	
;main.c: 169: CMCON0 = 7;
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	170
	
l2050:	
;main.c: 170: CCP1CON = 0;
	clrf	(21)	;volatile
	line	171
	
l2052:	
;main.c: 171: INTCON = 0;
	clrf	(11)	;volatile
	line	172
	
l2054:	
;main.c: 172: PEIE = 1;
	bsf	(94/8),(94)&7
	line	173
	
l2056:	
;main.c: 173: GIE = 1;
	bsf	(95/8),(95)&7
	line	174
	
l2058:	
;main.c: 174: OSCCON = 0b01110000;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	177
	
l2060:	
;main.c: 177: TMR0 = 249;
	movlw	(0F9h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	178
	
l2062:	
;main.c: 178: OPTION = 2;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	179
	
l2064:	
;main.c: 179: T0IE = 1;
	bsf	(93/8),(93)&7
	line	194
;main.c: 194: IOCA = 0;
	clrf	(150)^080h	;volatile
	line	195
	
l2066:	
;main.c: 195: RAIF = 0;
	bcf	(88/8),(88)&7
	line	196
	
l2068:	
;main.c: 196: RAIE = 1;
	bsf	(91/8),(91)&7
	line	197
;main.c: 197: TRISC = 0;
	clrf	(135)^080h	;volatile
	line	198
	
l2070:	
;main.c: 198: TRISA = 6;
	movlw	(06h)
	movwf	(133)^080h	;volatile
	line	199
	
l2072:	
;main.c: 199: PCON = 0b0010000;
	movlw	(010h)
	movwf	(142)^080h	;volatile
	line	200
;main.c: 200: PORTC = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	201
;main.c: 201: PORTA = 0;
	clrf	(5)	;volatile
	line	202
	
l490:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_delay
psect	text231,local,class=CODE,delta=2
global __ptext231
__ptext231:

;; *************** function _delay *****************
;; Defined at:
;;		line 205 in file "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
;; Parameters:    Size  Location     Type
;;  ms              2    0[BANK0 ] short 
;; Auto vars:     Size  Location     Type
;;  i               2    3[BANK0 ] short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_karakter
;; This function uses a non-reentrant model
;;
psect	text231
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
	line	205
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 5
; Regs used in _delay: [wreg]
	line	207
	
l2042:	
;main.c: 206: short int i;
;main.c: 207: for(i=0; i<=ms; i++);
	movlw	low(0)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(delay@i)
	movlw	high(0)
	movwf	((delay@i))+1
	goto	l493
	
l494:	
	
l2044:	
	movlw	low(01h)
	addwf	(delay@i),f
	skipnc
	incf	(delay@i+1),f
	movlw	high(01h)
	addwf	(delay@i+1),f
	
l493:	
	movf	(delay@ms+1),w
	xorlw	80h
	movwf	(??_delay+0)+0
	movf	(delay@i+1),w
	xorlw	80h
	subwf	(??_delay+0)+0,w
	skipz
	goto	u2625
	movf	(delay@i),w
	subwf	(delay@ms),w
u2625:

	skipnc
	goto	u2621
	goto	u2620
u2621:
	goto	l494
u2620:
	
l495:	
	line	208
	
l496:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_isr
psect	text232,local,class=CODE,delta=2
global __ptext232
__ptext232:

;; *************** function _isr *****************
;; Defined at:
;;		line 51 in file "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  452[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          5       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_delay
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text232
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
	line	51
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 4
; Regs used in _isr: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_isr+1)
	movf	fsr0,w
	movwf	(??_isr+2)
	movf	pclath,w
	movwf	(??_isr+3)
	movf	btemp+1,w
	movwf	(??_isr+4)
	ljmp	_isr
psect	text232
	line	54
	
i1l990:	
;main.c: 54: timer_count++;
	movlw	low(01h)
	addwf	(_timer_count),f
	skipnc
	incf	(_timer_count+1),f
	movlw	high(01h)
	addwf	(_timer_count+1),f
	line	56
;main.c: 56: if(timer_count >= 1000){
	movlw	high(03E8h)
	subwf	(_timer_count+1),w
	movlw	low(03E8h)
	skipnz
	subwf	(_timer_count),w
	skipc
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l453
u1_20:
	line	57
	
i1l992:	
;main.c: 57: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(60/8),(60)&7
	line	58
	
i1l994:	
;main.c: 58: delay(100);
	movlw	low(064h)
	movwf	(?i1_delay)
	movlw	high(064h)
	movwf	((?i1_delay))+1
	fcall	i1_delay
	line	59
	
i1l996:	
;main.c: 59: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(60/8),(60)&7
	line	60
	
i1l998:	
;main.c: 60: timer_count = 0;
	movlw	low(0)
	movwf	(_timer_count)
	movlw	high(0)
	movwf	((_timer_count))+1
	line	61
	
i1l1000:	
;main.c: 61: mp_count++;
	movlw	(01h)
	movwf	(??_isr+0)+0
	movf	(??_isr+0)+0,w
	addwf	(_mp_count),f
	line	62
	
i1l1002:	
;main.c: 62: if(mp_count >= 30){
	movlw	(01Eh)
	subwf	(_mp_count),w
	skipc
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l454
u2_20:
	line	63
	
i1l1004:	
;main.c: 63: TRISA = 4;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	64
	
i1l1006:	
;main.c: 64: TRISC = 0;
	clrf	(135)^080h	;volatile
	line	65
	
i1l1008:	
;main.c: 65: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	66
	
i1l1010:	
;main.c: 66: PORTC = 0;
	clrf	(7)	;volatile
	line	67
	
i1l1012:	
;main.c: 67: IOCA = 0b00000100;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	68
	
i1l1014:	
;main.c: 68: T0IE = 0;
	bcf	(93/8),(93)&7
	line	69
	
i1l1016:	
;main.c: 69: mp_count = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_mp_count)
	line	70
	
i1l1018:	
;main.c: 70: timer_count = 0;
	movlw	low(0)
	movwf	(_timer_count)
	movlw	high(0)
	movwf	((_timer_count))+1
	line	71
	
i1l1020:	
# 71 "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
SLEEP ;#
psect	text232
	line	72
	
i1l454:	
	line	73
	
i1l453:	
	line	75
	
i1l1022:	
;main.c: 72: }
;main.c: 73: }
;main.c: 75: if(RAIF == 1){
	btfss	(88/8),(88)&7
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l455
u3_20:
	line	76
	
i1l1024:	
;main.c: 76: RAIF = 0;
	bcf	(88/8),(88)&7
	line	77
	
i1l1026:	
;main.c: 77: IOCA = 0;
	clrf	(150)^080h	;volatile
	line	78
	
i1l1028:	
;main.c: 78: RAIF = 0;
	bcf	(88/8),(88)&7
	line	79
	
i1l1030:	
;main.c: 79: TRISA = 6;
	movlw	(06h)
	movwf	(133)^080h	;volatile
	line	80
	
i1l1032:	
;main.c: 80: TRISC = 0;
	clrf	(135)^080h	;volatile
	line	81
	
i1l1034:	
;main.c: 81: PORTA = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	82
	
i1l1036:	
;main.c: 82: PORTC = 0;
	clrf	(7)	;volatile
	line	83
	
i1l1038:	
;main.c: 83: T0IE = 1;
	bsf	(93/8),(93)&7
	line	84
	
i1l1040:	
# 84 "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
NOP ;#
psect	text232
	line	85
	
i1l455:	
	line	89
	
i1l1042:	
;main.c: 85: }
;main.c: 89: T0IF = 0;
	bcf	(90/8),(90)&7
	line	90
	
i1l456:	
	movf	(??_isr+4),w
	movwf	btemp+1
	movf	(??_isr+3),w
	movwf	pclath
	movf	(??_isr+2),w
	movwf	fsr0
	movf	(??_isr+1),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,90
	global	i1_delay
psect	text233,local,class=CODE,delta=2
global __ptext233
__ptext233:

;; *************** function i1_delay *****************
;; Defined at:
;;		line 205 in file "C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
;; Parameters:    Size  Location     Type
;;  delay           2    0[COMMON] short 
;; Auto vars:     Size  Location     Type
;;  delay           2    3[COMMON] short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text233
	file	"C:\Users\DPTP\Google Drive\DPTP\PIC_Programozas\P16F684\wandclock\main.c"
	line	205
	global	__size_ofi1_delay
	__size_ofi1_delay	equ	__end_ofi1_delay-i1_delay
	
i1_delay:	
	opt	stack 3
; Regs used in i1_delay: [wreg]
	line	207
	
i1l1888:	
;main.c: 206: short int i;
;main.c: 207: for(i=0; i<=ms; i++);
	movlw	low(0)
	movwf	(i1delay@i)
	movlw	high(0)
	movwf	((i1delay@i))+1
	goto	i1l493
	
i1l494:	
	
i1l1890:	
	movlw	low(01h)
	addwf	(i1delay@i),f
	skipnc
	incf	(i1delay@i+1),f
	movlw	high(01h)
	addwf	(i1delay@i+1),f
	
i1l493:	
	movf	(i1delay@ms+1),w
	xorlw	80h
	movwf	(??i1_delay+0)+0
	movf	(i1delay@i+1),w
	xorlw	80h
	subwf	(??i1_delay+0)+0,w
	skipz
	goto	u222_25
	movf	(i1delay@i),w
	subwf	(i1delay@ms),w
u222_25:

	skipnc
	goto	u222_21
	goto	u222_20
u222_21:
	goto	i1l494
u222_20:
	
i1l495:	
	line	208
	
i1l496:	
	return
	opt stack 0
GLOBAL	__end_ofi1_delay
	__end_ofi1_delay:
;; =============== function i1_delay ends ============

	signat	i1_delay,88
psect	text234,local,class=CODE,delta=2
global __ptext234
__ptext234:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
