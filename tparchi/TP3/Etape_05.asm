			org		$4

Vector_001	dc.l	Main

			org		$500
			
Main		movea.l	#String1,a0
			jsr		AlphaCount
			
			movea.l	#String2,a0
			jsr		AlphaCount
			
			illegal
			
LowerCount	movem.l	d1/a0,-(a7)
			
			clr.l	d0

\loop		move.b	(a0)+,d1
			beq		\quit
			
			cmp.b	#'a',d1
			blo		\loop
			
			cmp.b	#'z',d1
			bhi		\loop
			
			addq.l	#1,d0
			bra		\loop
			
\quit		movem.l	(a7)+,d1/d0
			rts
			
UpperCount	movem.l d1/a0,-(a7)
			
			clr.l	d0
			
\looop		move.b	(a0)+,d1
			beq		\quit
			
			cmp.b	#'A',d1
			blo		\looop
			
			cmp.b	#'Z',d1
			bhi		\looop
			
			addq.l	#1,d0
			bra		\looop
\quit		movem.l	(a7)+,d1/d0
			rts
			
DigitCount	movem.l	d1/a0,-(a7)

			clr.l	d0
			
\lop		move.b	(a0)+,d1
			beq		\quit
			
			cmp.b	#'1',d1
			blo		\lop
			
			cmp.b	#'9',d1
			bhi 	\lop
			
			addq.l	#1,d0
			bra		\lop
			
\quit		movem.l	(a7)+,d1/d0
			rts
			
AlphaCount	jsr		DigitCount
			move	d0,-(a7)
			
			jsr 	UpperCount
			move	d0,(a7)
			
			jsr		LowerCount
			move	(a7)+,d0
			
			rts
			
String1     dc.b	"Cette chaine comporte 46 caracteres alphanumeriques.",0
String2     dc.b	"Celle-ci en comporte 19.",0
