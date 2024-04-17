;Tanner Bebb Project 5 assembly language

INCLUDE Irvine32.inc

str_size = 10
str_len = 9

.data
    arr1 BYTE str_size DUP(0),0                         ;
    str_index BYTE str_len DUP(0),  0                   ;
    str_count SDWORD ?                                  ;

.code
main PROC
    mov str_count, 1                                    ;

L1:                                                     ;
    cmp str_count, 20                                   ;
    jg done                                             ;
    mov eax,str_size                                    ;
    mov esi,OFFSET arr1                                 ;
    call CreateRandomString                             ;
    mov edx,OFFSET arr1                                 ;
    inc str_count                                       ;
    jmp L1                                              ;

done:
	Call Crlf                                           ;
	Call WaitMsg                                        ;
	exit                                                ;

main ENDP                                               ;

CreateRandomString PROC
    mov ecx, LENGTHOF str_index                         ;
L2:
    mov eax, 26                                         ;
    call RandomRange                                    ;
    add eax, 65                                         ;
    mov[esi], eax                                       ;
    call WriteChar                                      ;
    loop L2                                             ;
    call Crlf                                           ;
    ret                                                 ;

CreateRandomString ENDP                                 ;

END main