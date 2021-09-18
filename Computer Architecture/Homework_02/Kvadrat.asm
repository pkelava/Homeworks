@18444
D = A
@af
M = A

@adress
M = D
@adress2
M = D

(LOOP_V)
@32
D = A
@adress2
M = M + D
D = M
@adress
M = D
@8
M = A
(LOOP_1)
 @8
 D = M
 D = D - 1
 M = D
 @adress
 A = M
 M = -1
 @adress
 D = M
 M = D + 1
 @8
 D = M
 @LOOP_1
 D;JGT
@af
D = M
D = D - 1
M = D
@LOOP_V
D;JGT
  
@3070
D = A
@18958
D = D + A
@af
M = A

@adress3
M = D
@adress4
M = D

(LOOP_G)
@32
D = A
@adress4
M = M + D
D = M
@adress3
M = D
@8
M = A
(LOOP_z)
 @8
 D = M
 D = D - 1
 M = D
 @adress3
 A = M
 M = -1
 @adress3
 D = M
 M = D + 1
 @8
 D = M
 @LOOP_z
 D;JGT
@af
D = M
D = D - 1
M = D
@LOOP_G
D;JGT

@18956
D = A

@96
M = A

@adress5
M = D

(LOOP_V3)
@32
D = A
@adress5
M = M + D
A = M
M = -1
@96
D = M
D = D - 1
M = D
@LOOP_V3
D;JGT

@18963
D = A

@96
M = A

@adress6
M = D

(LOOP_V4)
@32
D = A
@adress6
M = M + D
A = M
M = -1
@96
D = M
D = D - 1
M = D
@LOOP_V4
D;JGT

@1
D = A
@LOOP_CONST
D;JGT
(PROM_P)
@16384
D = A
@8192
D = D + A
@VAR
M = D
@8192
D = A
M = D
(PROM)
@8192
D = M
@VAR
A = M - D
D = M
D = D + 1
D = -D
M = D
@8192
D = M
D = D-1
M = D
@PROM
D;JGT

(END)
(LOOP_CONST)
@KBD
D = M
@PROM_P
D;JGT

@END
0;JMP
 