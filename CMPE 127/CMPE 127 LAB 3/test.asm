.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
sum DWORD ?

.code
main proc
	;Sign Flag
	MOV AL, 10
	MOV BL, 9 
	SUB BL, AL 

	;Overflow Flag
	MOV AL, 100
	MOV BL, 50
	ADD AL, BL

	;Zero Flag
	MOV AL, 50
	MOV BL, 50
	CMP AL, BL
	sub AL, BL
	CMP AL, BL

	;Auxiliary Flag
	MOV AL, 39h
	MOV BL, 29H
	ADD AL, BL

	;Parity Flag
	MOV AL, 1
	MOV BL, 1
	ADD BL, AL
	ADD BL, AL

	;CARRY FLAG
	MOV AL, 0FFH
	MOV BL, 1h
	ADD AL, BL

	MOV AL, 10
	MOV BL, 9 
	SUB BL, AL

	invoke ExitProcess, 0
main endp
end main
