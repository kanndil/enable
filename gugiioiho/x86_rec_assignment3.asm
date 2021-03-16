section .data
pick: dq 9
n dq 100

section .bss
storing : resq 8


section .text

global _start

_start:

mov rdx, [pick]			; pic--> rdx
mov r12, [n]			; high
mov rsi, 1				; low
mov r15, 0				; return


call binary_search_guess


	add r15, 48			; printing output in reg r15
	mov [storing], r15
	mov rdx, 1
	mov rcx, storing
	mov rbx, 1
	mov rax, 4
	int 0x80

mov rbx,0 					; terminating
mov rax,1 
int 0x80 


binary_search_guess:

cmp r12,rsi				; base case breaking condition
jl return_not_found			; return not_found

mov r14, 0				;  add high and low before division
add r14, r12
add r14, rsi				; high+low


mov rdx, 0					; dividing the middle 
mov rax, r14				; //////
mov rbx, 2					; //////
div rbx 					; //////
mov r14, rax				; //////
mov r13, r14				; //////

mov rdx, [pick]			; pick—> rdx   reload pick
cmp r14, rdx			; compare mid, pick



je return_found			; if mid = pick then the number is found
jg rec1				; if mid > pick then recursive call one
jl rec2				; if mid < pick then recursive call 2


rec1:							; if mid > pick then recursive call one
sub r14, 1						; mid - - 
mov r12, r14					; high = mid


call binary_search_guess			; rec call
ret


rec2:							; if mid < pick then recursive call 2
add r14, 1						; mid ++
mov rsi, r14					; low = mid				

call binary_search_guess			; rec call
ret


return_not_found:				; 
mov r15, -1
ret

return_found:
mov r15, r13
ret