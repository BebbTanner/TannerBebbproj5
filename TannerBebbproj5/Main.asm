;Tanner Bebb Project 5 assembly language
;So far this prints out 1 string of 10 random characters. I need the loop to work correctly.
;At first I was pretty sure that it was an issue in the L1 tag. But now I am almost wondering if it is an issue under the L2 tag.

INCLUDE Irvine32.inc

STR_COUNT = 20
STR_SIZE = 10
str_len = 9

.data
    aString BYTE STR_SIZE DUP(0),0
    str_index BYTE str_len DUP(0),  0
    i SDWORD ?

.code
main PROC
    mov ecx,STR_COUNT                                   ; loop count

L1:                                                     ; generates a single string
    mov eax,STR_SIZE                                    ; loop counter
    mov esi,OFFSET aString                              ; string index
    call CreateRandomString                             ; Calls the random string function
    mov edx,OFFSET aString                              ; display the string
;   cmp eax, 20
;   jb L1
;   jg done

done:
	Call Crlf
	Call WaitMsg
	exit

main ENDP

CreateRandomString PROC

    mov ecx, LENGTHOF str_index
L2:
    mov eax, 26
    call RandomRange
    add eax, 65
    mov[esi], eax
    call WriteChar
    loop L2
    call Crlf
    ret

CreateRandomString ENDP

END main