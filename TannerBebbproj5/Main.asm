;.386
;.model flat,stdcall
;.stack 4096
;ExitProcess PROTO, dwExitCode:DWORD
INCLUDE Irvine32.inc

str_len = 10

.data
str_index BYTE str_len DUP(0),  0               ;
i SDWORD ?                                      ;This is my indexed variable that I will be using in my for loop.

.code
main proc
    call Clrscr                                 ;
    mov esi, OFFSET str_index                   ;
    call Randomize                              ;
    mov ecx, 20                                 ;
    
L1:
    call Random32                               ;
    call CreateRandomString                     ;
    cmp ecx, 20                                 ;
    loop L1                                     ;

    invoke ExitProcess,0
main endp

CreateRandomString PROC
; Receives: Length of the string (L) in EAX, the pointer
; to a byte array in ESI where the random string will be saved
; Returns: Pointer to a byte array in ESI held the random string
;-----------------------------------------------------
mov ecx, LENGTHOF str_index                     ;This is moving the number of elements of str_index to the ecx register.
L2:
    mov eax, 26                                 ;Moving the value 26 to the eax register. It is 26 because the is the total number of letters in the alphabet.
    call RandomRange                            ;This will generate a random unassigned random integer.
    add eax, 65                                 ;This is going to add 65 to number generated in the eax register. The reason it does this is to make all of the letters their capital counterparts.
    mov[esi], eax                               ;This is moving whatever is in the eax register to the esi register. The esi register has been dereferanced.
    call WriteChar                              ;Write the current charaters to the screen.
    loop L2                                     ;loop back to L2, and repeat the process until the whole string has been generated.
call Crlf                                       ;Add a new line.
ret                                             ;Return to the main proc after the whole process is finished.
CreateRandomString ENDP

end main


;This is a for loop example. I am keeping this here to try and set it up correctly.

;.data
;	i SDWORD ?	
;
;.code
;main PROC
;	mov i, 1
;again:
;	cmp i, 20
;	jg done
;	mov eax, i
;	call WriteInt
;	mov al, ' '
;	call WriteChar
;	inc i
;	jmp again
;done:
	
;	call Crlf
;	call WaitMsg
;	exit
;main ENDP
;END	main