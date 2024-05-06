.text   
    .global main
    
main:
    .equ SYS_exit, 1
    .equ GOOD_EXIT_CODE, 0
    .equ SYS_write, 4
    .equ STDOUT, 1

    call readi32
    mov %eax, limit

    fild limit
    fsqrt
    fistp limit
    add $1, limit

    mov %eax, %ebx
    mov $2, %ecx

loop:
    cmpl %ecx, limit
    jz is_prime

    mov %ebx, %eax
    cdq
    divl %ecx
    incl %ecx
    cmpl %edx, zero
    jz is_not_prime

    jmp loop

is_prime:
    mov $SYS_write, %eax
    mov $STDOUT, %ebx
    mov $str_is_prime, %ecx
    mov $end_str_is_prime-str_is_prime, %edx

    int $0x80
    jmp end

is_not_prime:
    mov $SYS_write, %eax
    mov $STDOUT, %ebx
    mov $str_is_not_prime, %ecx
    mov $end_str_is_not_prime-str_is_not_prime, %edx

    int $0x80
    jmp end


end:
    mov $SYS_exit, %eax
    mov $GOOD_EXIT_CODE, %ebx
    int $0x80


.data
fl:
    .float 23.6
limit:
    .int 4
zero:
    .int 0

str_is_prime:
    .ascii "The digit is prime\n"
end_str_is_prime:

str_is_not_prime:
    .ascii "The digit is not prime\n"
end_str_is_not_prime:
