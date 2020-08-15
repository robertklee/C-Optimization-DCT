	.arch armv7-a
	.arch_extension virt
	.arch_extension idiv
	.arch_extension sec
	.arch_extension mp
	.eabi_attribute 28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"loeffler_2d_fixed_asm.c"
@ GNU C99 (GCC) version 8.2.1 20180801 (Red Hat 8.2.1-2) (armv7hl-redhat-linux-gnueabi)
@	compiled by GNU C version 8.2.1 20180801 (Red Hat 8.2.1-2), GMP version 6.1.2, MPFR version 3.1.6-p2, MPC version 1.1.0, isl version none
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -fpreprocessed loeffler_2d_fixed_asm.i
@ -mtune=generic-armv7-a -mfloat-abi=hard -mfpu=vfpv3-d16 -mabi=aapcs-linux
@ -mtls-dialect=gnu -marm -march=armv7ve+vfpv3-d16
@ -auxbase-strip CMakeFiles/dct_max.dir/src/dct/loeffler_2d_fixed_asm.c.o
@ -O3 -Wall -Werror -Wno-parentheses -std=c99 -fverbose-asm
@ -finline-functions -funroll-loops -frename-registers
@ options enabled:  -faggressive-loop-optimizations -falign-jumps
@ -falign-labels -falign-loops -fauto-inc-dec -fbranch-count-reg
@ -fcaller-saves -fchkp-check-incomplete-type -fchkp-check-read
@ -fchkp-check-write -fchkp-instrument-calls -fchkp-narrow-bounds
@ -fchkp-optimize -fchkp-store-bounds -fchkp-use-static-bounds
@ -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcode-hoisting
@ -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
@ -fcrossjumping -fcse-follow-jumps -fdefer-pop
@ -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
@ -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
@ -fexpensive-optimizations -fforward-propagate -ffp-int-builtin-inexact
@ -ffunction-cse -fgcse -fgcse-after-reload -fgcse-lm -fgnu-runtime
@ -fgnu-unique -fguess-branch-probability -fhoist-adjacent-loads -fident
@ -fif-conversion -fif-conversion2 -findirect-inlining -finline
@ -finline-atomics -finline-functions -finline-functions-called-once
@ -finline-small-functions -fipa-bit-cp -fipa-cp -fipa-cp-clone -fipa-icf
@ -fipa-icf-functions -fipa-icf-variables -fipa-profile -fipa-pure-const
@ -fipa-ra -fipa-reference -fipa-sra -fipa-vrp -fira-hoist-pressure
@ -fira-share-save-slots -fira-share-spill-slots
@ -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
@ -fleading-underscore -flifetime-dse -floop-interchange
@ -floop-unroll-and-jam -flra-remat -flto-odr-type-merging -fmath-errno
@ -fmerge-constants -fmerge-debug-strings -fmove-loop-invariants
@ -fomit-frame-pointer -foptimize-sibling-calls -foptimize-strlen
@ -fpartial-inlining -fpeel-loops -fpeephole -fpeephole2 -fplt
@ -fpredictive-commoning -fprefetch-loop-arrays -freg-struct-return
@ -frename-registers -freorder-blocks -freorder-functions
@ -frerun-cse-after-loop -fsched-critical-path-heuristic
@ -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
@ -fsched-last-insn-heuristic -fsched-pressure -fsched-rank-heuristic
@ -fsched-spec -fsched-spec-insn-heuristic -fsched-stalled-insns-dep
@ -fschedule-insns -fschedule-insns2 -fsection-anchors
@ -fsemantic-interposition -fshow-column -fshrink-wrap
@ -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
@ -fsplit-loops -fsplit-paths -fsplit-wide-types -fssa-backprop
@ -fssa-phiopt -fstdarg-opt -fstore-merging -fstrict-aliasing
@ -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
@ -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
@ -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
@ -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
@ -ftree-loop-distribute-patterns -ftree-loop-distribution
@ -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
@ -ftree-loop-optimize -ftree-loop-vectorize -ftree-parallelize-loops=
@ -ftree-partial-pre -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc
@ -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
@ -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vrp
@ -funit-at-a-time -funroll-loops -funswitch-loops -fverbose-asm -fweb
@ -fzero-initialized-in-bss -marm -mbe32 -mglibc -mlittle-endian
@ -mpic-data-is-text-relative -msched-prolog -munaligned-access
@ -mvectorize-with-neon-quad

	.text
	.align	2
	.global	dct_2d_fixed_asm
	.arch armv7ve
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	dct_2d_fixed_asm, %function
dct_2d_fixed_asm:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:71:         data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
	mov	fp, #45	@ tmp375,
	mov	r10, #16	@ tmp376,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:7: {
	sub	sp, sp, #12	@,,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:7: {
	str	r1, [sp, #4]	@ data, %sfp
	mov	r3, r1	@ ivtmp.26, data
	add	r1, r1, #128	@ _465, data,
	str	r1, [sp]	@ _465, %sfp
.L2:
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:16:         temp_value = data_in[i][0] + data_in[i][7]; // actually out[0]
	ldrsb	r8, [r0, #7]	@ _7, MEM[base: _418, offset: 7B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:16:         temp_value = data_in[i][0] + data_in[i][7]; // actually out[0]
	ldrsb	r7, [r0]	@ _5, MEM[base: _418, offset: 0B]
	add	r3, r3, #16	@ ivtmp.26, ivtmp.26,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:17:         data[i][7] = data_in[i][0] - data_in[i][7]; // actually out[7]
	sub	r4, r7, r8	@ tmp332, _5, _7
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:17:         data[i][7] = data_in[i][0] - data_in[i][7]; // actually out[7]
	strh	r4, [r3, #-2]	@ movhi	@ tmp332, MEM[base: _9, offset: 14B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:18:         data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
	ldrsb	r6, [r0, #1]	@ MEM[base: _418, offset: 1B], MEM[base: _418, offset: 1B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:18:         data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
	ldrsb	r5, [r0, #6]	@ MEM[base: _418, offset: 6B], MEM[base: _418, offset: 6B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:16:         temp_value = data_in[i][0] + data_in[i][7]; // actually out[0]
	add	r7, r7, r8	@ tmp351, _5, _7
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:18:         data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
	add	r9, r6, r5	@ tmp335, MEM[base: _418, offset: 1B], MEM[base: _418, offset: 6B]
	sxth	r6, r9	@ _15, tmp335
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:18:         data[i][0] = data_in[i][1] + data_in[i][6]; // actually out[1]
	strh	r6, [r3, #-16]	@ movhi	@ _15, MEM[base: _9, offset: 0B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:19:         data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
	ldrsb	lr, [r0, #1]	@ MEM[base: _418, offset: 1B], MEM[base: _418, offset: 1B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:19:         data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
	ldrsb	r2, [r0, #6]	@ MEM[base: _418, offset: 6B], MEM[base: _418, offset: 6B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:41:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	ldrh	ip, [r3, #-2]	@ MEM[base: _9, offset: 14B], MEM[base: _9, offset: 14B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:19:         data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
	sub	r1, lr, r2	@ tmp338, MEM[base: _418, offset: 1B], MEM[base: _418, offset: 6B]
	sxth	r9, r1	@ _20, tmp338
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:19:         data[i][6] = data_in[i][1] - data_in[i][6]; // actually out[6]
	strh	r9, [r3, #-4]	@ movhi	@ _20, MEM[base: _9, offset: 12B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:20:         data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
	ldrsb	r5, [r0, #2]	@ MEM[base: _418, offset: 2B], MEM[base: _418, offset: 2B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:20:         data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
	ldrsb	r4, [r0, #5]	@ MEM[base: _418, offset: 5B], MEM[base: _418, offset: 5B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:30:         data[i][2] = data[i][0] + data[i][1]; // actually out[1]
	uxth	r6, r6	@ _46, _15
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:20:         data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
	add	lr, r5, r4	@ tmp341, MEM[base: _418, offset: 2B], MEM[base: _418, offset: 5B]
	sxth	r2, lr	@ _25, tmp341
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:20:         data[i][1] = data_in[i][2] + data_in[i][5]; // actually out[2]
	strh	r2, [r3, #-14]	@ movhi	@ _25, MEM[base: _9, offset: 2B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:21:         data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
	ldrsb	r1, [r0, #2]	@ MEM[base: _418, offset: 2B], MEM[base: _418, offset: 2B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:21:         data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
	ldrsb	r5, [r0, #5]	@ MEM[base: _418, offset: 5B], MEM[base: _418, offset: 5B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:28:         data[i][3] = temp_value + data[i][2]; // actually out[0]
	uxth	r7, r7	@ temp_value.0_42, tmp351
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:21:         data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
	sub	r8, r1, r5	@ tmp344, MEM[base: _418, offset: 2B], MEM[base: _418, offset: 5B]
	sxth	lr, r8	@ _30, tmp344
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:21:         data[i][5] = data_in[i][2] - data_in[i][5]; // actually out[5]
	strh	lr, [r3, #-6]	@ movhi	@ _30, MEM[base: _9, offset: 10B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:22:         data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
	ldrsb	r1, [r0, #3]	@ MEM[base: _418, offset: 3B], MEM[base: _418, offset: 3B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:22:         data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
	ldrsb	r4, [r0, #4]	@ MEM[base: _418, offset: 4B], MEM[base: _418, offset: 4B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:33:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.syntax divided
@ 33 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     lr, lr, #16	@ tmp356
	uxtah   lr, lr, r9  	@ tmp356, tmp357
	mul lr, r9	@ tmp356, tmp357
	add lr, r9	@ tmp356, tmp357
	mul lr, r9	@ tmp356, tmp357
	asr lr, lr, #7	@ tmp356
	asr     lr, r9, #16	@ tmp356, tmp357
	sxth    r9, r9	@ tmp357
@ 0 "" 2
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:22:         data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
	.arm
	.syntax unified
	add	r5, r1, r4	@ tmp347, MEM[base: _418, offset: 3B], MEM[base: _418, offset: 4B]
	sxth	r1, r5	@ _35, tmp347
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:22:         data[i][2] = data_in[i][3] + data_in[i][4]; // actually out[3]
	strh	r1, [r3, #-12]	@ movhi	@ _35, MEM[base: _9, offset: 4B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:23:         data[i][4] = data_in[i][3] - data_in[i][4]; // actually out[4]
	ldrsb	r8, [r0, #4]	@ MEM[base: _418, offset: 4B], MEM[base: _418, offset: 4B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:23:         data[i][4] = data_in[i][3] - data_in[i][4]; // actually out[4]
	ldrsb	r4, [r0, #3]	@ MEM[base: _418, offset: 3B], MEM[base: _418, offset: 3B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:64:         data[i][2] = data[i][7] - data[i][5]; // actually out[5]
	uxth	r5, lr	@ _66, tmp356
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:23:         data[i][4] = data_in[i][3] - data_in[i][4]; // actually out[4]
	sub	r4, r4, r8	@ tmp462, MEM[base: _418, offset: 3B], MEM[base: _418, offset: 4B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:66:         data[i][5] = data[i][4] - data[i][6]; // actually out[6]
	uxth	lr, r9	@ _73, tmp357
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:41:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.syntax divided
@ 41 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     r4, r4, #16	@ tmp358
	uxtah   r4, r4, ip  	@ tmp358, tmp359
	mul r4, ip	@ tmp358, tmp359
	add r4, ip	@ tmp358, tmp359
	mul r4, ip	@ tmp358, tmp359
	asr r4, r4, #7	@ tmp358
	asr     r4, ip, #16	@ tmp358, tmp359
	sxth    ip, ip	@ tmp359
@ 0 "" 2
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:66:         data[i][5] = data[i][4] - data[i][6]; // actually out[6]
	.arm
	.syntax unified
	uxth	r4, r4	@ _71, tmp358
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:64:         data[i][2] = data[i][7] - data[i][5]; // actually out[5]
	uxth	ip, ip	@ _64, tmp359
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:66:         data[i][5] = data[i][4] - data[i][6]; // actually out[6]
	sub	r9, r4, lr	@ tmp372, _71, _73
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:64:         data[i][2] = data[i][7] - data[i][5]; // actually out[5]
	sub	r8, ip, r5	@ tmp381, _64, _66
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:71:         data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
	smlabb	r9, r9, fp, r10	@ tmp373, tmp372, tmp375, tmp376
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:76:         data[i][3] = DCT_RT2 * data[i][2] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
	smlabb	r8, r8, fp, r10	@ tmp382, tmp381, tmp375, tmp376
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:28:         data[i][3] = temp_value + data[i][2]; // actually out[0]
	uxth	r1, r1	@ _41, _35
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:30:         data[i][2] = data[i][0] + data[i][1]; // actually out[1]
	uxth	r2, r2	@ _47, _25
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:67:         data[i][4] = data[i][4] + data[i][6]; // actually out[4]
	add	lr, r4, lr	@ tmp371, _71, _73
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:65:         data[i][7] = data[i][7] + data[i][5]; // actually out[7]
	add	ip, ip, r5	@ tmp370, _64, _66
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:28:         data[i][3] = temp_value + data[i][2]; // actually out[0]
	add	r4, r1, r7	@ tmp463, _41, temp_value.0_42
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:30:         data[i][2] = data[i][0] + data[i][1]; // actually out[1]
	add	r5, r6, r2	@ tmp464, _46, _47
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:67:         data[i][4] = data[i][4] + data[i][6]; // actually out[4]
	uxth	lr, lr	@ _76, tmp371
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:65:         data[i][7] = data[i][7] + data[i][5]; // actually out[7]
	uxth	ip, ip	@ _69, tmp370
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:53:         data[i][1] = data[i][3] + data[i][2]; // actually out[0]
	uxth	r4, r4	@ _55, tmp463
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:53:         data[i][1] = data[i][3] + data[i][2]; // actually out[0]
	uxth	r5, r5	@ _57, tmp464
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:29:         temp_value = temp_value - data[i][2]; // actually out[3]
	sub	r7, r7, r1	@ tmp353, temp_value.0_42, _41
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:31:         data[i][0] = data[i][0] - data[i][1]; // actually out[2]
	sub	r2, r6, r2	@ tmp465, _46, _47
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:73:         temp_value = data[i][7] + data[i][4]; // x[7] -> X[1] (store as temp due to dependencies)
	add	r1, ip, lr	@ tmp391, _69, _76
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:74:         data[i][7] = data[i][7] - data[i][4]; // x[4] -> X[7]
	sub	r6, ip, lr	@ tmp378, _69, _76
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:71:         data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
	asr	r9, r9, #5	@ tmp377, tmp373,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:53:         data[i][1] = data[i][3] + data[i][2]; // actually out[0]
	add	lr, r4, r5	@ tmp472, _55, _57
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:54:         data[i][3] = data[i][3] - data[i][2]; // actually out[1]
	sub	ip, r4, r5	@ tmp470, _55, _57
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:76:         data[i][3] = DCT_RT2 * data[i][2] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
	asr	r8, r8, #5	@ tmp386, tmp382,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:11:     for (i = 0; i < 8; ++i)
	ldr	r4, [sp]	@ _465, %sfp
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:71:         data[i][5] = DCT_RT2 * data[i][5] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[6] -> X[5]
	strh	r9, [r3, #-6]	@ movhi	@ tmp377, MEM[base: _9, offset: 10B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:76:         data[i][3] = DCT_RT2 * data[i][2] + DCT_RT2_ROUND_VAL >> DCT_RT2_PRECISION; // x[5] -> X[3]
	strh	r8, [r3, #-10]	@ movhi	@ tmp386, MEM[base: _9, offset: 6B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:74:         data[i][7] = data[i][7] - data[i][4]; // x[4] -> X[7]
	strh	r6, [r3, #-2]	@ movhi	@ tmp378, MEM[base: _9, offset: 14B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:79:         data[i][1] = temp_value; // restore from temp
	strh	r1, [r3, #-14]	@ movhi	@ tmp391, MEM[base: _9, offset: 2B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:55:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.syntax divided
@ 55 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     r2, r2, #16	@ tmp366
	uxtah   r2, r2, r7  	@ tmp366, temp_value
	mul r2, r7	@ tmp366, temp_value
	add r2, r7	@ tmp366, temp_value
	mul r2, r7	@ tmp366, temp_value
	asr r2, r2, #7	@ tmp366
	asr     r2, r7, #16	@ tmp366, temp_value
	sxth    r7, r7	@ temp_value
@ 0 "" 2
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:78:         data[i][0] = data[i][1]; // x[0] -> X[0]
	.arm
	.syntax unified
	strh	lr, [r3, #-16]	@ movhi	@ tmp472, MEM[base: _9, offset: 0B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:72:         data[i][6] = temp_value; // x[3] -> X[6]
	strh	r7, [r3, #-4]	@ movhi	@ temp_value, MEM[base: _9, offset: 12B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:77:         data[i][2] = data[i][0]; // x[2] -> X[2]
	strh	r2, [r3, #-12]	@ movhi	@ tmp366, MEM[base: _9, offset: 4B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:75:         data[i][4] = data[i][3]; // x[1] -> X[4]
	strh	ip, [r3, #-8]	@ movhi	@ tmp470, MEM[base: _9, offset: 8B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:11:     for (i = 0; i < 8; ++i)
	cmp	r3, r4	@ ivtmp.26, _465
	add	r0, r0, #8	@ ivtmp.25, ivtmp.25,
	bne	.L2		@,
	ldr	r0, [sp, #4]	@ data, %sfp
	sub	r4, r0, #2	@ ivtmp.11, data,
	add	r1, r0, #14	@ _411, data,
.L3:
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:89:         temp_value = data[0][i] + data[7][i]; // actually out[0]
	ldrh	r7, [r4, #2]	@ _95, MEM[base: _343, offset: 0B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	ldrh	r9, [r4, #66]	@ _128, MEM[base: _343, offset: 64B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	ldrh	r8, [r4, #98]	@ _104, MEM[base: _343, offset: 96B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	ldrh	ip, [r4, #82]	@ _116, MEM[base: _343, offset: 80B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:89:         temp_value = data[0][i] + data[7][i]; // actually out[0]
	ldrh	fp, [r4, #114]	@ _97, MEM[base: _343, offset: 112B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	ldrh	r0, [r4, #50]	@ _126, MEM[base: _343, offset: 48B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	ldrh	r10, [r4, #18]	@ _102, MEM[base: _343, offset: 16B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	ldrh	r2, [r4, #34]	@ _114, MEM[base: _343, offset: 32B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:90:         data[7][i] = data[0][i] - data[7][i]; // actually out[7]
	sub	r3, r7, fp	@ tmp474, _95, _97
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:96:         data[4][i] = data[3][i] - data[4][i]; // actually out[4]
	sub	r6, r0, r9	@ tmp473, _126, _128
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:92:         data[6][i] = data[1][i] - data[6][i]; // actually out[6]
	sub	r5, r10, r8	@ tmp395, _102, _104
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:114:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.syntax divided
@ 114 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     r6, r6, #16	@ tmp406
	uxtah   r6, r6, r3  	@ tmp406, tmp407
	mul r6, r3	@ tmp406, tmp407
	add r6, r3	@ tmp406, tmp407
	mul r6, r3	@ tmp406, tmp407
	asr r6, r6, #7	@ tmp406
	asr     r6, r3, #16	@ tmp406, tmp407
	sxth    r3, r3	@ tmp407
@ 0 "" 2
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:89:         temp_value = data[0][i] + data[7][i]; // actually out[0]
	.arm
	.syntax unified
	add	fp, r7, fp	@ tmp392, _95, _97
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	uxth	r6, r6	@ _191, tmp406
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:94:         data[5][i] = data[2][i] - data[5][i]; // actually out[5]
	sub	r7, r2, ip	@ tmp397, _114, _116
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	uxth	r3, r3	@ _179, tmp407
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:106:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.syntax divided
@ 106 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     r7, r7, #16	@ tmp404
	uxtah   r7, r7, r5  	@ tmp404, tmp405
	mul r7, r5	@ tmp404, tmp405
	add r7, r5	@ tmp404, tmp405
	mul r7, r5	@ tmp404, tmp405
	asr r7, r7, #7	@ tmp404
	asr     r7, r5, #16	@ tmp404, tmp405
	sxth    r5, r5	@ tmp405
@ 0 "" 2
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	.arm
	.syntax unified
	uxth	r7, r7	@ _181, tmp404
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	uxth	r5, r5	@ _193, tmp405
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	add	r0, r0, r9	@ tmp398, _126, _128
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	add	r2, r2, ip	@ tmp396, _114, _116
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	add	r9, r10, r8	@ tmp394, _102, _104
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:139:         data[5][i] = data[4][i] - data[6][i]; // actually out[6]
	sub	ip, r6, r5	@ tmp418, _191, _193
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:137:         data[2][i] = data[7][i] - data[5][i]; // actually out[5]
	sub	r8, r3, r7	@ tmp439, _179, _181
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:95:         data[2][i] = data[3][i] + data[4][i]; // actually out[3]
	uxth	r0, r0	@ _129, tmp398
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:91:         data[0][i] = data[1][i] + data[6][i]; // actually out[1]
	uxth	r10, r9	@ _105, tmp394
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:93:         data[1][i] = data[2][i] + data[5][i]; // actually out[2]
	uxth	r2, r2	@ _117, tmp396
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:89:         temp_value = data[0][i] + data[7][i]; // actually out[0]
	uxth	fp, fp	@ _98, tmp392
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	sxth	r9, ip	@ tmp419, tmp418
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	sxth	r8, r8	@ tmp440, tmp439
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	add	ip, r9, #4	@ tmp420, tmp419,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	add	r8, r8, #4	@ tmp441, tmp440,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:101:         data[3][i] = temp_value + data[2][i]; // actually out[0]
	add	r9, fp, r0	@ tmp475, _98, _129
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:140:         data[4][i] = data[4][i] + data[6][i]; // actually out[4]
	add	r5, r6, r5	@ tmp432, _191, _193
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:103:         data[2][i] = data[0][i] + data[1][i]; // actually out[1]
	add	r6, r10, r2	@ tmp476, _105, _117
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	uxth	r9, r9	@ _165, tmp475
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	uxth	r6, r6	@ _167, tmp476
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:138:         data[7][i] = data[7][i] + data[5][i]; // actually out[7]
	add	r3, r3, r7	@ tmp431, _179, _181
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	asr	ip, ip, #3	@ tmp421, tmp420,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	asr	r7, r8, #3	@ tmp442, tmp441,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	sxth	r3, r3	@ _215, tmp431
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	sxth	r5, r5	@ _217, tmp432
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:102:         temp_value = temp_value - data[2][i]; // actually out[3]
	sub	fp, fp, r0	@ tmp401, _98, _129
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	add	ip, ip, ip, lsl #1	@ tmp424, tmp421, tmp421,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	add	r0, r7, r7, lsl #1	@ tmp445, tmp442, tmp442,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:127:         data[3][i] = data[3][i] - data[2][i]; // actually out[1]
	sub	r7, r9, r6	@ tmp482, _165, _167
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:126:         data[1][i] = data[3][i] + data[2][i]; // actually out[0]
	add	r6, r9, r6	@ tmp484, _165, _167
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:104:         data[0][i] = data[0][i] - data[1][i]; // actually out[2]
	sub	r10, r10, r2	@ tmp477, _105, _117
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	sub	r9, r3, r5	@ tmp433, _215, _217
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:128:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	.syntax divided
@ 128 "/root/repo/src/dct/loeffler_2d_fixed_asm.c" 1
	lsl     r10, r10, #16	@ tmp414
	uxtah   r10, r10, fp  	@ tmp414, temp_value
	mul r10, fp	@ tmp414, temp_value
	add r10, fp	@ tmp414, temp_value
	mul r10, fp	@ tmp414, temp_value
	asr r10, r10, #7	@ tmp414
	asr     r10, fp, #16	@ tmp414, temp_value
	sxth    fp, fp	@ temp_value
@ 0 "" 2
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	.arm
	.syntax unified
	rsb	r8, r0, r0, lsl #4	@ tmp447, tmp445, tmp445,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:150:         data[2][i] = (data[0][i] + (1<<2)) >> 3; // x[2] -> X[2]
	sxth	r2, r10	@ MEM[base: _343, offset: 0B], tmp414
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:128:         __asm__("lsl     %[left], %[left], #16"     "\n\t" // move left value to top 16 bits, clearing bottom 16
	sxth	fp, fp	@ temp_value, temp_value
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:148:         data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
	sxth	r10, r7	@ MEM[base: _343, offset: 48B], tmp482
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:151:         data[0][i] = (data[1][i] + (1<<2)) >> 3; // x[0] -> X[0]
	sxth	r6, r6	@ MEM[base: _343, offset: 16B], tmp484
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	rsb	ip, ip, ip, lsl #4	@ tmp426, tmp424, tmp424,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	add	r5, r3, r5	@ tmp456, _215, _217
	add	lr, r4, #2	@ ivtmp.11, ivtmp.11,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:148:         data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
	add	r7, r10, #4	@ tmp437, MEM[base: _343, offset: 48B],
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:145:         data[6][i] = (temp_value + (1<<2)) >> 3; // x[3] -> X[6]
	add	r0, fp, #4	@ tmp429, temp_value,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	add	r8, r8, #16	@ tmp448, tmp447,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:150:         data[2][i] = (data[0][i] + (1<<2)) >> 3; // x[2] -> X[2]
	add	fp, r2, #4	@ tmp451, MEM[base: _343, offset: 0B],
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	add	r9, r9, #4	@ tmp434, tmp433,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	add	ip, ip, #16	@ tmp427, tmp426,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:151:         data[0][i] = (data[1][i] + (1<<2)) >> 3; // x[0] -> X[0]
	add	r10, r6, #4	@ tmp454, MEM[base: _343, offset: 16B],
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	add	r3, r5, #4	@ tmp457, tmp456,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:150:         data[2][i] = (data[0][i] + (1<<2)) >> 3; // x[2] -> X[2]
	asr	r2, fp, #3	@ tmp452, tmp451,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	asr	ip, ip, #5	@ tmp428, tmp427,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	asr	fp, r8, #5	@ tmp449, tmp448,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:145:         data[6][i] = (temp_value + (1<<2)) >> 3; // x[3] -> X[6]
	asr	r0, r0, #3	@ tmp430, tmp429,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	asr	r8, r9, #3	@ tmp435, tmp434,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:151:         data[0][i] = (data[1][i] + (1<<2)) >> 3; // x[0] -> X[0]
	asr	r6, r10, #3	@ tmp455, tmp454,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:148:         data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
	asr	r9, r7, #3	@ tmp438, tmp437,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:84:     for (i = 0; i < 8; ++i)
	cmp	lr, r1	@ ivtmp.11, _411
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	asr	r7, r3, #3	@ tmp458, tmp457,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:144:         data[5][i] = (DCT_RT2 * (data[5][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[6] -> X[5]
	strh	ip, [r4, #82]	@ movhi	@ tmp428, MEM[base: _343, offset: 80B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:145:         data[6][i] = (temp_value + (1<<2)) >> 3; // x[3] -> X[6]
	strh	r0, [r4, #98]	@ movhi	@ tmp430, MEM[base: _343, offset: 96B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:150:         data[2][i] = (data[0][i] + (1<<2)) >> 3; // x[2] -> X[2]
	strh	r2, [r4, #34]	@ movhi	@ tmp452, MEM[base: _343, offset: 32B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:149:         data[3][i] = (DCT_RT2 * (data[2][i] + (1 << 2) >> 3) + DCT_RT2_ROUND_VAL) >> DCT_RT2_PRECISION; // x[5] -> X[3]
	strh	fp, [r4, #50]	@ movhi	@ tmp449, MEM[base: _343, offset: 48B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:147:         data[7][i] = (data[7][i] - data[4][i] + (1<<2)) >> 3; // x[4] -> X[7]
	strh	r8, [r4, #114]	@ movhi	@ tmp435, MEM[base: _343, offset: 112B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:148:         data[4][i] = (data[3][i] + (1<<2)) >> 3; // x[1] -> X[4]
	strh	r9, [r4, #66]	@ movhi	@ tmp438, MEM[base: _343, offset: 64B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:151:         data[0][i] = (data[1][i] + (1<<2)) >> 3; // x[0] -> X[0]
	strh	r6, [r4, #2]	@ movhi	@ tmp455, MEM[base: _343, offset: 0B]
	mov	r4, lr	@ ivtmp.11, ivtmp.11
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:146:         temp_value = (data[7][i] + data[4][i] + (1<<2)) >> 3; // x[7] -> X[1] (store as temp due to dependencies)
	strh	r7, [lr, #16]	@ movhi	@ tmp458, MEM[base: _343, offset: 16B]
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:84:     for (i = 0; i < 8; ++i)
	bne	.L3		@,
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:156: }
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}	@
	.size	dct_2d_fixed_asm, .-dct_2d_fixed_asm
	.align	2
	.global	dct_loeffler_2d_fixed_asm
	.syntax unified
	.arm
	.fpu vfpv3-d16
	.type	dct_loeffler_2d_fixed_asm, %function
dct_loeffler_2d_fixed_asm:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ /root/repo/src/dct/loeffler_2d_fixed_asm.c:160:     dct_2d_fixed_asm(data_in, data_out);
	b	dct_2d_fixed_asm		@
	.size	dct_loeffler_2d_fixed_asm, .-dct_loeffler_2d_fixed_asm
	.ident	"GCC: (GNU) 8.2.1 20180801 (Red Hat 8.2.1-2)"
	.section	.note.GNU-stack,"",%progbits
