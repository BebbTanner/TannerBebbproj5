;Tanner Bebb Proj 5
;Random string generator

.386
.model flat,stdcall
.stack 4096
include irvine32.inc
ExitProcess proto, dwExitCode:dword

.data

.code

main proc

	INVOKE ExitProcess, 0

main ENDP
END main