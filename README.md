# Embedded Systems Optimization Project

## Introduction
The Discrete Cosine Transform (DCT) is a technique to extract frequency-domain information from a given input signal. The DCT and the Discrete Fourier Transform (DFT) are equivalent for real and even functions [1]. The Discrete Sine Transform (DST) and the DFT are equivalent for real and odd functions. Only the DCT is explored in the scope of this project.
The DCT has a number of useful properties. The most useful property is its ability to de-correlate data within an image. This can reduce the redundancy that exists within an image – for example, the sky in a photo – which enables the image to be compressed. The DCT also focuses the energy of the signal into the terms near the beginning of the sequence. This energy compaction property focuses the larger coefficients into the upper left quadrant of each two-dimensional output block. This enables output blocks to be selectively dropped or reduced, which achieves more efficient, but lossy, compression.
The DCT is used in industry as a component of the JPEG and MPEG image compression standards. N×N blocks are used, where N=8 is most common. As consumers demand faster and higher quality data, and consistent performance increases, we must continue to focus on bringing more performance and data in the same amount of space. Hardware and firmware support for image compression, including the DCT, is an important component of the solution.
In this project, our goal was to implement the DCT as efficiently as possible on an ARM-based processor.
We performed the following optimization:
- Explore possible optimizations in the purely software approach
    - Write the un-optimized routine
    - Write the two-step routine using row-column separation routine
    - Write the Loeffler algorithm routine
    - Convert the Loeffler algorithm to an inline routine
    - Convert the Loeffler algorithm to a macro
- Improve performance by exploring software optimization techniques such as loop unrolling and reorganizing code execution to improve caching
- Compile the program into assembly, and optimize by hand the resulting assembly code
    - Assemble the code and simulate on a cycle-accurate simulator
- Create a theoretical “butterfly” operation that is supported in firmware or hardware
    - Optionally define the details of this operation
- Compile the code to assembly with this new instruction
    - This code will not be assembled, since doing so will result in an error
- Propose two solutions for a 1-issue and 2-issue slot micro-encoded engine
    - Determine computing performance of both solutions by hand by counting the number of cycles
- Determine theoretical latency of a purely hardware-supported butterfly operator and estimate the performance increase to both the butterfly operation and the overall DCT computation

## Background
The input of each DCT operation is an N×N block, with N=8 commonly. In this project, we will use N=8. This block will be an 8×8 image block consisting of 8-bit grayscale values, i.e. 8-bit unsigned integers. The DCT will be performed in the context of JPG image compression. Thus, the first step is a level-off operation that reduces the overall energy of the signal. This causes the range of each input element to change from [0,255] to [-128,127]. This modified sequence is then used as input to the DCT block, which the project aims to optimize. The 2-D matrix thus has a maximum possible value of its DC average, X(0,0), which for 64 elements each ranging from [-127,128]  results in a maximum possible value of 4096. Thus, the DCT operation takes an 8×8 block of 8-bit signed integers and outputs a 12-bit number and a sign. The parameters for the DCT operation are the image pointer and the width and height of the image, in pixels. This must be an integer multiple of the block dimensions. If it is not, the image input will be padded with zeroes on the right and bottom.

## TODO Under Construction