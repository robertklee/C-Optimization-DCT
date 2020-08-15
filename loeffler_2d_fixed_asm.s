	.arch armv7-a
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 6	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"loeffler_2d_fixed_asm.c"
@ GNU C99 (GCC) version 8.2.1 20180801 (Red Hat 8.2.1-2) (armv7hl-redhat-linux-gnueabi)
@	compiled by GNU C version 8.2.1 20180801 (Red Hat 8.2.1-2), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.1.0, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -fpreprocessed loeffler_2d_fixed_asm.i
@ -mtune=generic-armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16 -mabi=aapcs-linux
@ -mtls-dialect=gnu -marm -march=armv7-a+fp
@ -auxbase-strip CMakeFiles/dct.dir/src/dct/loeffler_2d_fixed_asm.c.o -g
@ -Wall -Werror -Wno-parentheses -std=c99 -fverbose-asm
@ options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
@ -fchkp-check-incomplete-type -fchkp-check-read -fchkp-check-write
@ -fchkp-instrument-calls -fchkp-narrow-bounds -fchkp-optimize
@ -fchkp-store-bounds -fchkp-use-static-bounds
@ -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcommon
@ -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
@ -feliminate-unused-debug-types -ffp-int-builtin-inexact -ffunction-cse
@ -fgcse-lm -fgnu-runtime -fgnu-unique -fident -finline-atomics
@ -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
@ -fivopts -fkeep-static-consts -fleading-underscore -flifetime-dse
@ -flto-odr-type-merging -fmath-errno -fmerge-debug-strings -fpeephole
@ -fplt -fprefetch-loop-arrays -freg-struct-return
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
@ -fsched-stalled-insns-dep -fsemantic-interposition -fshow-column
@ -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
@ -fssa-backprop -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls
@ -ftrapping-math -ftree-cselim -ftree-forwprop -ftree-loop-if-convert
@ -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
@ -ftree-parallelize-loops= -ftree-phiprop -ftree-reassoc -ftree-scev-cprop
@ -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -marm -mbe32
@ -mglibc -mlittle-endian -mpic-data-is-text-relative -msched-prolog
@ -munaligned-access -mvectorize-with-neon-quad

	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	dct_2d_fixed_asm
	.arch armv7-a
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	dct_2d_fixed_asm, %function
dct_2d_fixed_asm:
.LFB0:
	.file 1 "/root/repo/src/dct/loeffler_2d_fixed_asm.c"
	.loc 1 7 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!	@,
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0	@,,
	.cfi_def_cfa_register 11
	sub	sp, sp, #20	@,,
	str	r0, [fp, #-16]	@ data_in, data_in
	str	r1, [fp, #-20]	@ data, data
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:11:     for (i = 0; i < 8; ++i)
	.loc 1 11 12
	mov	r3, #0	@ tmp752,
	strb	r3, [fp, #-5]	@ tmp753, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:11:     for (i = 0; i < 8; ++i)
	.loc 1 11 5
	b	.L2		@
.L3:
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:16:         temp_value = data_in[i][0] + data_in[i][7]; // actually out[0]
	.loc 1 16 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _1, i
	lsl	r3, r3, #3	@ _2, _1,
	ldr	r2, [fp, #-16]	@ tmp754, data_in
	add	r3, r2, r3	@ _3, tmp754, _2
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:16:         temp_value = data_in[i][0] + data_in[i][7]; // actually out[0]
	.loc 1 16 32 discriminator 3
	ldrsb	r3, [r3]	@ _4, *_3
	sxth	r2, r3	@ _5, _4
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:16:         temp_value = data_in[i][0] + data_in[i][7]; // actually out[0]
	.loc 1 16 45 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _6, i
	lsl	r3, r3, #3	@ _7, _6,
	ldr	r1, [fp, #-16]	@ tmp755, data_in
	add	r3, r1, r3	@ _8, tmp755, _7
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:16:         temp_value = data_in[i][0] + data_in[i][7]; // actually out[0]
	.loc 1 16 48 discriminator 3
	ldrsb	r3, [r3, #7]	@ _9, *_8
	sxth	r3, r3	@ _10, _9
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:16:         temp_value = data_in[i][0] + data_in[i][7]; // actually out[0]
	.loc 1 16 20 discriminator 3
	add	r3, r2, r3	@ tmp756, _5, _10
	strh	r3, [fp, #-8]	@ movhi	@ tmp756, temp_value
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:17:         data[i][7] = data_in[i][0] - data_in[i][7]; // actually out[7]
	.loc 1 17 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _11, i
	lsl	r3, r3, #3	@ _12, _11,
	ldr	r2, [fp, #-16]	@ tmp757, data_in
	add	r3, r2, r3	@ _13, tmp757, _12
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:17:         data[i][7] = data_in[i][0] - data_in[i][7]; // actually out[7]
	.loc 1 17 32 discriminator 3
	ldrsb	r3, [r3]	@ _14, *_13
	sxth	r1, r3	@ _15, _14
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:17:         data[i][7] = data_in[i][0] - data_in[i][7]; // actually out[7]
	.loc 1 17 45 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _16, i
	lsl	r3, r3, #3	@ _17, _16,
	ldr	r2, [fp, #-16]	@ tmp758, data_in
	add	r3, r2, r3	@ _18, tmp758, _17
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:17:         data[i][7] = data_in[i][0] - data_in[i][7]; // actually out[7]
	.loc 1 17 48 discriminator 3
	ldrsb	r3, [r3, #7]	@ _19, *_18
	sxth	r2, r3	@ _20, _19
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:17:         data[i][7] = data_in[i][0] - data_in[i][7]; // actually out[7]
	.loc 1 17 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _21, i
	lsl	r3, r3, #4	@ _22, _21,
	ldr	r0, [fp, #-20]	@ tmp759, data
	add	r3, r0, r3	@ _23, tmp759, _22
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:17:         data[i][7] = data_in[i][0] - data_in[i][7]; // actually out[7]
	.loc 1 17 36 discriminator 3
	sub	r2, r1, r2	@ tmp760, _15, _20
	sxth	r2, r2	@ _24, tmp760
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:17:         data[i][7] = data_in[i][0] - data_in[i][7]; // actually out[7]
	.loc 1 17 20 discriminator 3
	strh	r2, [r3, #14]	@ movhi	@ _24, *_23
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:18:         data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
	.loc 1 18 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _25, i
	lsl	r3, r3, #3	@ _26, _25,
	ldr	r2, [fp, #-16]	@ tmp761, data_in
	add	r3, r2, r3	@ _27, tmp761, _26
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:18:         data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
	.loc 1 18 32 discriminator 3
	ldrsb	r3, [r3, #1]	@ _28, *_27
	sxth	r1, r3	@ _29, _28
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:18:         data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
	.loc 1 18 45 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _30, i
	lsl	r3, r3, #3	@ _31, _30,
	ldr	r2, [fp, #-16]	@ tmp762, data_in
	add	r3, r2, r3	@ _32, tmp762, _31
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:18:         data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
	.loc 1 18 48 discriminator 3
	ldrsb	r3, [r3, #6]	@ _33, *_32
	sxth	r2, r3	@ _34, _33
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:18:         data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
	.loc 1 18 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _35, i
	lsl	r3, r3, #4	@ _36, _35,
	ldr	r0, [fp, #-20]	@ tmp763, data
	add	r3, r0, r3	@ _37, tmp763, _36
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:18:         data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
	.loc 1 18 36 discriminator 3
	add	r2, r1, r2	@ tmp764, _29, _34
	sxth	r2, r2	@ _38, tmp764
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:18:         data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
	.loc 1 18 20 discriminator 3
	strh	r2, [r3]	@ movhi	@ _38, *_37
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:19:         data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
	.loc 1 19 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _39, i
	lsl	r3, r3, #3	@ _40, _39,
	ldr	r2, [fp, #-16]	@ tmp765, data_in
	add	r3, r2, r3	@ _41, tmp765, _40
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:19:         data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
	.loc 1 19 32 discriminator 3
	ldrsb	r3, [r3, #1]	@ _42, *_41
	sxth	r1, r3	@ _43, _42
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:19:         data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
	.loc 1 19 45 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _44, i
	lsl	r3, r3, #3	@ _45, _44,
	ldr	r2, [fp, #-16]	@ tmp766, data_in
	add	r3, r2, r3	@ _46, tmp766, _45
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:19:         data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
	.loc 1 19 48 discriminator 3
	ldrsb	r3, [r3, #6]	@ _47, *_46
	sxth	r2, r3	@ _48, _47
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:19:         data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
	.loc 1 19 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _49, i
	lsl	r3, r3, #4	@ _50, _49,
	ldr	r0, [fp, #-20]	@ tmp767, data
	add	r3, r0, r3	@ _51, tmp767, _50
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:19:         data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
	.loc 1 19 36 discriminator 3
	sub	r2, r1, r2	@ tmp768, _43, _48
	sxth	r2, r2	@ _52, tmp768
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:19:         data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
	.loc 1 19 20 discriminator 3
	strh	r2, [r3, #12]	@ movhi	@ _52, *_51
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:20:         data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
	.loc 1 20 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _53, i
	lsl	r3, r3, #3	@ _54, _53,
	ldr	r2, [fp, #-16]	@ tmp769, data_in
	add	r3, r2, r3	@ _55, tmp769, _54
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:20:         data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
	.loc 1 20 32 discriminator 3
	ldrsb	r3, [r3, #2]	@ _56, *_55
	sxth	r1, r3	@ _57, _56
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:20:         data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
	.loc 1 20 45 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _58, i
	lsl	r3, r3, #3	@ _59, _58,
	ldr	r2, [fp, #-16]	@ tmp770, data_in
	add	r3, r2, r3	@ _60, tmp770, _59
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:20:         data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
	.loc 1 20 48 discriminator 3
	ldrsb	r3, [r3, #5]	@ _61, *_60
	sxth	r2, r3	@ _62, _61
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:20:         data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
	.loc 1 20 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _63, i
	lsl	r3, r3, #4	@ _64, _63,
	ldr	r0, [fp, #-20]	@ tmp771, data
	add	r3, r0, r3	@ _65, tmp771, _64
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:20:         data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
	.loc 1 20 36 discriminator 3
	add	r2, r1, r2	@ tmp772, _57, _62
	sxth	r2, r2	@ _66, tmp772
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:20:         data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
	.loc 1 20 20 discriminator 3
	strh	r2, [r3, #2]	@ movhi	@ _66, *_65
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:21:         data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
	.loc 1 21 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _67, i
	lsl	r3, r3, #3	@ _68, _67,
	ldr	r2, [fp, #-16]	@ tmp773, data_in
	add	r3, r2, r3	@ _69, tmp773, _68
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:21:         data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
	.loc 1 21 32 discriminator 3
	ldrsb	r3, [r3, #2]	@ _70, *_69
	sxth	r1, r3	@ _71, _70
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:21:         data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
	.loc 1 21 45 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _72, i
	lsl	r3, r3, #3	@ _73, _72,
	ldr	r2, [fp, #-16]	@ tmp774, data_in
	add	r3, r2, r3	@ _74, tmp774, _73
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:21:         data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
	.loc 1 21 48 discriminator 3
	ldrsb	r3, [r3, #5]	@ _75, *_74
	sxth	r2, r3	@ _76, _75
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:21:         data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
	.loc 1 21 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _77, i
	lsl	r3, r3, #4	@ _78, _77,
	ldr	r0, [fp, #-20]	@ tmp775, data
	add	r3, r0, r3	@ _79, tmp775, _78
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:21:         data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
	.loc 1 21 36 discriminator 3
	sub	r2, r1, r2	@ tmp776, _71, _76
	sxth	r2, r2	@ _80, tmp776
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:21:         data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
	.loc 1 21 20 discriminator 3
	strh	r2, [r3, #10]	@ movhi	@ _80, *_79
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:22:         data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
	.loc 1 22 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _81, i
	lsl	r3, r3, #3	@ _82, _81,
	ldr	r2, [fp, #-16]	@ tmp777, data_in
	add	r3, r2, r3	@ _83, tmp777, _82
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:22:         data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
	.loc 1 22 32 discriminator 3
	ldrsb	r3, [r3, #3]	@ _84, *_83
	sxth	r1, r3	@ _85, _84
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:22:         data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
	.loc 1 22 45 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _86, i
	lsl	r3, r3, #3	@ _87, _86,
	ldr	r2, [fp, #-16]	@ tmp778, data_in
	add	r3, r2, r3	@ _88, tmp778, _87
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:22:         data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
	.loc 1 22 48 discriminator 3
	ldrsb	r3, [r3, #4]	@ _89, *_88
	sxth	r2, r3	@ _90, _89
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:22:         data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
	.loc 1 22 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _91, i
	lsl	r3, r3, #4	@ _92, _91,
	ldr	r0, [fp, #-20]	@ tmp779, data
	add	r3, r0, r3	@ _93, tmp779, _92
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:22:         data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
	.loc 1 22 36 discriminator 3
	add	r2, r1, r2	@ tmp780, _85, _90
	sxth	r2, r2	@ _94, tmp780
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:22:         data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
	.loc 1 22 20 discriminator 3
	strh	r2, [r3, #4]	@ movhi	@ _94, *_93
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:23:         data[i][4] = data_in[i][3] - data_in[i][4]; // actually out[4]
	.loc 1 23 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _95, i
	lsl	r3, r3, #3	@ _96, _95,
	ldr	r2, [fp, #-16]	@ tmp781, data_in
	add	r3, r2, r3	@ _97, tmp781, _96
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:23:         data[i][4] = data_in[i][3] - data_in[i][4]; // actually out[4]
	.loc 1 23 32 discriminator 3
	ldrsb	r3, [r3, #3]	@ _98, *_97
	sxth	r1, r3	@ _99, _98
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:23:         data[i][4] = data_in[i][3] - data_in[i][4]; // actually out[4]
	.loc 1 23 45 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _100, i
	lsl	r3, r3, #3	@ _101, _100,
	ldr	r2, [fp, #-16]	@ tmp782, data_in
	add	r3, r2, r3	@ _102, tmp782, _101
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:23:         data[i][4] = data_in[i][3] - data_in[i][4]; // actually out[4]
	.loc 1 23 48 discriminator 3
	ldrsb	r3, [r3, #4]	@ _103, *_102
	sxth	r2, r3	@ _104, _103
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:23:         data[i][4] = data_in[i][3] - data_in[i][4]; // actually out[4]
	.loc 1 23 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _105, i
	lsl	r3, r3, #4	@ _106, _105,
	ldr	r0, [fp, #-20]	@ tmp783, data
	add	r3, r0, r3	@ _107, tmp783, _106
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:23:         data[i][4] = data_in[i][3] - data_in[i][4]; // actually out[4]
	.loc 1 23 36 discriminator 3
	sub	r2, r1, r2	@ tmp784, _99, _104
	sxth	r2, r2	@ _108, tmp784
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:23:         data[i][4] = data_in[i][3] - data_in[i][4]; // actually out[4]
	.loc 1 23 20 discriminator 3
	strh	r2, [r3, #8]	@ movhi	@ _108, *_107
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:28:         data[i][3] = temp_value + data[i][2]; // actually out[0]
	.loc 1 28 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _109, i
	lsl	r3, r3, #4	@ _110, _109,
	ldr	r2, [fp, #-20]	@ tmp785, data
	add	r3, r2, r3	@ _111, tmp785, _110
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:28:         data[i][3] = temp_value + data[i][2]; // actually out[0]
	.loc 1 28 42 discriminator 3
	ldrsh	r3, [r3, #4]	@ _112, *_111
	uxth	r2, r3	@ _113, _112
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:28:         data[i][3] = temp_value + data[i][2]; // actually out[0]
	.loc 1 28 33 discriminator 3
	ldrh	r3, [fp, #-8]	@ temp_value.0_114, temp_value
	add	r3, r2, r3	@ tmp786, _113, temp_value.0_114
	uxth	r1, r3	@ _115, tmp786
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:28:         data[i][3] = temp_value + data[i][2]; // actually out[0]
	.loc 1 28 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _116, i
	lsl	r3, r3, #4	@ _117, _116,
	ldr	r2, [fp, #-20]	@ tmp787, data
	add	r3, r2, r3	@ _118, tmp787, _117
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:28:         data[i][3] = temp_value + data[i][2]; // actually out[0]
	.loc 1 28 33 discriminator 3
	sxth	r2, r1	@ _119, _115
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:28:         data[i][3] = temp_value + data[i][2]; // actually out[0]
	.loc 1 28 20 discriminator 3
	strh	r2, [r3, #6]	@ movhi	@ _119, *_118
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:29:         temp_value = temp_value - data[i][2]; // actually out[3]
	.loc 1 29 33 discriminator 3
	ldrh	r2, [fp, #-8]	@ temp_value.1_120, temp_value
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:29:         temp_value = temp_value - data[i][2]; // actually out[3]
	.loc 1 29 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _121, i
	lsl	r3, r3, #4	@ _122, _121,
	ldr	r1, [fp, #-20]	@ tmp788, data
	add	r3, r1, r3	@ _123, tmp788, _122
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:29:         temp_value = temp_value - data[i][2]; // actually out[3]
	.loc 1 29 42 discriminator 3
	ldrsh	r3, [r3, #4]	@ _124, *_123
	uxth	r3, r3	@ _125, _124
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:29:         temp_value = temp_value - data[i][2]; // actually out[3]
	.loc 1 29 33 discriminator 3
	sub	r3, r2, r3	@ tmp789, temp_value.1_120, _125
	uxth	r3, r3	@ _126, tmp789
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:29:         temp_value = temp_value - data[i][2]; // actually out[3]
	.loc 1 29 20 discriminator 3
	strh	r3, [fp, #-8]	@ movhi	@ _126, temp_value
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:30:         data[i][2] = data[i][0] + data[i][1]; // actually out[1]
	.loc 1 30 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _127, i
	lsl	r3, r3, #4	@ _128, _127,
	ldr	r2, [fp, #-20]	@ tmp790, data
	add	r3, r2, r3	@ _129, tmp790, _128
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:30:         data[i][2] = data[i][0] + data[i][1]; // actually out[1]
	.loc 1 30 29 discriminator 3
	ldrsh	r3, [r3]	@ _130, *_129
	uxth	r2, r3	@ _131, _130
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:30:         data[i][2] = data[i][0] + data[i][1]; // actually out[1]
	.loc 1 30 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _132, i
	lsl	r3, r3, #4	@ _133, _132,
	ldr	r1, [fp, #-20]	@ tmp791, data
	add	r3, r1, r3	@ _134, tmp791, _133
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:30:         data[i][2] = data[i][0] + data[i][1]; // actually out[1]
	.loc 1 30 42 discriminator 3
	ldrsh	r3, [r3, #2]	@ _135, *_134
	uxth	r3, r3	@ _136, _135
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:30:         data[i][2] = data[i][0] + data[i][1]; // actually out[1]
	.loc 1 30 33 discriminator 3
	add	r3, r2, r3	@ tmp792, _131, _136
	uxth	r1, r3	@ _137, tmp792
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:30:         data[i][2] = data[i][0] + data[i][1]; // actually out[1]
	.loc 1 30 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _138, i
	lsl	r3, r3, #4	@ _139, _138,
	ldr	r2, [fp, #-20]	@ tmp793, data
	add	r3, r2, r3	@ _140, tmp793, _139
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:30:         data[i][2] = data[i][0] + data[i][1]; // actually out[1]
	.loc 1 30 33 discriminator 3
	sxth	r2, r1	@ _141, _137
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:30:         data[i][2] = data[i][0] + data[i][1]; // actually out[1]
	.loc 1 30 20 discriminator 3
	strh	r2, [r3, #4]	@ movhi	@ _141, *_140
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:31:         data[i][0] = data[i][0] - data[i][1]; // actually out[2]
	.loc 1 31 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _142, i
	lsl	r3, r3, #4	@ _143, _142,
	ldr	r2, [fp, #-20]	@ tmp794, data
	add	r3, r2, r3	@ _144, tmp794, _143
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:31:         data[i][0] = data[i][0] - data[i][1]; // actually out[2]
	.loc 1 31 29 discriminator 3
	ldrsh	r3, [r3]	@ _145, *_144
	uxth	r2, r3	@ _146, _145
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:31:         data[i][0] = data[i][0] - data[i][1]; // actually out[2]
	.loc 1 31 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _147, i
	lsl	r3, r3, #4	@ _148, _147,
	ldr	r1, [fp, #-20]	@ tmp795, data
	add	r3, r1, r3	@ _149, tmp795, _148
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:31:         data[i][0] = data[i][0] - data[i][1]; // actually out[2]
	.loc 1 31 42 discriminator 3
	ldrsh	r3, [r3, #2]	@ _150, *_149
	uxth	r3, r3	@ _151, _150
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:31:         data[i][0] = data[i][0] - data[i][1]; // actually out[2]
	.loc 1 31 33 discriminator 3
	sub	r3, r2, r3	@ tmp796, _146, _151
	uxth	r1, r3	@ _152, tmp796
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:31:         data[i][0] = data[i][0] - data[i][1]; // actually out[2]
	.loc 1 31 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _153, i
	lsl	r3, r3, #4	@ _154, _153,
	ldr	r2, [fp, #-20]	@ tmp797, data
	add	r3, r2, r3	@ _155, tmp797, _154
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:31:         data[i][0] = data[i][0] - data[i][1]; // actually out[2]
	.loc 1 31 33 discriminator 3
	sxth	r2, r1	@ _156, _152
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:31:         data[i][0] = data[i][0] - data[i][1]; // actually out[2]
	.loc 1 31 20 discriminator 3
	strh	r2, [r3]	@ movhi	@ _156, *_155
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:39:             : [left] "+l" (data[i][5]), [right] "+l" (data[i][6])
	.loc 1 39 32 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _157, i
	lsl	r3, r3, #4	@ _158, _157,
	ldr	r2, [fp, #-20]	@ tmp798, data
	add	r0, r2, r3	@ _159, tmp798, _158
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:39:             : [left] "+l" (data[i][5]), [right] "+l" (data[i][6])
	.loc 1 39 59 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _160, i
	lsl	r3, r3, #4	@ _161, _160,
	ldr	r2, [fp, #-20]	@ tmp799, data
	add	r1, r2, r3	@ _162, tmp799, _161
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:39:             : [left] "+l" (data[i][5]), [right] "+l" (data[i][6])
	.loc 1 39 35 discriminator 3
	ldrsh	r2, [r0, #10]	@ _163, *_159
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:39:             : [left] "+l" (data[i][5]), [right] "+l" (data[i][6])
	.loc 1 39 62 discriminator 3
	ldrsh	r3, [r1, #12]	@ _164, *_162
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:33:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.loc 1 33 9 discriminator 3
	.syntax divided
@ 33 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     r2, r2, #16	@ tmp800
	uxtah   r2, r2, r3  	@ tmp800, tmp801
	mul r2, r3	@ tmp800, tmp801
	add r2, r3	@ tmp800, tmp801
	mul r2, r3	@ tmp800, tmp801
	asr r2, r2, #7	@ tmp800
	asr     r2, r3, #16	@ tmp800, tmp801
	sxth    r3, r3	@ tmp801
@ 0 "" 2
	.arm
	.syntax unified
	strh	r2, [r0, #10]	@ movhi	@ tmp800, *_159
	strh	r3, [r1, #12]	@ movhi	@ tmp801, *_162
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:47:             : [left] "+l" (data[i][4]), [right] "+l" (data[i][7])
	.loc 1 47 32 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _165, i
	lsl	r3, r3, #4	@ _166, _165,
	ldr	r2, [fp, #-20]	@ tmp802, data
	add	r0, r2, r3	@ _167, tmp802, _166
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:47:             : [left] "+l" (data[i][4]), [right] "+l" (data[i][7])
	.loc 1 47 59 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _168, i
	lsl	r3, r3, #4	@ _169, _168,
	ldr	r2, [fp, #-20]	@ tmp803, data
	add	r1, r2, r3	@ _170, tmp803, _169
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:47:             : [left] "+l" (data[i][4]), [right] "+l" (data[i][7])
	.loc 1 47 35 discriminator 3
	ldrsh	r2, [r0, #8]	@ _171, *_167
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:47:             : [left] "+l" (data[i][4]), [right] "+l" (data[i][7])
	.loc 1 47 62 discriminator 3
	ldrsh	r3, [r1, #14]	@ _172, *_170
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:41:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.loc 1 41 9 discriminator 3
	.syntax divided
@ 41 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     r2, r2, #16	@ tmp804
	uxtah   r2, r2, r3  	@ tmp804, tmp805
	mul r2, r3	@ tmp804, tmp805
	add r2, r3	@ tmp804, tmp805
	mul r2, r3	@ tmp804, tmp805
	asr r2, r2, #7	@ tmp804
	asr     r2, r3, #16	@ tmp804, tmp805
	sxth    r3, r3	@ tmp805
@ 0 "" 2
	.arm
	.syntax unified
	strh	r2, [r0, #8]	@ movhi	@ tmp804, *_167
	strh	r3, [r1, #14]	@ movhi	@ tmp805, *_170
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:53:         data[i][1] = data[i][3] + data[i][2]; // actually out[0]
	.loc 1 53 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _173, i
	lsl	r3, r3, #4	@ _174, _173,
	ldr	r2, [fp, #-20]	@ tmp806, data
	add	r3, r2, r3	@ _175, tmp806, _174
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:53:         data[i][1] = data[i][3] + data[i][2]; // actually out[0]
	.loc 1 53 29 discriminator 3
	ldrsh	r3, [r3, #6]	@ _176, *_175
	uxth	r2, r3	@ _177, _176
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:53:         data[i][1] = data[i][3] + data[i][2]; // actually out[0]
	.loc 1 53 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _178, i
	lsl	r3, r3, #4	@ _179, _178,
	ldr	r1, [fp, #-20]	@ tmp807, data
	add	r3, r1, r3	@ _180, tmp807, _179
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:53:         data[i][1] = data[i][3] + data[i][2]; // actually out[0]
	.loc 1 53 42 discriminator 3
	ldrsh	r3, [r3, #4]	@ _181, *_180
	uxth	r3, r3	@ _182, _181
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:53:         data[i][1] = data[i][3] + data[i][2]; // actually out[0]
	.loc 1 53 33 discriminator 3
	add	r3, r2, r3	@ tmp808, _177, _182
	uxth	r1, r3	@ _183, tmp808
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:53:         data[i][1] = data[i][3] + data[i][2]; // actually out[0]
	.loc 1 53 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _184, i
	lsl	r3, r3, #4	@ _185, _184,
	ldr	r2, [fp, #-20]	@ tmp809, data
	add	r3, r2, r3	@ _186, tmp809, _185
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:53:         data[i][1] = data[i][3] + data[i][2]; // actually out[0]
	.loc 1 53 33 discriminator 3
	sxth	r2, r1	@ _187, _183
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:53:         data[i][1] = data[i][3] + data[i][2]; // actually out[0]
	.loc 1 53 20 discriminator 3
	strh	r2, [r3, #2]	@ movhi	@ _187, *_186
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:54:         data[i][3] = data[i][3] - data[i][2]; // actually out[1]
	.loc 1 54 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _188, i
	lsl	r3, r3, #4	@ _189, _188,
	ldr	r2, [fp, #-20]	@ tmp810, data
	add	r3, r2, r3	@ _190, tmp810, _189
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:54:         data[i][3] = data[i][3] - data[i][2]; // actually out[1]
	.loc 1 54 29 discriminator 3
	ldrsh	r3, [r3, #6]	@ _191, *_190
	uxth	r2, r3	@ _192, _191
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:54:         data[i][3] = data[i][3] - data[i][2]; // actually out[1]
	.loc 1 54 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _193, i
	lsl	r3, r3, #4	@ _194, _193,
	ldr	r1, [fp, #-20]	@ tmp811, data
	add	r3, r1, r3	@ _195, tmp811, _194
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:54:         data[i][3] = data[i][3] - data[i][2]; // actually out[1]
	.loc 1 54 42 discriminator 3
	ldrsh	r3, [r3, #4]	@ _196, *_195
	uxth	r3, r3	@ _197, _196
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:54:         data[i][3] = data[i][3] - data[i][2]; // actually out[1]
	.loc 1 54 33 discriminator 3
	sub	r3, r2, r3	@ tmp812, _192, _197
	uxth	r1, r3	@ _198, tmp812
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:54:         data[i][3] = data[i][3] - data[i][2]; // actually out[1]
	.loc 1 54 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _199, i
	lsl	r3, r3, #4	@ _200, _199,
	ldr	r2, [fp, #-20]	@ tmp813, data
	add	r3, r2, r3	@ _201, tmp813, _200
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:54:         data[i][3] = data[i][3] - data[i][2]; // actually out[1]
	.loc 1 54 33 discriminator 3
	sxth	r2, r1	@ _202, _198
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:54:         data[i][3] = data[i][3] - data[i][2]; // actually out[1]
	.loc 1 54 20 discriminator 3
	strh	r2, [r3, #6]	@ movhi	@ _202, *_201
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:61:             : [left] "+l" (data[i][0]), [right] "+l" (temp_value)
	.loc 1 61 32 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _203, i
	lsl	r3, r3, #4	@ _204, _203,
	ldr	r2, [fp, #-20]	@ tmp814, data
	add	r1, r2, r3	@ _205, tmp814, _204
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:61:             : [left] "+l" (data[i][0]), [right] "+l" (temp_value)
	.loc 1 61 35 discriminator 3
	ldrsh	r2, [r1]	@ _206, *_205
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:55:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.loc 1 55 9 discriminator 3
	ldrh	r3, [fp, #-8]	@ movhi	@ tmp817, temp_value
	.syntax divided
@ 55 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     r2, r2, #16	@ tmp815
	uxtah   r2, r2, r3  	@ tmp815, temp_value
	mul r2, r3	@ tmp815, temp_value
	add r2, r3	@ tmp815, temp_value
	mul r2, r3	@ tmp815, temp_value
	asr r2, r2, #7	@ tmp815
	asr     r2, r3, #16	@ tmp815, temp_value
	sxth    r3, r3	@ temp_value
@ 0 "" 2
	.arm
	.syntax unified
	strh	r2, [r1]	@ movhi	@ tmp815, *_205
	strh	r3, [fp, #-8]	@ movhi	@ temp_value, temp_value
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:64:         data[i][2] = data[i][7] - data[i][5]; // actually out[5]
	.loc 1 64 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _207, i
	lsl	r3, r3, #4	@ _208, _207,
	ldr	r2, [fp, #-20]	@ tmp818, data
	add	r3, r2, r3	@ _209, tmp818, _208
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:64:         data[i][2] = data[i][7] - data[i][5]; // actually out[5]
	.loc 1 64 29 discriminator 3
	ldrsh	r3, [r3, #14]	@ _210, *_209
	uxth	r2, r3	@ _211, _210
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:64:         data[i][2] = data[i][7] - data[i][5]; // actually out[5]
	.loc 1 64 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _212, i
	lsl	r3, r3, #4	@ _213, _212,
	ldr	r1, [fp, #-20]	@ tmp819, data
	add	r3, r1, r3	@ _214, tmp819, _213
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:64:         data[i][2] = data[i][7] - data[i][5]; // actually out[5]
	.loc 1 64 42 discriminator 3
	ldrsh	r3, [r3, #10]	@ _215, *_214
	uxth	r3, r3	@ _216, _215
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:64:         data[i][2] = data[i][7] - data[i][5]; // actually out[5]
	.loc 1 64 33 discriminator 3
	sub	r3, r2, r3	@ tmp820, _211, _216
	uxth	r1, r3	@ _217, tmp820
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:64:         data[i][2] = data[i][7] - data[i][5]; // actually out[5]
	.loc 1 64 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _218, i
	lsl	r3, r3, #4	@ _219, _218,
	ldr	r2, [fp, #-20]	@ tmp821, data
	add	r3, r2, r3	@ _220, tmp821, _219
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:64:         data[i][2] = data[i][7] - data[i][5]; // actually out[5]
	.loc 1 64 33 discriminator 3
	sxth	r2, r1	@ _221, _217
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:64:         data[i][2] = data[i][7] - data[i][5]; // actually out[5]
	.loc 1 64 20 discriminator 3
	strh	r2, [r3, #4]	@ movhi	@ _221, *_220
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:65:         data[i][7] = data[i][7] + data[i][5]; // actually out[7]
	.loc 1 65 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _222, i
	lsl	r3, r3, #4	@ _223, _222,
	ldr	r2, [fp, #-20]	@ tmp822, data
	add	r3, r2, r3	@ _224, tmp822, _223
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:65:         data[i][7] = data[i][7] + data[i][5]; // actually out[7]
	.loc 1 65 29 discriminator 3
	ldrsh	r3, [r3, #14]	@ _225, *_224
	uxth	r2, r3	@ _226, _225
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:65:         data[i][7] = data[i][7] + data[i][5]; // actually out[7]
	.loc 1 65 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _227, i
	lsl	r3, r3, #4	@ _228, _227,
	ldr	r1, [fp, #-20]	@ tmp823, data
	add	r3, r1, r3	@ _229, tmp823, _228
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:65:         data[i][7] = data[i][7] + data[i][5]; // actually out[7]
	.loc 1 65 42 discriminator 3
	ldrsh	r3, [r3, #10]	@ _230, *_229
	uxth	r3, r3	@ _231, _230
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:65:         data[i][7] = data[i][7] + data[i][5]; // actually out[7]
	.loc 1 65 33 discriminator 3
	add	r3, r2, r3	@ tmp824, _226, _231
	uxth	r1, r3	@ _232, tmp824
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:65:         data[i][7] = data[i][7] + data[i][5]; // actually out[7]
	.loc 1 65 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _233, i
	lsl	r3, r3, #4	@ _234, _233,
	ldr	r2, [fp, #-20]	@ tmp825, data
	add	r3, r2, r3	@ _235, tmp825, _234
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:65:         data[i][7] = data[i][7] + data[i][5]; // actually out[7]
	.loc 1 65 33 discriminator 3
	sxth	r2, r1	@ _236, _232
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:65:         data[i][7] = data[i][7] + data[i][5]; // actually out[7]
	.loc 1 65 20 discriminator 3
	strh	r2, [r3, #14]	@ movhi	@ _236, *_235
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:66:         data[i][5] = data[i][4] - data[i][6]; // actually out[6]
	.loc 1 66 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _237, i
	lsl	r3, r3, #4	@ _238, _237,
	ldr	r2, [fp, #-20]	@ tmp826, data
	add	r3, r2, r3	@ _239, tmp826, _238
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:66:         data[i][5] = data[i][4] - data[i][6]; // actually out[6]
	.loc 1 66 29 discriminator 3
	ldrsh	r3, [r3, #8]	@ _240, *_239
	uxth	r2, r3	@ _241, _240
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:66:         data[i][5] = data[i][4] - data[i][6]; // actually out[6]
	.loc 1 66 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _242, i
	lsl	r3, r3, #4	@ _243, _242,
	ldr	r1, [fp, #-20]	@ tmp827, data
	add	r3, r1, r3	@ _244, tmp827, _243
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:66:         data[i][5] = data[i][4] - data[i][6]; // actually out[6]
	.loc 1 66 42 discriminator 3
	ldrsh	r3, [r3, #12]	@ _245, *_244
	uxth	r3, r3	@ _246, _245
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:66:         data[i][5] = data[i][4] - data[i][6]; // actually out[6]
	.loc 1 66 33 discriminator 3
	sub	r3, r2, r3	@ tmp828, _241, _246
	uxth	r1, r3	@ _247, tmp828
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:66:         data[i][5] = data[i][4] - data[i][6]; // actually out[6]
	.loc 1 66 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _248, i
	lsl	r3, r3, #4	@ _249, _248,
	ldr	r2, [fp, #-20]	@ tmp829, data
	add	r3, r2, r3	@ _250, tmp829, _249
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:66:         data[i][5] = data[i][4] - data[i][6]; // actually out[6]
	.loc 1 66 33 discriminator 3
	sxth	r2, r1	@ _251, _247
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:66:         data[i][5] = data[i][4] - data[i][6]; // actually out[6]
	.loc 1 66 20 discriminator 3
	strh	r2, [r3, #10]	@ movhi	@ _251, *_250
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:67:         data[i][4] = data[i][4] + data[i][6]; // actually out[4]
	.loc 1 67 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _252, i
	lsl	r3, r3, #4	@ _253, _252,
	ldr	r2, [fp, #-20]	@ tmp830, data
	add	r3, r2, r3	@ _254, tmp830, _253
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:67:         data[i][4] = data[i][4] + data[i][6]; // actually out[4]
	.loc 1 67 29 discriminator 3
	ldrsh	r3, [r3, #8]	@ _255, *_254
	uxth	r2, r3	@ _256, _255
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:67:         data[i][4] = data[i][4] + data[i][6]; // actually out[4]
	.loc 1 67 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _257, i
	lsl	r3, r3, #4	@ _258, _257,
	ldr	r1, [fp, #-20]	@ tmp831, data
	add	r3, r1, r3	@ _259, tmp831, _258
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:67:         data[i][4] = data[i][4] + data[i][6]; // actually out[4]
	.loc 1 67 42 discriminator 3
	ldrsh	r3, [r3, #12]	@ _260, *_259
	uxth	r3, r3	@ _261, _260
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:67:         data[i][4] = data[i][4] + data[i][6]; // actually out[4]
	.loc 1 67 33 discriminator 3
	add	r3, r2, r3	@ tmp832, _256, _261
	uxth	r1, r3	@ _262, tmp832
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:67:         data[i][4] = data[i][4] + data[i][6]; // actually out[4]
	.loc 1 67 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _263, i
	lsl	r3, r3, #4	@ _264, _263,
	ldr	r2, [fp, #-20]	@ tmp833, data
	add	r3, r2, r3	@ _265, tmp833, _264
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:67:         data[i][4] = data[i][4] + data[i][6]; // actually out[4]
	.loc 1 67 33 discriminator 3
	sxth	r2, r1	@ _266, _262
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:67:         data[i][4] = data[i][4] + data[i][6]; // actually out[4]
	.loc 1 67 20 discriminator 3
	strh	r2, [r3, #8]	@ movhi	@ _266, *_265
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:71:         data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 71 33 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _267, i
	lsl	r3, r3, #4	@ _268, _267,
	ldr	r2, [fp, #-20]	@ tmp834, data
	add	r3, r2, r3	@ _269, tmp834, _268
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:71:         data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 71 36 discriminator 3
	ldrsh	r3, [r3, #10]	@ _270, *_269
	mov	r2, r3	@ _271, _270
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:71:         data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 71 27 discriminator 3
	mov	r3, r2	@ tmp835, _271
	lsl	r3, r3, #1	@ tmp835, tmp835,
	add	r3, r3, r2	@ tmp835, tmp835, _271
	lsl	r2, r3, #4	@ tmp836, tmp835,
	sub	r3, r2, r3	@ _272, tmp836, tmp835
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:71:         data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 71 40 discriminator 3
	add	r3, r3, #16	@ _273, _272,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:71:         data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 71 47 discriminator 3
	asr	r1, r3, #5	@ _274, _273,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:71:         data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 71 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _275, i
	lsl	r3, r3, #4	@ _276, _275,
	ldr	r2, [fp, #-20]	@ tmp837, data
	add	r3, r2, r3	@ _277, tmp837, _276
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:71:         data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 71 20 discriminator 3
	sxth	r2, r1	@ _278, _274
	strh	r2, [r3, #10]	@ movhi	@ _278, *_277
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:72:         data[i][6] = temp_value; // x[3] -> X[6]
	.loc 1 72 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _279, i
	lsl	r3, r3, #4	@ _280, _279,
	ldr	r2, [fp, #-20]	@ tmp838, data
	add	r3, r2, r3	@ _281, tmp838, _280
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:72:         data[i][6] = temp_value; // x[3] -> X[6]
	.loc 1 72 20 discriminator 3
	ldrh	r2, [fp, #-8]	@ movhi	@ tmp839, temp_value
	strh	r2, [r3, #12]	@ movhi	@ tmp839, *_281
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:73:         temp_value = data[i][7] + data[i][4]; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 73 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _282, i
	lsl	r3, r3, #4	@ _283, _282,
	ldr	r2, [fp, #-20]	@ tmp840, data
	add	r3, r2, r3	@ _284, tmp840, _283
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:73:         temp_value = data[i][7] + data[i][4]; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 73 29 discriminator 3
	ldrsh	r3, [r3, #14]	@ _285, *_284
	uxth	r2, r3	@ _286, _285
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:73:         temp_value = data[i][7] + data[i][4]; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 73 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _287, i
	lsl	r3, r3, #4	@ _288, _287,
	ldr	r1, [fp, #-20]	@ tmp841, data
	add	r3, r1, r3	@ _289, tmp841, _288
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:73:         temp_value = data[i][7] + data[i][4]; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 73 42 discriminator 3
	ldrsh	r3, [r3, #8]	@ _290, *_289
	uxth	r3, r3	@ _291, _290
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:73:         temp_value = data[i][7] + data[i][4]; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 73 33 discriminator 3
	add	r3, r2, r3	@ tmp842, _286, _291
	uxth	r3, r3	@ _292, tmp842
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:73:         temp_value = data[i][7] + data[i][4]; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 73 20 discriminator 3
	strh	r3, [fp, #-8]	@ movhi	@ _292, temp_value
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:74:         data[i][7] = data[i][7] - data[i][4]; // x[4] -> X[7]
	.loc 1 74 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _293, i
	lsl	r3, r3, #4	@ _294, _293,
	ldr	r2, [fp, #-20]	@ tmp843, data
	add	r3, r2, r3	@ _295, tmp843, _294
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:74:         data[i][7] = data[i][7] - data[i][4]; // x[4] -> X[7]
	.loc 1 74 29 discriminator 3
	ldrsh	r3, [r3, #14]	@ _296, *_295
	uxth	r2, r3	@ _297, _296
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:74:         data[i][7] = data[i][7] - data[i][4]; // x[4] -> X[7]
	.loc 1 74 39 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _298, i
	lsl	r3, r3, #4	@ _299, _298,
	ldr	r1, [fp, #-20]	@ tmp844, data
	add	r3, r1, r3	@ _300, tmp844, _299
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:74:         data[i][7] = data[i][7] - data[i][4]; // x[4] -> X[7]
	.loc 1 74 42 discriminator 3
	ldrsh	r3, [r3, #8]	@ _301, *_300
	uxth	r3, r3	@ _302, _301
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:74:         data[i][7] = data[i][7] - data[i][4]; // x[4] -> X[7]
	.loc 1 74 33 discriminator 3
	sub	r3, r2, r3	@ tmp845, _297, _302
	uxth	r1, r3	@ _303, tmp845
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:74:         data[i][7] = data[i][7] - data[i][4]; // x[4] -> X[7]
	.loc 1 74 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _304, i
	lsl	r3, r3, #4	@ _305, _304,
	ldr	r2, [fp, #-20]	@ tmp846, data
	add	r3, r2, r3	@ _306, tmp846, _305
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:74:         data[i][7] = data[i][7] - data[i][4]; // x[4] -> X[7]
	.loc 1 74 33 discriminator 3
	sxth	r2, r1	@ _307, _303
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:74:         data[i][7] = data[i][7] - data[i][4]; // x[4] -> X[7]
	.loc 1 74 20 discriminator 3
	strh	r2, [r3, #14]	@ movhi	@ _307, *_306
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:75:         data[i][4] = data[i][3]; // x[1] -> X[4]
	.loc 1 75 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _308, i
	lsl	r3, r3, #4	@ _309, _308,
	ldr	r2, [fp, #-20]	@ tmp847, data
	add	r2, r2, r3	@ _310, tmp847, _309
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:75:         data[i][4] = data[i][3]; // x[1] -> X[4]
	.loc 1 75 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _311, i
	lsl	r3, r3, #4	@ _312, _311,
	ldr	r1, [fp, #-20]	@ tmp848, data
	add	r3, r1, r3	@ _313, tmp848, _312
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:75:         data[i][4] = data[i][3]; // x[1] -> X[4]
	.loc 1 75 29 discriminator 3
	ldrsh	r2, [r2, #6]	@ _314, *_310
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:75:         data[i][4] = data[i][3]; // x[1] -> X[4]
	.loc 1 75 20 discriminator 3
	strh	r2, [r3, #8]	@ movhi	@ _314, *_313
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:76:         data[i][3] = DCT_RT2 * data[i][2] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 76 33 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _315, i
	lsl	r3, r3, #4	@ _316, _315,
	ldr	r2, [fp, #-20]	@ tmp849, data
	add	r3, r2, r3	@ _317, tmp849, _316
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:76:         data[i][3] = DCT_RT2 * data[i][2] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 76 36 discriminator 3
	ldrsh	r3, [r3, #4]	@ _318, *_317
	mov	r2, r3	@ _319, _318
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:76:         data[i][3] = DCT_RT2 * data[i][2] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 76 27 discriminator 3
	mov	r3, r2	@ tmp850, _319
	lsl	r3, r3, #1	@ tmp850, tmp850,
	add	r3, r3, r2	@ tmp850, tmp850, _319
	lsl	r2, r3, #4	@ tmp851, tmp850,
	sub	r3, r2, r3	@ _320, tmp851, tmp850
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:76:         data[i][3] = DCT_RT2 * data[i][2] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 76 40 discriminator 3
	add	r3, r3, #16	@ _321, _320,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:76:         data[i][3] = DCT_RT2 * data[i][2] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 76 47 discriminator 3
	asr	r1, r3, #5	@ _322, _321,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:76:         data[i][3] = DCT_RT2 * data[i][2] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 76 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _323, i
	lsl	r3, r3, #4	@ _324, _323,
	ldr	r2, [fp, #-20]	@ tmp852, data
	add	r3, r2, r3	@ _325, tmp852, _324
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:76:         data[i][3] = DCT_RT2 * data[i][2] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 76 20 discriminator 3
	sxth	r2, r1	@ _326, _322
	strh	r2, [r3, #6]	@ movhi	@ _326, *_325
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:77:         data[i][2] = data[i][0]; // x[2] -> X[2]
	.loc 1 77 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _327, i
	lsl	r3, r3, #4	@ _328, _327,
	ldr	r2, [fp, #-20]	@ tmp853, data
	add	r2, r2, r3	@ _329, tmp853, _328
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:77:         data[i][2] = data[i][0]; // x[2] -> X[2]
	.loc 1 77 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _330, i
	lsl	r3, r3, #4	@ _331, _330,
	ldr	r1, [fp, #-20]	@ tmp854, data
	add	r3, r1, r3	@ _332, tmp854, _331
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:77:         data[i][2] = data[i][0]; // x[2] -> X[2]
	.loc 1 77 29 discriminator 3
	ldrsh	r2, [r2]	@ _333, *_329
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:77:         data[i][2] = data[i][0]; // x[2] -> X[2]
	.loc 1 77 20 discriminator 3
	strh	r2, [r3, #4]	@ movhi	@ _333, *_332
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:78:         data[i][0] = data[i][1]; // x[0] -> X[0]
	.loc 1 78 26 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _334, i
	lsl	r3, r3, #4	@ _335, _334,
	ldr	r2, [fp, #-20]	@ tmp855, data
	add	r2, r2, r3	@ _336, tmp855, _335
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:78:         data[i][0] = data[i][1]; // x[0] -> X[0]
	.loc 1 78 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _337, i
	lsl	r3, r3, #4	@ _338, _337,
	ldr	r1, [fp, #-20]	@ tmp856, data
	add	r3, r1, r3	@ _339, tmp856, _338
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:78:         data[i][0] = data[i][1]; // x[0] -> X[0]
	.loc 1 78 29 discriminator 3
	ldrsh	r2, [r2, #2]	@ _340, *_336
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:78:         data[i][0] = data[i][1]; // x[0] -> X[0]
	.loc 1 78 20 discriminator 3
	strh	r2, [r3]	@ movhi	@ _340, *_339
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:79:         data[i][1] = temp_value; // restore from temp
	.loc 1 79 13 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _341, i
	lsl	r3, r3, #4	@ _342, _341,
	ldr	r2, [fp, #-20]	@ tmp857, data
	add	r3, r2, r3	@ _343, tmp857, _342
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:79:         data[i][1] = temp_value; // restore from temp
	.loc 1 79 20 discriminator 3
	ldrh	r2, [fp, #-8]	@ movhi	@ tmp858, temp_value
	strh	r2, [r3, #2]	@ movhi	@ tmp858, *_343
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:11:     for (i = 0; i < 8; ++i)
	.loc 1 11 24 discriminator 3
	ldrb	r3, [fp, #-5]	@ tmp859, i
	add	r3, r3, #1	@ tmp860, tmp859,
	strb	r3, [fp, #-5]	@ tmp861, i
.L2:
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:11:     for (i = 0; i < 8; ++i)
	.loc 1 11 5 discriminator 1
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ tmp862, i
	cmp	r3, #7	@ tmp862,
	bls	.L3		@,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:84:     for (i = 0; i < 8; ++i)
	.loc 1 84 12
	mov	r3, #0	@ tmp863,
	strb	r3, [fp, #-5]	@ tmp864, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:84:     for (i = 0; i < 8; ++i)
	.loc 1 84 5
	b	.L4		@
.L5:
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:89:         temp_value = data[0][i] + data[7][i]; // actually out[0]
	.loc 1 89 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _344, i
	ldr	r2, [fp, #-20]	@ tmp865, data
	lsl	r3, r3, #1	@ tmp866, _344,
	add	r3, r2, r3	@ tmp867, tmp865, tmp866
	ldrsh	r3, [r3]	@ _345, *data_651(D)
	uxth	r2, r3	@ _346, _345
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:89:         temp_value = data[0][i] + data[7][i]; // actually out[0]
	.loc 1 89 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp868, data
	add	r1, r3, #112	@ _347, tmp868,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:89:         temp_value = data[0][i] + data[7][i]; // actually out[0]
	.loc 1 89 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _348, i
	lsl	r3, r3, #1	@ tmp869, _348,
	add	r3, r1, r3	@ tmp870, _347, tmp869
	ldrsh	r3, [r3]	@ _349, *_347
	uxth	r3, r3	@ _350, _349
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:89:         temp_value = data[0][i] + data[7][i]; // actually out[0]
	.loc 1 89 33 discriminator 3
	add	r3, r2, r3	@ tmp871, _346, _350
	uxth	r3, r3	@ _351, tmp871
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:89:         temp_value = data[0][i] + data[7][i]; // actually out[0]
	.loc 1 89 20 discriminator 3
	strh	r3, [fp, #-8]	@ movhi	@ _351, temp_value
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:90:         data[7][i] = data[0][i] - data[7][i]; // actually out[7]
	.loc 1 90 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _352, i
	ldr	r2, [fp, #-20]	@ tmp872, data
	lsl	r3, r3, #1	@ tmp873, _352,
	add	r3, r2, r3	@ tmp874, tmp872, tmp873
	ldrsh	r3, [r3]	@ _353, *data_651(D)
	uxth	r2, r3	@ _354, _353
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:90:         data[7][i] = data[0][i] - data[7][i]; // actually out[7]
	.loc 1 90 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp875, data
	add	r1, r3, #112	@ _355, tmp875,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:90:         data[7][i] = data[0][i] - data[7][i]; // actually out[7]
	.loc 1 90 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _356, i
	lsl	r3, r3, #1	@ tmp876, _356,
	add	r3, r1, r3	@ tmp877, _355, tmp876
	ldrsh	r3, [r3]	@ _357, *_355
	uxth	r3, r3	@ _358, _357
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:90:         data[7][i] = data[0][i] - data[7][i]; // actually out[7]
	.loc 1 90 33 discriminator 3
	sub	r3, r2, r3	@ tmp878, _354, _358
	uxth	r2, r3	@ _359, tmp878
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:90:         data[7][i] = data[0][i] - data[7][i]; // actually out[7]
	.loc 1 90 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp879, data
	add	r1, r3, #112	@ _360, tmp879,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:90:         data[7][i] = data[0][i] - data[7][i]; // actually out[7]
	.loc 1 90 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _361, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:90:         data[7][i] = data[0][i] - data[7][i]; // actually out[7]
	.loc 1 90 33 discriminator 3
	sxth	r2, r2	@ _362, _359
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:90:         data[7][i] = data[0][i] - data[7][i]; // actually out[7]
	.loc 1 90 20 discriminator 3
	lsl	r3, r3, #1	@ tmp880, _361,
	add	r3, r1, r3	@ tmp881, _360, tmp880
	strh	r2, [r3]	@ movhi	@ _362, *_360
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	.loc 1 91 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp882, data
	add	r2, r3, #16	@ _363, tmp882,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	.loc 1 91 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _364, i
	lsl	r3, r3, #1	@ tmp883, _364,
	add	r3, r2, r3	@ tmp884, _363, tmp883
	ldrsh	r3, [r3]	@ _365, *_363
	uxth	r2, r3	@ _366, _365
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	.loc 1 91 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp885, data
	add	r1, r3, #96	@ _367, tmp885,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	.loc 1 91 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _368, i
	lsl	r3, r3, #1	@ tmp886, _368,
	add	r3, r1, r3	@ tmp887, _367, tmp886
	ldrsh	r3, [r3]	@ _369, *_367
	uxth	r3, r3	@ _370, _369
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	.loc 1 91 33 discriminator 3
	add	r3, r2, r3	@ tmp888, _366, _370
	uxth	r2, r3	@ _371, tmp888
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	.loc 1 91 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _372, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	.loc 1 91 33 discriminator 3
	sxth	r2, r2	@ _373, _371
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	.loc 1 91 20 discriminator 3
	ldr	r1, [fp, #-20]	@ tmp889, data
	lsl	r3, r3, #1	@ tmp890, _372,
	add	r3, r1, r3	@ tmp891, tmp889, tmp890
	strh	r2, [r3]	@ movhi	@ _373, *data_651(D)
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:92:         data[6][i] = data[1][i] - data[6][i]; // actually out[6]
	.loc 1 92 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp892, data
	add	r2, r3, #16	@ _374, tmp892,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:92:         data[6][i] = data[1][i] - data[6][i]; // actually out[6]
	.loc 1 92 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _375, i
	lsl	r3, r3, #1	@ tmp893, _375,
	add	r3, r2, r3	@ tmp894, _374, tmp893
	ldrsh	r3, [r3]	@ _376, *_374
	uxth	r2, r3	@ _377, _376
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:92:         data[6][i] = data[1][i] - data[6][i]; // actually out[6]
	.loc 1 92 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp895, data
	add	r1, r3, #96	@ _378, tmp895,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:92:         data[6][i] = data[1][i] - data[6][i]; // actually out[6]
	.loc 1 92 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _379, i
	lsl	r3, r3, #1	@ tmp896, _379,
	add	r3, r1, r3	@ tmp897, _378, tmp896
	ldrsh	r3, [r3]	@ _380, *_378
	uxth	r3, r3	@ _381, _380
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:92:         data[6][i] = data[1][i] - data[6][i]; // actually out[6]
	.loc 1 92 33 discriminator 3
	sub	r3, r2, r3	@ tmp898, _377, _381
	uxth	r2, r3	@ _382, tmp898
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:92:         data[6][i] = data[1][i] - data[6][i]; // actually out[6]
	.loc 1 92 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp899, data
	add	r1, r3, #96	@ _383, tmp899,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:92:         data[6][i] = data[1][i] - data[6][i]; // actually out[6]
	.loc 1 92 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _384, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:92:         data[6][i] = data[1][i] - data[6][i]; // actually out[6]
	.loc 1 92 33 discriminator 3
	sxth	r2, r2	@ _385, _382
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:92:         data[6][i] = data[1][i] - data[6][i]; // actually out[6]
	.loc 1 92 20 discriminator 3
	lsl	r3, r3, #1	@ tmp900, _384,
	add	r3, r1, r3	@ tmp901, _383, tmp900
	strh	r2, [r3]	@ movhi	@ _385, *_383
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	.loc 1 93 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp902, data
	add	r2, r3, #32	@ _386, tmp902,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	.loc 1 93 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _387, i
	lsl	r3, r3, #1	@ tmp903, _387,
	add	r3, r2, r3	@ tmp904, _386, tmp903
	ldrsh	r3, [r3]	@ _388, *_386
	uxth	r2, r3	@ _389, _388
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	.loc 1 93 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp905, data
	add	r1, r3, #80	@ _390, tmp905,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	.loc 1 93 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _391, i
	lsl	r3, r3, #1	@ tmp906, _391,
	add	r3, r1, r3	@ tmp907, _390, tmp906
	ldrsh	r3, [r3]	@ _392, *_390
	uxth	r3, r3	@ _393, _392
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	.loc 1 93 33 discriminator 3
	add	r3, r2, r3	@ tmp908, _389, _393
	uxth	r2, r3	@ _394, tmp908
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	.loc 1 93 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp909, data
	add	r1, r3, #16	@ _395, tmp909,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	.loc 1 93 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _396, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	.loc 1 93 33 discriminator 3
	sxth	r2, r2	@ _397, _394
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	.loc 1 93 20 discriminator 3
	lsl	r3, r3, #1	@ tmp910, _396,
	add	r3, r1, r3	@ tmp911, _395, tmp910
	strh	r2, [r3]	@ movhi	@ _397, *_395
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:94:         data[5][i] = data[2][i] - data[5][i]; // actually out[5]
	.loc 1 94 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp912, data
	add	r2, r3, #32	@ _398, tmp912,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:94:         data[5][i] = data[2][i] - data[5][i]; // actually out[5]
	.loc 1 94 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _399, i
	lsl	r3, r3, #1	@ tmp913, _399,
	add	r3, r2, r3	@ tmp914, _398, tmp913
	ldrsh	r3, [r3]	@ _400, *_398
	uxth	r2, r3	@ _401, _400
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:94:         data[5][i] = data[2][i] - data[5][i]; // actually out[5]
	.loc 1 94 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp915, data
	add	r1, r3, #80	@ _402, tmp915,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:94:         data[5][i] = data[2][i] - data[5][i]; // actually out[5]
	.loc 1 94 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _403, i
	lsl	r3, r3, #1	@ tmp916, _403,
	add	r3, r1, r3	@ tmp917, _402, tmp916
	ldrsh	r3, [r3]	@ _404, *_402
	uxth	r3, r3	@ _405, _404
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:94:         data[5][i] = data[2][i] - data[5][i]; // actually out[5]
	.loc 1 94 33 discriminator 3
	sub	r3, r2, r3	@ tmp918, _401, _405
	uxth	r2, r3	@ _406, tmp918
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:94:         data[5][i] = data[2][i] - data[5][i]; // actually out[5]
	.loc 1 94 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp919, data
	add	r1, r3, #80	@ _407, tmp919,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:94:         data[5][i] = data[2][i] - data[5][i]; // actually out[5]
	.loc 1 94 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _408, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:94:         data[5][i] = data[2][i] - data[5][i]; // actually out[5]
	.loc 1 94 33 discriminator 3
	sxth	r2, r2	@ _409, _406
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:94:         data[5][i] = data[2][i] - data[5][i]; // actually out[5]
	.loc 1 94 20 discriminator 3
	lsl	r3, r3, #1	@ tmp920, _408,
	add	r3, r1, r3	@ tmp921, _407, tmp920
	strh	r2, [r3]	@ movhi	@ _409, *_407
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	.loc 1 95 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp922, data
	add	r2, r3, #48	@ _410, tmp922,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	.loc 1 95 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _411, i
	lsl	r3, r3, #1	@ tmp923, _411,
	add	r3, r2, r3	@ tmp924, _410, tmp923
	ldrsh	r3, [r3]	@ _412, *_410
	uxth	r2, r3	@ _413, _412
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	.loc 1 95 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp925, data
	add	r1, r3, #64	@ _414, tmp925,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	.loc 1 95 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _415, i
	lsl	r3, r3, #1	@ tmp926, _415,
	add	r3, r1, r3	@ tmp927, _414, tmp926
	ldrsh	r3, [r3]	@ _416, *_414
	uxth	r3, r3	@ _417, _416
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	.loc 1 95 33 discriminator 3
	add	r3, r2, r3	@ tmp928, _413, _417
	uxth	r2, r3	@ _418, tmp928
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	.loc 1 95 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp929, data
	add	r1, r3, #32	@ _419, tmp929,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	.loc 1 95 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _420, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	.loc 1 95 33 discriminator 3
	sxth	r2, r2	@ _421, _418
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	.loc 1 95 20 discriminator 3
	lsl	r3, r3, #1	@ tmp930, _420,
	add	r3, r1, r3	@ tmp931, _419, tmp930
	strh	r2, [r3]	@ movhi	@ _421, *_419
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:96:         data[4][i] = data[3][i] - data[4][i]; // actually out[4]
	.loc 1 96 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp932, data
	add	r2, r3, #48	@ _422, tmp932,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:96:         data[4][i] = data[3][i] - data[4][i]; // actually out[4]
	.loc 1 96 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _423, i
	lsl	r3, r3, #1	@ tmp933, _423,
	add	r3, r2, r3	@ tmp934, _422, tmp933
	ldrsh	r3, [r3]	@ _424, *_422
	uxth	r2, r3	@ _425, _424
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:96:         data[4][i] = data[3][i] - data[4][i]; // actually out[4]
	.loc 1 96 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp935, data
	add	r1, r3, #64	@ _426, tmp935,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:96:         data[4][i] = data[3][i] - data[4][i]; // actually out[4]
	.loc 1 96 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _427, i
	lsl	r3, r3, #1	@ tmp936, _427,
	add	r3, r1, r3	@ tmp937, _426, tmp936
	ldrsh	r3, [r3]	@ _428, *_426
	uxth	r3, r3	@ _429, _428
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:96:         data[4][i] = data[3][i] - data[4][i]; // actually out[4]
	.loc 1 96 33 discriminator 3
	sub	r3, r2, r3	@ tmp938, _425, _429
	uxth	r2, r3	@ _430, tmp938
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:96:         data[4][i] = data[3][i] - data[4][i]; // actually out[4]
	.loc 1 96 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp939, data
	add	r1, r3, #64	@ _431, tmp939,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:96:         data[4][i] = data[3][i] - data[4][i]; // actually out[4]
	.loc 1 96 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _432, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:96:         data[4][i] = data[3][i] - data[4][i]; // actually out[4]
	.loc 1 96 33 discriminator 3
	sxth	r2, r2	@ _433, _430
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:96:         data[4][i] = data[3][i] - data[4][i]; // actually out[4]
	.loc 1 96 20 discriminator 3
	lsl	r3, r3, #1	@ tmp940, _432,
	add	r3, r1, r3	@ tmp941, _431, tmp940
	strh	r2, [r3]	@ movhi	@ _433, *_431
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:101:         data[3][i] = temp_value + data[2][i]; // actually out[0]
	.loc 1 101 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp942, data
	add	r2, r3, #32	@ _434, tmp942,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:101:         data[3][i] = temp_value + data[2][i]; // actually out[0]
	.loc 1 101 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _435, i
	lsl	r3, r3, #1	@ tmp943, _435,
	add	r3, r2, r3	@ tmp944, _434, tmp943
	ldrsh	r3, [r3]	@ _436, *_434
	uxth	r2, r3	@ _437, _436
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:101:         data[3][i] = temp_value + data[2][i]; // actually out[0]
	.loc 1 101 33 discriminator 3
	ldrh	r3, [fp, #-8]	@ temp_value.2_438, temp_value
	add	r3, r2, r3	@ tmp945, _437, temp_value.2_438
	uxth	r2, r3	@ _439, tmp945
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:101:         data[3][i] = temp_value + data[2][i]; // actually out[0]
	.loc 1 101 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp946, data
	add	r1, r3, #48	@ _440, tmp946,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:101:         data[3][i] = temp_value + data[2][i]; // actually out[0]
	.loc 1 101 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _441, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:101:         data[3][i] = temp_value + data[2][i]; // actually out[0]
	.loc 1 101 33 discriminator 3
	sxth	r2, r2	@ _442, _439
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:101:         data[3][i] = temp_value + data[2][i]; // actually out[0]
	.loc 1 101 20 discriminator 3
	lsl	r3, r3, #1	@ tmp947, _441,
	add	r3, r1, r3	@ tmp948, _440, tmp947
	strh	r2, [r3]	@ movhi	@ _442, *_440
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:102:         temp_value = temp_value - data[2][i]; // actually out[3]
	.loc 1 102 33 discriminator 3
	ldrh	r2, [fp, #-8]	@ temp_value.3_443, temp_value
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:102:         temp_value = temp_value - data[2][i]; // actually out[3]
	.loc 1 102 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp949, data
	add	r1, r3, #32	@ _444, tmp949,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:102:         temp_value = temp_value - data[2][i]; // actually out[3]
	.loc 1 102 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _445, i
	lsl	r3, r3, #1	@ tmp950, _445,
	add	r3, r1, r3	@ tmp951, _444, tmp950
	ldrsh	r3, [r3]	@ _446, *_444
	uxth	r3, r3	@ _447, _446
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:102:         temp_value = temp_value - data[2][i]; // actually out[3]
	.loc 1 102 33 discriminator 3
	sub	r3, r2, r3	@ tmp952, temp_value.3_443, _447
	uxth	r3, r3	@ _448, tmp952
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:102:         temp_value = temp_value - data[2][i]; // actually out[3]
	.loc 1 102 20 discriminator 3
	strh	r3, [fp, #-8]	@ movhi	@ _448, temp_value
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:103:         data[2][i] = data[0][i] + data[1][i]; // actually out[1]
	.loc 1 103 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _449, i
	ldr	r2, [fp, #-20]	@ tmp953, data
	lsl	r3, r3, #1	@ tmp954, _449,
	add	r3, r2, r3	@ tmp955, tmp953, tmp954
	ldrsh	r3, [r3]	@ _450, *data_651(D)
	uxth	r2, r3	@ _451, _450
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:103:         data[2][i] = data[0][i] + data[1][i]; // actually out[1]
	.loc 1 103 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp956, data
	add	r1, r3, #16	@ _452, tmp956,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:103:         data[2][i] = data[0][i] + data[1][i]; // actually out[1]
	.loc 1 103 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _453, i
	lsl	r3, r3, #1	@ tmp957, _453,
	add	r3, r1, r3	@ tmp958, _452, tmp957
	ldrsh	r3, [r3]	@ _454, *_452
	uxth	r3, r3	@ _455, _454
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:103:         data[2][i] = data[0][i] + data[1][i]; // actually out[1]
	.loc 1 103 33 discriminator 3
	add	r3, r2, r3	@ tmp959, _451, _455
	uxth	r2, r3	@ _456, tmp959
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:103:         data[2][i] = data[0][i] + data[1][i]; // actually out[1]
	.loc 1 103 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp960, data
	add	r1, r3, #32	@ _457, tmp960,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:103:         data[2][i] = data[0][i] + data[1][i]; // actually out[1]
	.loc 1 103 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _458, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:103:         data[2][i] = data[0][i] + data[1][i]; // actually out[1]
	.loc 1 103 33 discriminator 3
	sxth	r2, r2	@ _459, _456
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:103:         data[2][i] = data[0][i] + data[1][i]; // actually out[1]
	.loc 1 103 20 discriminator 3
	lsl	r3, r3, #1	@ tmp961, _458,
	add	r3, r1, r3	@ tmp962, _457, tmp961
	strh	r2, [r3]	@ movhi	@ _459, *_457
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:104:         data[0][i] = data[0][i] - data[1][i]; // actually out[2]
	.loc 1 104 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _460, i
	ldr	r2, [fp, #-20]	@ tmp963, data
	lsl	r3, r3, #1	@ tmp964, _460,
	add	r3, r2, r3	@ tmp965, tmp963, tmp964
	ldrsh	r3, [r3]	@ _461, *data_651(D)
	uxth	r2, r3	@ _462, _461
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:104:         data[0][i] = data[0][i] - data[1][i]; // actually out[2]
	.loc 1 104 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp966, data
	add	r1, r3, #16	@ _463, tmp966,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:104:         data[0][i] = data[0][i] - data[1][i]; // actually out[2]
	.loc 1 104 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _464, i
	lsl	r3, r3, #1	@ tmp967, _464,
	add	r3, r1, r3	@ tmp968, _463, tmp967
	ldrsh	r3, [r3]	@ _465, *_463
	uxth	r3, r3	@ _466, _465
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:104:         data[0][i] = data[0][i] - data[1][i]; // actually out[2]
	.loc 1 104 33 discriminator 3
	sub	r3, r2, r3	@ tmp969, _462, _466
	uxth	r2, r3	@ _467, tmp969
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:104:         data[0][i] = data[0][i] - data[1][i]; // actually out[2]
	.loc 1 104 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _468, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:104:         data[0][i] = data[0][i] - data[1][i]; // actually out[2]
	.loc 1 104 33 discriminator 3
	sxth	r2, r2	@ _469, _467
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:104:         data[0][i] = data[0][i] - data[1][i]; // actually out[2]
	.loc 1 104 20 discriminator 3
	ldr	r1, [fp, #-20]	@ tmp970, data
	lsl	r3, r3, #1	@ tmp971, _468,
	add	r3, r1, r3	@ tmp972, tmp970, tmp971
	strh	r2, [r3]	@ movhi	@ _469, *data_651(D)
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:112:             : [left] "+l" (data[5][i]), [right] "+l" (data[6][i])
	.loc 1 112 32 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp973, data
	add	r2, r3, #80	@ _470, tmp973,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:112:             : [left] "+l" (data[5][i]), [right] "+l" (data[6][i])
	.loc 1 112 35 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _471, i
	lsl	r3, r3, #1	@ tmp974, _471,
	add	r0, r2, r3	@ _472, _470, tmp974
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:112:             : [left] "+l" (data[5][i]), [right] "+l" (data[6][i])
	.loc 1 112 59 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp975, data
	add	r2, r3, #96	@ _473, tmp975,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:112:             : [left] "+l" (data[5][i]), [right] "+l" (data[6][i])
	.loc 1 112 62 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _474, i
	lsl	r3, r3, #1	@ tmp976, _474,
	add	r1, r2, r3	@ _475, _473, tmp976
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:106:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.loc 1 106 9 discriminator 3
	ldrsh	r2, [r0]	@ _476, *_472
	ldrsh	r3, [r1]	@ _477, *_475
	.syntax divided
@ 106 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     r2, r2, #16	@ tmp977
	uxtah   r2, r2, r3  	@ tmp977, tmp978
	mul r2, r3	@ tmp977, tmp978
	add r2, r3	@ tmp977, tmp978
	mul r2, r3	@ tmp977, tmp978
	asr r2, r2, #7	@ tmp977
	asr     r2, r3, #16	@ tmp977, tmp978
	sxth    r3, r3	@ tmp978
@ 0 "" 2
	.arm
	.syntax unified
	strh	r2, [r0]	@ movhi	@ tmp977, *_472
	strh	r3, [r1]	@ movhi	@ tmp978, *_475
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:120:             : [left] "+l" (data[4][i]), [right] "+l" (data[7][i])
	.loc 1 120 32 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp979, data
	add	r2, r3, #64	@ _478, tmp979,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:120:             : [left] "+l" (data[4][i]), [right] "+l" (data[7][i])
	.loc 1 120 35 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _479, i
	lsl	r3, r3, #1	@ tmp980, _479,
	add	r0, r2, r3	@ _480, _478, tmp980
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:120:             : [left] "+l" (data[4][i]), [right] "+l" (data[7][i])
	.loc 1 120 59 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp981, data
	add	r2, r3, #112	@ _481, tmp981,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:120:             : [left] "+l" (data[4][i]), [right] "+l" (data[7][i])
	.loc 1 120 62 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _482, i
	lsl	r3, r3, #1	@ tmp982, _482,
	add	r1, r2, r3	@ _483, _481, tmp982
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:114:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.loc 1 114 9 discriminator 3
	ldrsh	r2, [r0]	@ _484, *_480
	ldrsh	r3, [r1]	@ _485, *_483
	.syntax divided
@ 114 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     r2, r2, #16	@ tmp983
	uxtah   r2, r2, r3  	@ tmp983, tmp984
	mul r2, r3	@ tmp983, tmp984
	add r2, r3	@ tmp983, tmp984
	mul r2, r3	@ tmp983, tmp984
	asr r2, r2, #7	@ tmp983
	asr     r2, r3, #16	@ tmp983, tmp984
	sxth    r3, r3	@ tmp984
@ 0 "" 2
	.arm
	.syntax unified
	strh	r2, [r0]	@ movhi	@ tmp983, *_480
	strh	r3, [r1]	@ movhi	@ tmp984, *_483
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	.loc 1 126 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp985, data
	add	r2, r3, #48	@ _486, tmp985,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	.loc 1 126 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _487, i
	lsl	r3, r3, #1	@ tmp986, _487,
	add	r3, r2, r3	@ tmp987, _486, tmp986
	ldrsh	r3, [r3]	@ _488, *_486
	uxth	r2, r3	@ _489, _488
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	.loc 1 126 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp988, data
	add	r1, r3, #32	@ _490, tmp988,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	.loc 1 126 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _491, i
	lsl	r3, r3, #1	@ tmp989, _491,
	add	r3, r1, r3	@ tmp990, _490, tmp989
	ldrsh	r3, [r3]	@ _492, *_490
	uxth	r3, r3	@ _493, _492
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	.loc 1 126 33 discriminator 3
	add	r3, r2, r3	@ tmp991, _489, _493
	uxth	r2, r3	@ _494, tmp991
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	.loc 1 126 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp992, data
	add	r1, r3, #16	@ _495, tmp992,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	.loc 1 126 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _496, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	.loc 1 126 33 discriminator 3
	sxth	r2, r2	@ _497, _494
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	.loc 1 126 20 discriminator 3
	lsl	r3, r3, #1	@ tmp993, _496,
	add	r3, r1, r3	@ tmp994, _495, tmp993
	strh	r2, [r3]	@ movhi	@ _497, *_495
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:127:         data[3][i] = data[3][i] - data[2][i]; // actually out[1]
	.loc 1 127 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp995, data
	add	r2, r3, #48	@ _498, tmp995,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:127:         data[3][i] = data[3][i] - data[2][i]; // actually out[1]
	.loc 1 127 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _499, i
	lsl	r3, r3, #1	@ tmp996, _499,
	add	r3, r2, r3	@ tmp997, _498, tmp996
	ldrsh	r3, [r3]	@ _500, *_498
	uxth	r2, r3	@ _501, _500
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:127:         data[3][i] = data[3][i] - data[2][i]; // actually out[1]
	.loc 1 127 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp998, data
	add	r1, r3, #32	@ _502, tmp998,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:127:         data[3][i] = data[3][i] - data[2][i]; // actually out[1]
	.loc 1 127 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _503, i
	lsl	r3, r3, #1	@ tmp999, _503,
	add	r3, r1, r3	@ tmp1000, _502, tmp999
	ldrsh	r3, [r3]	@ _504, *_502
	uxth	r3, r3	@ _505, _504
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:127:         data[3][i] = data[3][i] - data[2][i]; // actually out[1]
	.loc 1 127 33 discriminator 3
	sub	r3, r2, r3	@ tmp1001, _501, _505
	uxth	r2, r3	@ _506, tmp1001
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:127:         data[3][i] = data[3][i] - data[2][i]; // actually out[1]
	.loc 1 127 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1002, data
	add	r1, r3, #48	@ _507, tmp1002,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:127:         data[3][i] = data[3][i] - data[2][i]; // actually out[1]
	.loc 1 127 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _508, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:127:         data[3][i] = data[3][i] - data[2][i]; // actually out[1]
	.loc 1 127 33 discriminator 3
	sxth	r2, r2	@ _509, _506
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:127:         data[3][i] = data[3][i] - data[2][i]; // actually out[1]
	.loc 1 127 20 discriminator 3
	lsl	r3, r3, #1	@ tmp1003, _508,
	add	r3, r1, r3	@ tmp1004, _507, tmp1003
	strh	r2, [r3]	@ movhi	@ _509, *_507
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:134:             : [left] "+l" (data[0][i]), [right] "+l" (temp_value)
	.loc 1 134 35 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _510, i
	lsl	r3, r3, #1	@ tmp1005, _510,
	ldr	r2, [fp, #-20]	@ tmp1006, data
	add	r1, r2, r3	@ _511, tmp1006, tmp1005
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:128:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.loc 1 128 9 discriminator 3
	ldrsh	r2, [r1]	@ _512, *_511
	ldrh	r3, [fp, #-8]	@ movhi	@ tmp1009, temp_value
	.syntax divided
@ 128 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     r2, r2, #16	@ tmp1007
	uxtah   r2, r2, r3  	@ tmp1007, temp_value
	mul r2, r3	@ tmp1007, temp_value
	add r2, r3	@ tmp1007, temp_value
	mul r2, r3	@ tmp1007, temp_value
	asr r2, r2, #7	@ tmp1007
	asr     r2, r3, #16	@ tmp1007, temp_value
	sxth    r3, r3	@ temp_value
@ 0 "" 2
	.arm
	.syntax unified
	strh	r2, [r1]	@ movhi	@ tmp1007, *_511
	strh	r3, [fp, #-8]	@ movhi	@ temp_value, temp_value
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	.loc 1 137 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1010, data
	add	r2, r3, #112	@ _513, tmp1010,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	.loc 1 137 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _514, i
	lsl	r3, r3, #1	@ tmp1011, _514,
	add	r3, r2, r3	@ tmp1012, _513, tmp1011
	ldrsh	r3, [r3]	@ _515, *_513
	uxth	r2, r3	@ _516, _515
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	.loc 1 137 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1013, data
	add	r1, r3, #80	@ _517, tmp1013,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	.loc 1 137 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _518, i
	lsl	r3, r3, #1	@ tmp1014, _518,
	add	r3, r1, r3	@ tmp1015, _517, tmp1014
	ldrsh	r3, [r3]	@ _519, *_517
	uxth	r3, r3	@ _520, _519
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	.loc 1 137 33 discriminator 3
	sub	r3, r2, r3	@ tmp1016, _516, _520
	uxth	r2, r3	@ _521, tmp1016
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	.loc 1 137 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1017, data
	add	r1, r3, #32	@ _522, tmp1017,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	.loc 1 137 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _523, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	.loc 1 137 33 discriminator 3
	sxth	r2, r2	@ _524, _521
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	.loc 1 137 20 discriminator 3
	lsl	r3, r3, #1	@ tmp1018, _523,
	add	r3, r1, r3	@ tmp1019, _522, tmp1018
	strh	r2, [r3]	@ movhi	@ _524, *_522
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:138:         data[7][i] = data[7][i] + data[5][i]; // actually out[7]
	.loc 1 138 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1020, data
	add	r2, r3, #112	@ _525, tmp1020,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:138:         data[7][i] = data[7][i] + data[5][i]; // actually out[7]
	.loc 1 138 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _526, i
	lsl	r3, r3, #1	@ tmp1021, _526,
	add	r3, r2, r3	@ tmp1022, _525, tmp1021
	ldrsh	r3, [r3]	@ _527, *_525
	uxth	r2, r3	@ _528, _527
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:138:         data[7][i] = data[7][i] + data[5][i]; // actually out[7]
	.loc 1 138 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1023, data
	add	r1, r3, #80	@ _529, tmp1023,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:138:         data[7][i] = data[7][i] + data[5][i]; // actually out[7]
	.loc 1 138 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _530, i
	lsl	r3, r3, #1	@ tmp1024, _530,
	add	r3, r1, r3	@ tmp1025, _529, tmp1024
	ldrsh	r3, [r3]	@ _531, *_529
	uxth	r3, r3	@ _532, _531
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:138:         data[7][i] = data[7][i] + data[5][i]; // actually out[7]
	.loc 1 138 33 discriminator 3
	add	r3, r2, r3	@ tmp1026, _528, _532
	uxth	r2, r3	@ _533, tmp1026
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:138:         data[7][i] = data[7][i] + data[5][i]; // actually out[7]
	.loc 1 138 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1027, data
	add	r1, r3, #112	@ _534, tmp1027,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:138:         data[7][i] = data[7][i] + data[5][i]; // actually out[7]
	.loc 1 138 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _535, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:138:         data[7][i] = data[7][i] + data[5][i]; // actually out[7]
	.loc 1 138 33 discriminator 3
	sxth	r2, r2	@ _536, _533
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:138:         data[7][i] = data[7][i] + data[5][i]; // actually out[7]
	.loc 1 138 20 discriminator 3
	lsl	r3, r3, #1	@ tmp1028, _535,
	add	r3, r1, r3	@ tmp1029, _534, tmp1028
	strh	r2, [r3]	@ movhi	@ _536, *_534
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	.loc 1 139 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1030, data
	add	r2, r3, #64	@ _537, tmp1030,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	.loc 1 139 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _538, i
	lsl	r3, r3, #1	@ tmp1031, _538,
	add	r3, r2, r3	@ tmp1032, _537, tmp1031
	ldrsh	r3, [r3]	@ _539, *_537
	uxth	r2, r3	@ _540, _539
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	.loc 1 139 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1033, data
	add	r1, r3, #96	@ _541, tmp1033,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	.loc 1 139 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _542, i
	lsl	r3, r3, #1	@ tmp1034, _542,
	add	r3, r1, r3	@ tmp1035, _541, tmp1034
	ldrsh	r3, [r3]	@ _543, *_541
	uxth	r3, r3	@ _544, _543
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	.loc 1 139 33 discriminator 3
	sub	r3, r2, r3	@ tmp1036, _540, _544
	uxth	r2, r3	@ _545, tmp1036
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	.loc 1 139 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1037, data
	add	r1, r3, #80	@ _546, tmp1037,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	.loc 1 139 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _547, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	.loc 1 139 33 discriminator 3
	sxth	r2, r2	@ _548, _545
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	.loc 1 139 20 discriminator 3
	lsl	r3, r3, #1	@ tmp1038, _547,
	add	r3, r1, r3	@ tmp1039, _546, tmp1038
	strh	r2, [r3]	@ movhi	@ _548, *_546
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:140:         data[4][i] = data[4][i] + data[6][i]; // actually out[4]
	.loc 1 140 26 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1040, data
	add	r2, r3, #64	@ _549, tmp1040,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:140:         data[4][i] = data[4][i] + data[6][i]; // actually out[4]
	.loc 1 140 29 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _550, i
	lsl	r3, r3, #1	@ tmp1041, _550,
	add	r3, r2, r3	@ tmp1042, _549, tmp1041
	ldrsh	r3, [r3]	@ _551, *_549
	uxth	r2, r3	@ _552, _551
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:140:         data[4][i] = data[4][i] + data[6][i]; // actually out[4]
	.loc 1 140 39 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1043, data
	add	r1, r3, #96	@ _553, tmp1043,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:140:         data[4][i] = data[4][i] + data[6][i]; // actually out[4]
	.loc 1 140 42 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _554, i
	lsl	r3, r3, #1	@ tmp1044, _554,
	add	r3, r1, r3	@ tmp1045, _553, tmp1044
	ldrsh	r3, [r3]	@ _555, *_553
	uxth	r3, r3	@ _556, _555
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:140:         data[4][i] = data[4][i] + data[6][i]; // actually out[4]
	.loc 1 140 33 discriminator 3
	add	r3, r2, r3	@ tmp1046, _552, _556
	uxth	r2, r3	@ _557, tmp1046
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:140:         data[4][i] = data[4][i] + data[6][i]; // actually out[4]
	.loc 1 140 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1047, data
	add	r1, r3, #64	@ _558, tmp1047,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:140:         data[4][i] = data[4][i] + data[6][i]; // actually out[4]
	.loc 1 140 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _559, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:140:         data[4][i] = data[4][i] + data[6][i]; // actually out[4]
	.loc 1 140 33 discriminator 3
	sxth	r2, r2	@ _560, _557
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:140:         data[4][i] = data[4][i] + data[6][i]; // actually out[4]
	.loc 1 140 20 discriminator 3
	lsl	r3, r3, #1	@ tmp1048, _559,
	add	r3, r1, r3	@ tmp1049, _558, tmp1048
	strh	r2, [r3]	@ movhi	@ _560, *_558
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 144 35 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1050, data
	add	r2, r3, #80	@ _561, tmp1050,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 144 38 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _562, i
	lsl	r3, r3, #1	@ tmp1051, _562,
	add	r3, r2, r3	@ tmp1052, _561, tmp1051
	ldrsh	r3, [r3]	@ _563, *_561
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 144 42 discriminator 3
	add	r3, r3, #4	@ _565, _564,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 144 53 discriminator 3
	asr	r2, r3, #3	@ _566, _565,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 144 28 discriminator 3
	mov	r3, r2	@ tmp1053, _566
	lsl	r3, r3, #1	@ tmp1053, tmp1053,
	add	r3, r3, r2	@ tmp1053, tmp1053, _566
	lsl	r2, r3, #4	@ tmp1054, tmp1053,
	sub	r3, r2, r3	@ _567, tmp1054, tmp1053
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 144 59 discriminator 3
	add	r3, r3, #16	@ _568, _567,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 144 67 discriminator 3
	asr	r2, r3, #5	@ _569, _568,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 144 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1055, data
	add	r1, r3, #80	@ _570, tmp1055,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 144 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _571, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	.loc 1 144 20 discriminator 3
	sxth	r2, r2	@ _572, _569
	lsl	r3, r3, #1	@ tmp1056, _571,
	add	r3, r1, r3	@ tmp1057, _570, tmp1056
	strh	r2, [r3]	@ movhi	@ _572, *_570
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:145:         data[6][i] = (temp_value + (1<<2)) >> 3; // x[3] -> X[6]
	.loc 1 145 34 discriminator 3
	ldrsh	r3, [fp, #-8]	@ _573, temp_value
	add	r3, r3, #4	@ _574, _573,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:145:         data[6][i] = (temp_value + (1<<2)) >> 3; // x[3] -> X[6]
	.loc 1 145 44 discriminator 3
	asr	r2, r3, #3	@ _575, _574,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:145:         data[6][i] = (temp_value + (1<<2)) >> 3; // x[3] -> X[6]
	.loc 1 145 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1058, data
	add	r1, r3, #96	@ _576, tmp1058,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:145:         data[6][i] = (temp_value + (1<<2)) >> 3; // x[3] -> X[6]
	.loc 1 145 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _577, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:145:         data[6][i] = (temp_value + (1<<2)) >> 3; // x[3] -> X[6]
	.loc 1 145 20 discriminator 3
	sxth	r2, r2	@ _578, _575
	lsl	r3, r3, #1	@ tmp1059, _577,
	add	r3, r1, r3	@ tmp1060, _576, tmp1059
	strh	r2, [r3]	@ movhi	@ _578, *_576
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 146 27 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1061, data
	add	r2, r3, #112	@ _579, tmp1061,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 146 30 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _580, i
	lsl	r3, r3, #1	@ tmp1062, _580,
	add	r3, r2, r3	@ tmp1063, _579, tmp1062
	ldrsh	r3, [r3]	@ _581, *_579
	mov	r1, r3	@ _582, _581
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 146 40 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1064, data
	add	r2, r3, #64	@ _583, tmp1064,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 146 43 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _584, i
	lsl	r3, r3, #1	@ tmp1065, _584,
	add	r3, r2, r3	@ tmp1066, _583, tmp1065
	ldrsh	r3, [r3]	@ _585, *_583
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 146 34 discriminator 3
	add	r3, r1, r3	@ _587, _582, _586
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 146 47 discriminator 3
	add	r3, r3, #4	@ _588, _587,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 146 57 discriminator 3
	asr	r3, r3, #3	@ _589, _588,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	.loc 1 146 20 discriminator 3
	strh	r3, [fp, #-8]	@ movhi	@ _589, temp_value
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	.loc 1 147 27 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1067, data
	add	r2, r3, #112	@ _590, tmp1067,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	.loc 1 147 30 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _591, i
	lsl	r3, r3, #1	@ tmp1068, _591,
	add	r3, r2, r3	@ tmp1069, _590, tmp1068
	ldrsh	r3, [r3]	@ _592, *_590
	mov	r1, r3	@ _593, _592
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	.loc 1 147 40 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1070, data
	add	r2, r3, #64	@ _594, tmp1070,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	.loc 1 147 43 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _595, i
	lsl	r3, r3, #1	@ tmp1071, _595,
	add	r3, r2, r3	@ tmp1072, _594, tmp1071
	ldrsh	r3, [r3]	@ _596, *_594
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	.loc 1 147 34 discriminator 3
	sub	r3, r1, r3	@ _598, _593, _597
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	.loc 1 147 47 discriminator 3
	add	r3, r3, #4	@ _599, _598,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	.loc 1 147 57 discriminator 3
	asr	r2, r3, #3	@ _600, _599,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	.loc 1 147 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1073, data
	add	r1, r3, #112	@ _601, tmp1073,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	.loc 1 147 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _602, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	.loc 1 147 20 discriminator 3
	sxth	r2, r2	@ _603, _600
	lsl	r3, r3, #1	@ tmp1074, _602,
	add	r3, r1, r3	@ tmp1075, _601, tmp1074
	strh	r2, [r3]	@ movhi	@ _603, *_601
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:148:         data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
	.loc 1 148 27 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1076, data
	add	r2, r3, #48	@ _604, tmp1076,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:148:         data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
	.loc 1 148 30 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _605, i
	lsl	r3, r3, #1	@ tmp1077, _605,
	add	r3, r2, r3	@ tmp1078, _604, tmp1077
	ldrsh	r3, [r3]	@ _606, *_604
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:148:         data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
	.loc 1 148 34 discriminator 3
	add	r3, r3, #4	@ _608, _607,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:148:         data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
	.loc 1 148 44 discriminator 3
	asr	r2, r3, #3	@ _609, _608,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:148:         data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
	.loc 1 148 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1079, data
	add	r1, r3, #64	@ _610, tmp1079,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:148:         data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
	.loc 1 148 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _611, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:148:         data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
	.loc 1 148 20 discriminator 3
	sxth	r2, r2	@ _612, _609
	lsl	r3, r3, #1	@ tmp1080, _611,
	add	r3, r1, r3	@ tmp1081, _610, tmp1080
	strh	r2, [r3]	@ movhi	@ _612, *_610
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 149 35 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1082, data
	add	r2, r3, #32	@ _613, tmp1082,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 149 38 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _614, i
	lsl	r3, r3, #1	@ tmp1083, _614,
	add	r3, r2, r3	@ tmp1084, _613, tmp1083
	ldrsh	r3, [r3]	@ _615, *_613
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 149 42 discriminator 3
	add	r3, r3, #4	@ _617, _616,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 149 53 discriminator 3
	asr	r2, r3, #3	@ _618, _617,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 149 28 discriminator 3
	mov	r3, r2	@ tmp1085, _618
	lsl	r3, r3, #1	@ tmp1085, tmp1085,
	add	r3, r3, r2	@ tmp1085, tmp1085, _618
	lsl	r2, r3, #4	@ tmp1086, tmp1085,
	sub	r3, r2, r3	@ _619, tmp1086, tmp1085
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 149 59 discriminator 3
	add	r3, r3, #16	@ _620, _619,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 149 67 discriminator 3
	asr	r2, r3, #5	@ _621, _620,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 149 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1087, data
	add	r1, r3, #48	@ _622, tmp1087,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 149 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _623, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.loc 1 149 20 discriminator 3
	sxth	r2, r2	@ _624, _621
	lsl	r3, r3, #1	@ tmp1088, _623,
	add	r3, r1, r3	@ tmp1089, _622, tmp1088
	strh	r2, [r3]	@ movhi	@ _624, *_622
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:150:         data[2][i] = (data[0][i] + (1<<2)) >> 3; // x[2] -> X[2]
	.loc 1 150 30 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _625, i
	ldr	r2, [fp, #-20]	@ tmp1090, data
	lsl	r3, r3, #1	@ tmp1091, _625,
	add	r3, r2, r3	@ tmp1092, tmp1090, tmp1091
	ldrsh	r3, [r3]	@ _626, *data_651(D)
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:150:         data[2][i] = (data[0][i] + (1<<2)) >> 3; // x[2] -> X[2]
	.loc 1 150 34 discriminator 3
	add	r3, r3, #4	@ _628, _627,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:150:         data[2][i] = (data[0][i] + (1<<2)) >> 3; // x[2] -> X[2]
	.loc 1 150 44 discriminator 3
	asr	r2, r3, #3	@ _629, _628,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:150:         data[2][i] = (data[0][i] + (1<<2)) >> 3; // x[2] -> X[2]
	.loc 1 150 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1093, data
	add	r1, r3, #32	@ _630, tmp1093,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:150:         data[2][i] = (data[0][i] + (1<<2)) >> 3; // x[2] -> X[2]
	.loc 1 150 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _631, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:150:         data[2][i] = (data[0][i] + (1<<2)) >> 3; // x[2] -> X[2]
	.loc 1 150 20 discriminator 3
	sxth	r2, r2	@ _632, _629
	lsl	r3, r3, #1	@ tmp1094, _631,
	add	r3, r1, r3	@ tmp1095, _630, tmp1094
	strh	r2, [r3]	@ movhi	@ _632, *_630
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:151:         data[0][i] = (data[1][i] + (1<<2)) >> 3; // x[0] -> X[0]
	.loc 1 151 27 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1096, data
	add	r2, r3, #16	@ _633, tmp1096,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:151:         data[0][i] = (data[1][i] + (1<<2)) >> 3; // x[0] -> X[0]
	.loc 1 151 30 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _634, i
	lsl	r3, r3, #1	@ tmp1097, _634,
	add	r3, r2, r3	@ tmp1098, _633, tmp1097
	ldrsh	r3, [r3]	@ _635, *_633
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:151:         data[0][i] = (data[1][i] + (1<<2)) >> 3; // x[0] -> X[0]
	.loc 1 151 34 discriminator 3
	add	r3, r3, #4	@ _637, _636,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:151:         data[0][i] = (data[1][i] + (1<<2)) >> 3; // x[0] -> X[0]
	.loc 1 151 44 discriminator 3
	asr	r2, r3, #3	@ _638, _637,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:151:         data[0][i] = (data[1][i] + (1<<2)) >> 3; // x[0] -> X[0]
	.loc 1 151 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _639, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:151:         data[0][i] = (data[1][i] + (1<<2)) >> 3; // x[0] -> X[0]
	.loc 1 151 20 discriminator 3
	sxth	r2, r2	@ _640, _638
	ldr	r1, [fp, #-20]	@ tmp1099, data
	lsl	r3, r3, #1	@ tmp1100, _639,
	add	r3, r1, r3	@ tmp1101, tmp1099, tmp1100
	strh	r2, [r3]	@ movhi	@ _640, *data_651(D)
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:152:         data[1][i] = temp_value; // restore from temp
	.loc 1 152 13 discriminator 3
	ldr	r3, [fp, #-20]	@ tmp1102, data
	add	r2, r3, #16	@ _641, tmp1102,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:152:         data[1][i] = temp_value; // restore from temp
	.loc 1 152 16 discriminator 3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ _642, i
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:152:         data[1][i] = temp_value; // restore from temp
	.loc 1 152 20 discriminator 3
	lsl	r3, r3, #1	@ tmp1103, _642,
	add	r3, r2, r3	@ tmp1104, _641, tmp1103
	ldrh	r2, [fp, #-8]	@ movhi	@ tmp1105, temp_value
	strh	r2, [r3]	@ movhi	@ tmp1105, *_641
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:84:     for (i = 0; i < 8; ++i)
	.loc 1 84 24 discriminator 3
	ldrb	r3, [fp, #-5]	@ tmp1106, i
	add	r3, r3, #1	@ tmp1107, tmp1106,
	strb	r3, [fp, #-5]	@ tmp1108, i
.L4:
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:84:     for (i = 0; i < 8; ++i)
	.loc 1 84 5 discriminator 1
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2	@ tmp1109, i
	cmp	r3, #7	@ tmp1109,
	bls	.L5		@,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:156: }
	.loc 1 156 1
	nop	
	add	sp, fp, #0	@,,
	.cfi_def_cfa_register 13
	@ sp needed	@
	ldr	fp, [sp], #4	@,
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr	@
	.cfi_endproc
.LFE0:
	.size	dct_2d_fixed_asm, .-dct_2d_fixed_asm
	.align	2
	.global	dct_loeffler_2d_fixed_asm
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	dct_loeffler_2d_fixed_asm, %function
dct_loeffler_2d_fixed_asm:
.LFB1:
	.loc 1 159 1
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}	@
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4	@,,
	.cfi_def_cfa 11, 4
	sub	sp, sp, #8	@,,
	str	r0, [fp, #-8]	@ data_in, data_in
	str	r1, [fp, #-12]	@ data_out, data_out
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:160:     dct_2d_fixed_asm(data_in, data_out);
	.loc 1 160 5
	ldr	r1, [fp, #-12]	@, data_out
	ldr	r0, [fp, #-8]	@, data_in
	bl	dct_2d_fixed_asm		@
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:161: }
	.loc 1 161 1
	nop	
	sub	sp, fp, #4	@,,
	.cfi_def_cfa 13, 8
	@ sp needed	@
	pop	{fp, pc}	@
	.cfi_endproc
.LFE1:
	.size	dct_loeffler_2d_fixed_asm, .-dct_loeffler_2d_fixed_asm
.Letext0:
	.file 2 "/usr/include/bits/types.h"
	.file 3 "/usr/include/bits/stdint-intn.h"
	.file 4 "/usr/include/bits/stdint-uintn.h"
	.file 5 "/root/repo/include/util/constants.h"
	.file 6 "/usr/lib/gcc/armv7hl-redhat-linux-gnueabi/8/include/stddef.h"
	.file 7 "/usr/include/bits/types/struct_FILE.h"
	.file 8 "/usr/include/bits/types/FILE.h"
	.file 9 "/usr/include/stdio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3bb
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0xc
	.4byte	.LASF62
	.4byte	.LASF63
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x24
	.byte	0x15
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF4
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x25
	.byte	0x17
	.4byte	0x25
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x26
	.byte	0x1a
	.4byte	0x6c
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x41
	.byte	0x25
	.4byte	0x7a
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x2
	.byte	0x96
	.byte	0x20
	.4byte	0xa0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF13
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x97
	.byte	0x20
	.4byte	0x88
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x6
	.byte	0x4
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x18
	.byte	0x12
	.4byte	0x41
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x3
	.byte	0x19
	.byte	0x13
	.4byte	0x60
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x54
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x5
	.byte	0x8b
	.byte	0x10
	.4byte	0xc2
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x6
	.byte	0xd8
	.byte	0x16
	.4byte	0x33
	.uleb128 0x7
	.4byte	.LASF64
	.byte	0x98
	.byte	0x7
	.byte	0x31
	.byte	0x8
	.4byte	0x285
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x7
	.byte	0x33
	.byte	0x7
	.4byte	0x73
	.byte	0
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x7
	.byte	0x36
	.byte	0x9
	.4byte	0xb5
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x7
	.byte	0x37
	.byte	0x9
	.4byte	0xb5
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x7
	.byte	0x38
	.byte	0x9
	.4byte	0xb5
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x7
	.byte	0x39
	.byte	0x9
	.4byte	0xb5
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x7
	.byte	0x3a
	.byte	0x9
	.4byte	0xb5
	.byte	0x14
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x7
	.byte	0x3b
	.byte	0x9
	.4byte	0xb5
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x7
	.byte	0x3c
	.byte	0x9
	.4byte	0xb5
	.byte	0x1c
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x7
	.byte	0x3d
	.byte	0x9
	.4byte	0xb5
	.byte	0x20
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x7
	.byte	0x40
	.byte	0x9
	.4byte	0xb5
	.byte	0x24
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0x7
	.byte	0x41
	.byte	0x9
	.4byte	0xb5
	.byte	0x28
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x7
	.byte	0x42
	.byte	0x9
	.4byte	0xb5
	.byte	0x2c
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x7
	.byte	0x44
	.byte	0x16
	.4byte	0x29e
	.byte	0x30
	.uleb128 0x8
	.4byte	.LASF34
	.byte	0x7
	.byte	0x46
	.byte	0x14
	.4byte	0x2a4
	.byte	0x34
	.uleb128 0x8
	.4byte	.LASF35
	.byte	0x7
	.byte	0x48
	.byte	0x7
	.4byte	0x73
	.byte	0x38
	.uleb128 0x8
	.4byte	.LASF36
	.byte	0x7
	.byte	0x49
	.byte	0x7
	.4byte	0x73
	.byte	0x3c
	.uleb128 0x8
	.4byte	.LASF37
	.byte	0x7
	.byte	0x4a
	.byte	0xb
	.4byte	0x94
	.byte	0x40
	.uleb128 0x8
	.4byte	.LASF38
	.byte	0x7
	.byte	0x4d
	.byte	0x12
	.4byte	0x2c
	.byte	0x44
	.uleb128 0x8
	.4byte	.LASF39
	.byte	0x7
	.byte	0x4e
	.byte	0xf
	.4byte	0x4d
	.byte	0x46
	.uleb128 0x8
	.4byte	.LASF40
	.byte	0x7
	.byte	0x4f
	.byte	0x8
	.4byte	0x2aa
	.byte	0x47
	.uleb128 0x8
	.4byte	.LASF41
	.byte	0x7
	.byte	0x51
	.byte	0xf
	.4byte	0x2ba
	.byte	0x48
	.uleb128 0x8
	.4byte	.LASF42
	.byte	0x7
	.byte	0x59
	.byte	0xd
	.4byte	0xa7
	.byte	0x50
	.uleb128 0x8
	.4byte	.LASF43
	.byte	0x7
	.byte	0x5b
	.byte	0x17
	.4byte	0x2c5
	.byte	0x58
	.uleb128 0x8
	.4byte	.LASF44
	.byte	0x7
	.byte	0x5c
	.byte	0x19
	.4byte	0x2d0
	.byte	0x5c
	.uleb128 0x8
	.4byte	.LASF45
	.byte	0x7
	.byte	0x5d
	.byte	0x14
	.4byte	0x2a4
	.byte	0x60
	.uleb128 0x8
	.4byte	.LASF46
	.byte	0x7
	.byte	0x5e
	.byte	0x9
	.4byte	0xb3
	.byte	0x64
	.uleb128 0x8
	.4byte	.LASF47
	.byte	0x7
	.byte	0x5f
	.byte	0xa
	.4byte	0xf2
	.byte	0x68
	.uleb128 0x8
	.4byte	.LASF48
	.byte	0x7
	.byte	0x60
	.byte	0x7
	.4byte	0x73
	.byte	0x6c
	.uleb128 0x8
	.4byte	.LASF49
	.byte	0x7
	.byte	0x62
	.byte	0x8
	.4byte	0x2d6
	.byte	0x70
	.byte	0
	.uleb128 0x3
	.4byte	.LASF50
	.byte	0x8
	.byte	0x7
	.byte	0x19
	.4byte	0xfe
	.uleb128 0x9
	.4byte	.LASF65
	.byte	0x7
	.byte	0x2b
	.byte	0xe
	.uleb128 0xa
	.4byte	.LASF51
	.uleb128 0x6
	.byte	0x4
	.4byte	0x299
	.uleb128 0x6
	.byte	0x4
	.4byte	0xfe
	.uleb128 0xb
	.4byte	0xbb
	.4byte	0x2ba
	.uleb128 0xc
	.4byte	0x33
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x291
	.uleb128 0xa
	.4byte	.LASF52
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2c0
	.uleb128 0xa
	.4byte	.LASF53
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2cb
	.uleb128 0xb
	.4byte	0xbb
	.4byte	0x2e6
	.uleb128 0xc
	.4byte	0x33
	.byte	0x27
	.byte	0
	.uleb128 0xd
	.4byte	.LASF54
	.byte	0x9
	.byte	0x89
	.byte	0xe
	.4byte	0x2f2
	.uleb128 0x6
	.byte	0x4
	.4byte	0x285
	.uleb128 0xd
	.4byte	.LASF55
	.byte	0x9
	.byte	0x8a
	.byte	0xe
	.4byte	0x2f2
	.uleb128 0xd
	.4byte	.LASF56
	.byte	0x9
	.byte	0x8b
	.byte	0xe
	.4byte	0x2f2
	.uleb128 0xe
	.4byte	.LASF66
	.byte	0x1
	.byte	0x9e
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x345
	.uleb128 0xf
	.4byte	.LASF57
	.byte	0x1
	.byte	0x9e
	.byte	0x29
	.4byte	0x355
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF58
	.byte	0x1
	.byte	0x9e
	.byte	0x40
	.4byte	0x36b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xb
	.4byte	0xe6
	.4byte	0x355
	.uleb128 0xc
	.4byte	0x33
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x345
	.uleb128 0xb
	.4byte	0xce
	.4byte	0x36b
	.uleb128 0xc
	.4byte	0x33
	.byte	0x7
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x35b
	.uleb128 0x10
	.4byte	.LASF67
	.byte	0x1
	.byte	0x6
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF57
	.byte	0x1
	.byte	0x6
	.byte	0x20
	.4byte	0x355
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.4byte	.LASF59
	.byte	0x1
	.byte	0x6
	.byte	0x37
	.4byte	0x36b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF60
	.byte	0x1
	.byte	0x8
	.byte	0xd
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.ascii	"i\000"
	.byte	0x1
	.byte	0x9
	.byte	0xd
	.4byte	0xda
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF29:
	.ascii	"_IO_buf_end\000"
.LASF11:
	.ascii	"__quad_t\000"
.LASF37:
	.ascii	"_old_offset\000"
.LASF16:
	.ascii	"int8_t\000"
.LASF32:
	.ascii	"_IO_save_end\000"
.LASF62:
	.ascii	"/root/repo/src/dct/loeffler_2d_fixed_asm.c\000"
.LASF8:
	.ascii	"short int\000"
.LASF20:
	.ascii	"size_t\000"
.LASF42:
	.ascii	"_offset\000"
.LASF26:
	.ascii	"_IO_write_ptr\000"
.LASF9:
	.ascii	"long long int\000"
.LASF28:
	.ascii	"_IO_buf_base\000"
.LASF33:
	.ascii	"_markers\000"
.LASF23:
	.ascii	"_IO_read_end\000"
.LASF46:
	.ascii	"_freeres_buf\000"
.LASF18:
	.ascii	"uint8_t\000"
.LASF56:
	.ascii	"stderr\000"
.LASF63:
	.ascii	"/root/repo/build\000"
.LASF41:
	.ascii	"_lock\000"
.LASF13:
	.ascii	"long int\000"
.LASF38:
	.ascii	"_cur_column\000"
.LASF6:
	.ascii	"__uint8_t\000"
.LASF66:
	.ascii	"dct_loeffler_2d_fixed_asm\000"
.LASF58:
	.ascii	"data_out\000"
.LASF64:
	.ascii	"_IO_FILE\000"
.LASF0:
	.ascii	"unsigned char\000"
.LASF4:
	.ascii	"signed char\000"
.LASF43:
	.ascii	"_codecvt\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF2:
	.ascii	"unsigned int\000"
.LASF51:
	.ascii	"_IO_marker\000"
.LASF40:
	.ascii	"_shortbuf\000"
.LASF25:
	.ascii	"_IO_write_base\000"
.LASF49:
	.ascii	"_unused2\000"
.LASF22:
	.ascii	"_IO_read_ptr\000"
.LASF1:
	.ascii	"short unsigned int\000"
.LASF5:
	.ascii	"__int8_t\000"
.LASF15:
	.ascii	"char\000"
.LASF44:
	.ascii	"_wide_data\000"
.LASF45:
	.ascii	"_freeres_list\000"
.LASF17:
	.ascii	"int16_t\000"
.LASF60:
	.ascii	"temp_value\000"
.LASF47:
	.ascii	"__pad5\000"
.LASF59:
	.ascii	"data\000"
.LASF52:
	.ascii	"_IO_codecvt\000"
.LASF3:
	.ascii	"long unsigned int\000"
.LASF27:
	.ascii	"_IO_write_end\000"
.LASF14:
	.ascii	"__off64_t\000"
.LASF12:
	.ascii	"__off_t\000"
.LASF34:
	.ascii	"_chain\000"
.LASF67:
	.ascii	"dct_2d_fixed_asm\000"
.LASF53:
	.ascii	"_IO_wide_data\000"
.LASF48:
	.ascii	"_mode\000"
.LASF31:
	.ascii	"_IO_backup_base\000"
.LASF54:
	.ascii	"stdin\000"
.LASF7:
	.ascii	"__int16_t\000"
.LASF36:
	.ascii	"_flags2\000"
.LASF61:
	.ascii	"GNU C99 8.2.1 20180801 (Red Hat 8.2.1-2) -mtune=gen"
	.ascii	"eric-armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16 -mabi"
	.ascii	"=aapcs-linux -mtls-dialect=gnu -marm -march=armv7-a"
	.ascii	"+fp -g -std=c99\000"
.LASF24:
	.ascii	"_IO_read_base\000"
.LASF39:
	.ascii	"_vtable_offset\000"
.LASF57:
	.ascii	"data_in\000"
.LASF30:
	.ascii	"_IO_save_base\000"
.LASF35:
	.ascii	"_fileno\000"
.LASF50:
	.ascii	"FILE\000"
.LASF19:
	.ascii	"DataType\000"
.LASF21:
	.ascii	"_flags\000"
.LASF55:
	.ascii	"stdout\000"
.LASF65:
	.ascii	"_IO_lock_t\000"
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
