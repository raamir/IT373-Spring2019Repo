	.file	"file_read.c"
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"tmp/test.txt"
.LC2:
	.string	"%s"
.LC3:
	.string	"1 : %s\n"
.LC4:
	.string	"2: %s\n"
.LC5:
	.string	"3: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$288, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	fopen
	movq	%rax, -280(%rbp)
	leaq	-272(%rbp), %rdx
	movq	-280(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	leaq	-272(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movq	-280(%rbp), %rdx
	leaq	-272(%rbp), %rax
	movl	$255, %esi
	movq	%rax, %rdi
	call	fgets
	leaq	-272(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movq	-280(%rbp), %rdx
	leaq	-272(%rbp), %rax
	movl	$255, %esi
	movq	%rax, %rdi
	call	fgets
	leaq	-272(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	movq	-280(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L3
	call	__stack_chk_fail
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-23ubuntu2~16.04.york0) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
