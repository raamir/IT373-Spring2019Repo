	.file	"p4.c"
	.text
	.section	.rodata
.LC0:
	.string	"fork failed\n"
.LC1:
	.string	"./p4.output"
.LC2:
	.string	"wc"
.LC3:
	.string	"p4.c"
.LC4:
	.string	"wc >= 0"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	fork
	movl	%eax, -40(%rbp)
	cmpl	$0, -40(%rbp)
	jns	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$1, %edi
	call	exit
.L2:
	cmpl	$0, -40(%rbp)
	jne	.L3
	movl	$1, %edi
	call	close
	movl	$448, %edx
	movl	$577, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	open
	movl	$.LC2, %edi
	call	strdup
	movq	%rax, -32(%rbp)
	movl	$.LC3, %edi
	call	strdup
	movq	%rax, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	-32(%rbp), %rax
	leaq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp
	jmp	.L4
.L3:
	movl	$0, %eax
	movq	%rax, %rdi
	call	wait
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	jns	.L4
	movl	$__PRETTY_FUNCTION__.3971, %ecx
	movl	$31, %edx
	movl	$.LC3, %esi
	movl	$.LC4, %edi
	call	__assert_fail
.L4:
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L6
	call	__stack_chk_fail
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.type	__PRETTY_FUNCTION__.3971, @object
	.size	__PRETTY_FUNCTION__.3971, 5
__PRETTY_FUNCTION__.3971:
	.string	"main"
	.ident	"GCC: (Ubuntu 7.3.0-23ubuntu2~16.04.york0) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
