@R0
@R1
D = M
@R2
M = 0

@END
D;JEQ
@LOOP_V
D;JGT
@LOOP_OKR
D;JLT

(LOOP_OKR)
	@R0
	D = M
	M = -D
	@R1
	D = M
	M = -D
	@LOOP_V
	0;JMP

(LOOP_V)
	@R0
	D = M
	@R2
	M = M + D
	@R1
	M = M - 1
	D = M
	@END
	D;JEQ
	@LOOP_V
	D;JGT

(END)
	@END
	0;JMP