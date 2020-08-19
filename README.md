# Embedded Systems Optimization Project

## Getting Started
After cloning the repository, make a new directory called `build` and run `cmake ..` within it. The following CMake options are available, along with their defaults:

- `ENABLE_OPT` **(false)**: Enables various optimization targets each with a different optimization flag
- `ENABLE_MACRO_EXPANSION` **(false)**: Enables a target which expands macros and other pre-processor directives
- `ENABLE_OUTPUT` **(true)**: Enables printing to console of each DCT block
- `ENABLE_SAVE_ASM` **(false)**: Enables the compiler to save intermediate assembly `.s` files

The following CMake options are only available on an ARM C compiler:

- `ENABLE_ASM_COMPILATION` **(false)**: Enables our target which contains our theoretical BTRFLY instruction that is hard-coded in ARM \_\_asm__ statements. To test the performance of this, change `BTRFLY_ASM_TYPE` in `include/util/constants.h` to `2`, which replaces the theoretical operator with an equivalent latency series of operations
- `ENABLE_OPT_MAX` **(false)**: Enables a target with maximum optimization flags on
- `ENABLE_BTRFLY_OPERATOR` **(true)**: Enables the assembly to be generated with BTRFLY operator. `ENABLE_SAVE_ASM` must be enabled. This will not run as it is a theoretical hardware operator.

The code is designed to be optimized for ARM 32-bit processor, and thus requires an ARM Linux GCC compiler to run the most optimized code. **By default, it will compile for an x86 processor.**

### Running `dct` target
To run the `dct` target, you need to pass it an input file. Sample files are stored in the `test` directory. Use the following command to run with a sample input:

`./dct <input 8-bit image> <width> <height>`

For example, the following will run it on the 8x8 test image.

`./dct ../test/64_byte_input 8 8`

### Running the highest optimized `dct` target on ARM
To run the highest optimized version on **ARM** compiler, with `BTRFLY` replaced with the equivalent latency assembly instructions, run CMake with the following options:

`cmake .. -DENABLE_ASM_COMPILATION=TRUE -DENABLE_BTRFLY_OPERATOR=FALSE -DENABLE_OPT_MAX=TRUE` (optional `ENABLE_OPT=TRUE -DENABLE_OUTPUT=FALSE`)

To view the optimized assembly code with the `BTRFLY` operator, run (Note this will cause a bad instruction error and thus cannot run):

`cmake .. -DENABLE_ASM_COMPILATION=TRUE -DENABLE_BTRFLY_OPERATOR=FALSE -DENABLE_SAVE_ASM=TRUE -DENABLE_OPT_MAX=TRUE` (optional `ENABLE_OPT=TRUE -DENABLE_OUTPUT=FALSE`)

### Running Valgrind profiling
To run Valgrind profiling, use the script in the `script` folder. Update the `BASE` variable with the repository root directory. It is suggested to use a minimum of the following CMake options:

#### x86
`cmake .. ENABLE_OPT=TRUE -DENABLE_OUTPUT=FALSE`

#### ARM
`cmake .. -DENABLE_ASM_COMPILATION=TRUE -DENABLE_BTRFLY_OPERATOR=FALSE -DENABLE_OPT_MAX=TRUE ENABLE_OPT=TRUE -DENABLE_OUTPUT=FALSE`

### Visualize Valgrind profiling output
Run `kcachegrind` followed by the output file (stored in `valgrind` folder), and then change to `Cycle Estimation` and turn off `% Relative`

## Introduction
The Discrete Cosine Transform (DCT) is a technique to extract frequency-domain information from a given input signal. The DCT is used in industry as a component of the JPEG and MPEG image compression standards. N×N blocks are used, where N=8 is most common. As consumers demand faster and higher quality data and consistent performance increases, it is increasingly important to optimize data compaction and transmission speeds. Hardware and firmware support for image compression, including the DCT, is an important component of the solution.

The DCT operates based on multiplying two same-size square matrices together in a specified way. This is performed for each element of the same-size DCT output matrix. Thus, the mathematically defined algorithm has a time complexity of O(n^4). The DCT plays an integral role in JPEG compression. While a quartic time complexity is not ideal, the JPEG compression standard reduces its impact by breaking the image into 8×8 blocks and performing DCT on each block.

### Project Details
In this project, we implemented the DCT algorithm in C and optimized the performance using more efficient software algorithms, software-level optimizations, and hypothetical firmware- and hardware-based optimizations. Our goal was a performance improvement of at least 10-fold compared to the naïve algorithm. Our learning goals were to understand low-level programming, CMake projects, the compiler code translation process, and hardware-software-firmware co-design.

To improve code portability and practice modular design, we used CMake [1] to build our various executable targets and add in custom compilation flags. We followed robust C programming techniques to reduce code debt and bugs. For version control, we used GitHub repository hosting [2] and Git version control [3]. In order to test the correctness of our algorithm, we verified the results with a MATLAB [4] script. The code we wrote conforms to C99 standards and runs on all architectures supported by gcc or any standard-conforming C compiler. The only elements of our code that required a specific compiler were our assembly-optimized implementations, which required an ARM-compatible C compiler and an ARM processor or virtual machine.

The algorithm takes an 8-bit image as an input. We assume that the dimensions of the image conform to the 8×8 block size JPEG requirement, since it is trivial to add padding to the image to meet these dimension requirements. In the context of JPEG compression, we examine only the DCT component. We require a minimum of 32-bit registers on our target architecture, as the intermediary values of the DCT calculation are sensitive to precision and some assembly optimizations require 32-bit registers. The algorithm output is a set of 16-bit 8×8 blocks. We output to the console in signed hexadecimal form for debugging purposes.

For each different software optimization implementation of the DCT, we compiled the program with each different compiler optimization level available from the ARM GCC compiler, executed the program on a test input file, measured the performance using valgrind [5], and analyzed the results. Additionally, to enable an efficient development and testing workflow, we utilized CMake files and bash scripts to automatically configure, compile, and test the various iterations of the implementation.

### Contributions
The work was split between two team members, and both members were involved in all aspects of each other’s work. A high-level overview of the work consists of the following modules:

- *CMake project configuration*: Set up the repository structure, targets, and options
- *Various DCT algorithms*: Algorithm implementation for naïve, two-step, and Loeffler DCT algorithms (details in next section)
- *Optimizations*: C and assembly optimizations to improve code performance
- *Code profiling*: Use valgrind, cachegrind, and callgrind [5] to profile various optimization levels, and visualize using kcachegrind [6]

## Background
The DCT transforms a finite sequence of data points into a sum of cosine functions with different oscillation frequencies. The DCT is related to the Discrete Fourier Transform (DFT) in that both transform from the time or spatial domain to the frequency domain. For DFT, the sequences are complex exponential of the form e^(j2πkn/N). This results in the output sequence to be, in general, complex-valued even if the input sequence is real. This is not ideal for some digital applications, as complex calculations require the storage of twice the numbers – one real, one imaginary – and complex multiplications, which are slower than single-valued real multiplications. 

In contrast, the DCT is an orthogonal transform that uses cosines as its basis sequence [7]. It is similar to the DFT in that they both are built on an implicit assumption of periodicity. However, the DCT also has an implicit assumption of even symmetry. In fact, the DCT and the Discrete Fourier Transform (DFT) are equivalent for real and even functions [8]. There are many methods of extending a finite length signal into a periodic symmetric function, and these represent the four different forms of the DCT [7]. 

The DCT has a number of useful properties. The most useful property is its ability to de-correlate data within an image. This can reduce the redundancy that exists within an image – for example, the sky in a photo – which enables the image to be represented using less space. The DCT also focuses the energy of the signal into the terms near the beginning of the sequence. This energy compaction property focuses the larger coefficients into the upper left quadrant of each two-dimensional output block. This enables output blocks to be selectively dropped or reduced, which achieves more efficient, but lossy, compression.

The input of each DCT operation is an N×N block, with N=8 commonly. In this project, we will use N=8. This block will be an 8×8 image block consisting of 8-bit grayscale values, i.e. 8-bit unsigned integers. The DCT will be performed in the context of JPEG image compression. Thus, the first step in JPEG compression is a level-off operation that reduces the overall energy of the signal. This causes the range of each input element to change from [0,255] to [-128,127]. This modified sequence is then used as input to the DCT block, which the project aims to optimize. The 2-D matrix thus has a maximum possible value of its DC average, X(0,0), which for 64 elements each ranging from [-128,127] and a X(0,0) coefficient of 1/(2×2×√2×√2)=1/8 results in a maximum possible value of +1016/-1024. Thus, the DCT operation takes an 8×8 block of 8-bit signed integers and outputs a 10-bit number and a sign.   The parameters for the DCT operation are the image pointer and the width and height of the image, in pixels. This must be an integer multiple of the block dimensions. If it is not, the image input will be padded with zeroes on the right and bottom.

## Design
### Implementations
The DCT was implemented in each of the following ways, referred to hereafter as “implementation(s) (1) through (8)”:

1.	As an un-optimized routine using the naïve method and floating-point operands.
2.	As a two-step routine with row-column separation, using coefficient matrix multiplication for each dimension and floating-point operands.
3.	As a two-step routine with row-column separation, using Loeffler’s algorithm for each dimension and floating-point operands.
4.	As previous, with 32-bit fixed-point operands and the Butterfly operation implemented as a routine.
5.	As previous, with 16-bit fixed-point operands.
6.	As previous, with the Butterfly operation implemented as an inline routine.
7.	As previous, with the Butterfly operation implemented as a C macro.
8.	As previous, with the Butterfly operation implemented as a theoretical assembly instruction using hand-coded \_\_asm__ statements.

Each implementation took an 8x8 matrix of signed 8-bit integers as input and produced an 8x8 matrix of signed 16-bit integers as output. The input values from the loaded image file were unsigned 8-bit integers, so, to reduce the energy of the signal and thus the number of bits required to represent the data as signed integers, a level-off operation was performed before calling any of the implementations, which subtracted 128 from each 8-bit unsigned integer value and produced an 8-bit signed integer value. An inverse DCT operation would thus need to add 128 to each value as a final step in recreating the original image.

### CMake Project Structure
We organized the project into the following structure:

- *build*: CMake build directory, ignored by git
- *include*: all C header files, each with a flag to prevent repeated includes
- *scripts*: MATLAB script for ground truth 2D DCT and bash script for running Valgrind with multiple executables on a test input
- *src*: C source files containing the definition of all functions
- *test*: Various test inputs
- *valgrind*: Code profiling outputs from Valgrind

In terms of our source code, we organized it into distinct modules for each of our implementations (1) to (8). In particular, we have:

- *main.c*: Read input file, perform level-off, and call dct function
- *dct.c*: Delegate calling of different implementations based on command line options (default to all)
- *dct folder*: Code for each of the implementations (1) to (8)
- *util folder*: Utilities such as constants, enumerations, helper functions, and rounding macros

## Conclusion

The most optimized implementation of the DCT achieved our goal of substantial performance improvements of at least 10x as compared to the naïve implementation. However, as compared to the matrix-multiplication-based implementation, the most optimized implementation achieved a performance improvement of less than our goal of 10x. Inline and macro did offer performance benefits compared to the code without these, but at higher optimization flags the compiler produced no difference between the two. The most substantial performance improvements came from implementing Loeffler’s algorithm, converting from floating-point to fixed-point arithmetic, removing the transpose operations, and converting the Butterfly operation from a routine to a firmware instruction. We also met our learning goals of low-level programming, CMake projects, the compiler code translation process, and hardware-software-firmware co-design. Overall, we consider the project to be a success.

## Future Work

The speed of the most optimized implementation could likely be improved further, if additional time were spent on the project. The primary area of focus would be on optimizing the assembly code.  Improving processor pipelining by merging loop iterations in the Loeffler algorithm could provide performance improvements, although this may reduce performance by increasing the number of registers required to store all operands. Reordering operations after Loeffler’s first step could additionally provide performance improvements, as the top four operands are independent of the bottom four operands and could be calculated independently. Loop unrolling across iterations of Loeffler’s algorithm could also be attempted; however, this must be profiled to ensure that it results in an overall speedup, given the resulting reduced instruction cache performance. Finally, using ARM vector operations to perform the 1D DCT on multiple rows or columns simultaneously would likely improve performance substantially.


## References

[1]	“Build with CMake. Build with confidence.,” CMake. [Online]. Available: https://cmake.org/. [Accessed: 16-Aug-2020]. 

[2]	“Build software better, together,” GitHub. [Online]. Available: https://github.com/. [Accessed: 16-Aug-2020].

[3]	“Git --distributed-is-the-new-centralized,” Git. [Online]. Available: https://git-scm.com/. [Accessed: 16-Aug-2020].

[4]	“MATLAB,” MathWorks. [Online]. Available: https://www.mathworks.com/products/matlab.html. [Accessed: 16-Aug-2020].

[5]	Valgrind. [Online]. Available: https://valgrind.org/. [Accessed: 16-Aug-2020].

[6]	KCachegrind. [Online]. Available: https://kcachegrind.github.io/html/Home.html. [Accessed: 16-Aug-2020].

[7]	A. V. Oppenheim and L. Lee, Discrete-time signal processing, 3rd ed. Pearson, 2009. 

[8]	SENG 440 Embedded Systems: Lesson 109: Discrete Cosine Transform (DCT), Dr. M. Sima, University of Victoria, Victoria, BC, 2019.

[9]	Loeffler, C.; Ligtenberg, A.; Moschytz, G.S. Practical Fast 1-D DCT Algorithms with 11 Multiplications. In Proceedings of the International Conference on Acoustics, Speech, and Signal Processing, Glasgow, UK, 23–26 May 1989; Volume 2; pp. 988–991.

[10]	Fedora ARM Virtual Machine. [Online]. Available: https://stede.seng.uvic.ca/studentrepo/?dir=./Software/seng440. [Accessed 16-Aug-2020].

[11]	“SIMD ISAs: Neon Intrinsics Reference,” Arm Developer. [Online]. Available: https://developer.arm.com/architectures/instruction-sets/simd-isas/neon/intrinsics. [Accessed: 17-Aug-2020].


## TODO Add images to README