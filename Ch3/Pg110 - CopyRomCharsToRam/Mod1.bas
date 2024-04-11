1 REM SWITCH TO UPPER CASE
5 PRINTCHR$(142)
10 REM RESERVE MEMORY FOR CHARACTERS
15 POKE52,48:POKE56,48:CLR
25 REM TURN OFF KEYSCAN INTERRUPT TIMER
35 POKE56334,PEEK(56334)AND 254
45 REM SWITCH IN CHARACTER
55 POKE1,PEEK(1)AND251
65 FORI=0 TO 511
66 REM ERROR IN PRG 53240 TO 53248
67 POKEI+12288,PEEK(I+53248)
68 NEXT I
75 REM SWITCH IN I/O
85 POKE1,PEEK(1)OR4
95 REM RESTART KEYSCAN INTERRUPT TIMER
105 POKE56334,PEEK(56334)OR1
106 REM ERROR IN PRG. DID NOT CHANGE CHARACTER POINTER TO RAM
107 REM CHANGE CHARACTER ROM MEMORY TO 12288 RAM
108 POKE 53272,(PEEK(53272)AND240)OR12
109 REM MAKE CHARACTER T A SMILEY FACE
110 FORI=12448TO12455
111 READ A:POKE I,A: NEXT I
116 REM MAKE @ IN REVERSE VIDEO
121 FORI=12288TO12288+7:POKEI,255-PEEK(I):NEXTI
138 REM SMILEY FACE DATA
139 DATA 60,66,165,129,165,153,66,60
140 END