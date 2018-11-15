			org		$4
			
Vector_001	dc.l	Main

			org		$500
			
Main		move.l	#-1,d0

Abs			tst	d0
			bmi		Next1
			bra		quit
			
Next1		neg.l	d0

quit		illegal


