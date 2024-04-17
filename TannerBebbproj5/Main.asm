;Tanner Bebb Project 5 assembly language

INCLUDE Irvine32.inc

str_size = 10
str_len = 9

.data
    arr1 BYTE str_size DUP(0),0                         ;Declare arr1 of size byte and give it a size of DUP(0). This value will be changed in the program.
    str_index BYTE str_len DUP(0),  0                   ;Declare str_index of size byte and give it a size of DUP(0). This value will be changed in the program. 
    i SDWORD ?                                          ;Declare i and give it no value.

.code
main PROC                                               ;Main procedure, I like to think of this as int main().
    mov i, 1                                            ;Store the value of 1 into the i variable

L1:                                                     ;This is the loop that will print out the 20 strings of random characters.
    cmp i, 20                                           ;Compare the value of 20 to the value that is stored in the i variable.
    jg done                                             ;If the value of i is greater than 20, Jump to the done tag.
    mov eax,str_size                                    ;Store the value stored in str_size to the eax register.
    mov esi,OFFSET arr1                                 ;Stores the address of arr1 to the esi register.
    call CreateRandomString                             ;Call the CreateRandomString function. This will generate the random string of 10 characters.
    mov edx,OFFSET arr1                                 ;Store the address of arr1 to the edx register.
    inc i                                               ;Increment the value of i by 1.
    jmp L1                                              ;Jump back to the L1 tag.

done:
	Call Crlf                                           ;Jumps to a new line.
	Call WaitMsg                                        ;Calls the wait message.
	exit                                                ;Exits the program.

main ENDP                                               ;This is the closing tag for the main procedure.

CreateRandomString PROC                                 ;This is the procedure that will generate a random string of 10 captial letters.
    mov ecx, LENGTHOF str_index                         ;Store the length of the str_index to the ecx register.
L2:
    mov eax, 26                                         ;Store the value of 26 in the eax register. This is the number of total letters in the alphabet.
    call RandomRange                                    ;Call the RandomRange function that is in the Irvine library. This will generate a random number between 0 and 26.
    add eax, 65                                         ;Add 65 to the eax register. This will take the lower case letter and make it uppercase.
    mov[esi], eax                                       ;Move what is in the eax register to the esi register. The esi register is the instruction pointer.
    call WriteChar                                      ;Write the character that is currently on the stack in the esi register.
    loop L2                                             ;Jump back to the L2 tag.
    call Crlf                                           ;Add a new line to the output.
    ret                                                 ;Return to the main function.

CreateRandomString ENDP                                 ;End of the CreateRandmString procedure.

END main                                                ;End of the entire program.