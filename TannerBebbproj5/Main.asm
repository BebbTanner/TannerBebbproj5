;Tanner Bebb Proj 5
;Random string generator

.386
.model flat,stdcall
.stack 4096
include irvine32.inc
ExitProcess proto, dwExitCode:dword

str_len = 10																;This is just set to the value that I want each length of the string to be.

.data
	str_index BYTE str_len DUP(0),  0										;This is going to duplicate the string a given number of times.

.code
main proc
main endp

CreateRandomString PROC
CreateRandomString ENDP

end main