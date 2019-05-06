	.file	"file_create.c"
	.text
	.section	.rodata
.LC0:
	.string	"w+"
.LC1:
	.string	"tmp/test.txt"
	.align 8
.LC2:
	.string	"This is testing for fprintf...\n"
.LC3:
	.string	"This is testing for fputs...\n"
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
	subq	$16, %rsp
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	fopen
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	movl	$.LC2, %edi
	call	fwrite
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	movl	$29, %edx
	movl	$1, %esi
	movl	$.LC3, %edi
	call	fwrite
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-23ubuntu2~16.04.york0) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
