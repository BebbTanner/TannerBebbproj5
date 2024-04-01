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

	call Clrscr                                                             ;This is going to clear the line.
    mov esi, OFFSET str_index                                               ;This is moving the address location of str_index to the esi register.
    call Randomize                                                          ;Unsure as to what this does right now. I am looking into it.
    mov ecx, 20                                                             ;This will move the value of 20 to the ecx register. This is the number of strings I want this to generate.

L1:
    call Random32                                                           ;Ran out of time for this session. I will finish the documentation later
    call CreateRandomString                                                 ;
    loop L1                                                                 ;

    invoke ExitProcess,0

main endp

CreateRandomString PROC
CreateRandomString ENDP

end main