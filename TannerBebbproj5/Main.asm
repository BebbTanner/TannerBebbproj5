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
mov ecx, LENGTHOF str_index                     ;
L2:
    mov eax, 26                                 ;
    call RandomRange                            ;
    add eax, 65                                 ;
    mov[esi], eax                               ;
    call WriteChar                              ;
    loop L2                                     ;
call Crlf                                       ;
ret                                             ;
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