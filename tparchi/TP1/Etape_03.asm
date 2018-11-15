			org		$4
			
Vector_001	dc.l	Main

			org		$500
			
Main		move.w	Number1,d0
			add.w	Number2,d0
			move.w	d0,Sum
			
			illegal
			
			org		$550
			
Number1		dc.w	$2222
Number2		dc.w	$5555
Sum			ds.w	1
