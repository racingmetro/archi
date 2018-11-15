			org		$4

Vector_001	dc.l	Main

			org		$500
			
Main		move.l	#str1,a0
			jsr		Removespace
			jsr		Ismaxerror
			illegal
			
Removespace	movem.l	d0/a0/a1,-(a7)
			movea.l	a0,a1
			
\loop		move.b	(a0)+,d0
			
			cmpi.l	#' ',d0
			BEQ		\loop
			
			move.b	d0,(a1)+
			bne		\loop
			
\quit		movem.l	(a7)+,d0/a0/a1
			rts
			
Ischarerror	movem.l	d0/a0,-(a7)

\loop		move.b	(a0)+,d0
			beq		\paser
			
			cmpi.b	#'0',d0
			blo		\er
			
			cmpi.b	#'9',d0
			bls		\loop
			
\er			ori.b	#%00000100,ccr
			bra		\quit

\paser		andi.b	#%00000100,ccr
			
\quit		movem.l	(a7)+,d0/a0
			rts
			
StrLen		move.l	a0,-(a7)

			clr.l	d0
			
\loop		tst.b	(a0)+
			beq		\quit
			
			addq.l	#1,d0
			bra		\loop
			
\quit		movea.l	(a7)+,a0
			rts

Ismaxerror	movem.l	d0/a0,-(a7)
			
			jsr 	StrLen
			
			
			cmpi.b	#'5',d0
			bhi		\er
			blo		\paser
			
			cmpi.b	#'3',(a0)+
			bhi		\er
			blo		\paser
			
			cmpi.b	#'2',(a0)+
			bhi		\er
			blo		\paser
			
			cmpi.b	#'7',(a0)+
			bhi		\er
			blo		\paser
			
			cmpi.b	#'6',(a0)+
			bhi		\er
			blo		\paser

			cmpi.b	#'7',(a0)
			bhi		\er
			
\er			ori.b	#%00000100,ccr

\paser		andi.b	#%00000100,ccr
			bra		\quit
			
\quit		movem.l	(a7)+,d0/a0
			rts
str1     	dc.b	"5   +   12",0
