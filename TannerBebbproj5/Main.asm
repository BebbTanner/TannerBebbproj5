;Setting up a test to print out a string 20 times instead of counting from 1 to 20.
;Currently, it is printing out the string 20 times, but it is printing it backwords and idk why.
;In the notes it also says to use CALL READCHAR and CALL WRITESTRING

INCLUDE Irvine32.inc

str_len = 9

.data
;	move dx, OFFSET prompt						;This was in the notes for this assignment
	str_index BYTE str_len DUP(0), 0
	i SDWORD ?

.code

main PROC
	mov i, 1
again:
	cmp i, 20
	jg done
	mov eax, ebx
	call WriteInt
	mov al, ' '
	call WriteChar
	inc i
	jmp again
done:
	
	call Crlf
	call WaitMsg

;This is going to generate the random string that is a length of 10 characters.
mov ecx, LENGTHOF str_index                     ;This is moving the number of elements of str_index to the ecx register.
L2:
    mov eax, 26                                 ;Moving the value 26 to the eax register. It is 26 because the is the total number of letters in the alphabet.
    call RandomRange                            ;This will generate a random unassigned random integer.
    add eax, 65                                 ;This is going to add 65 to number generated in the eax register. The reason it does this is to make all of the letters their capital counterparts.
    mov ebx, eax                                ;This is moving whatever is in the eax register to the esi register. The esi register has been dereferanced.
    call WriteChar                              ;Write the current charaters to the screen.
    loop L2                                     ;loop back to L2, and repeat the process until the whole string has been generated.
    call Crlf                                   ;Add a new line.
    ret                                         ;Return to the main proc after the whole process is finished.

	exit

main ENDP


END	main