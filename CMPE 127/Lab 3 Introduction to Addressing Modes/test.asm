.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
sum WORD ?
var1 WORD 5
.code
main proc
	MOV AX, 0FFFFh
	MOV BX, 7h
	ADD AX,BX
	CLC
	MOV sum, AX
	MOV AX, BX
	LEA EBX, var1
	MOV AX, [EBX]
	MOV ESI, OFFSET sum
	MOV BX, [ESI + 02] ;red
	LEA EBX, sum
	MOV ESI, 02
	MOV CX, [EBX + ESI] ;red
	invoke ExitProcess, 0
main endp
end main