cmake_minimum_required(VERSION 3.6)

# The "Generic" system name is used for embedded targets without OS
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

# Known ARM ABIs (for use with the -mabi= option):
#  aapcs aapcs-linux apcs-gnu atpcs iwmmxt
set(CMAKE_SYSTEM_PROCESSOR_ABI aapcs)

# Known ARM architectures (for use with the -march= option):
#  armv2 armv2a armv3 armv3m armv4 armv4t armv5 armv5e armv5t armv5te armv6
#  armv6-m armv6j armv6k armv6s-m armv6t2 armv6z armv6zk armv7 armv7-a armv7-m
#  armv7-r armv7e-m armv7ve armv8-a armv8-a+crc iwmmxt iwmmxt2 native
set(CMAKE_SYSTEM_PROCESSOR_ARCH  armv7e-m)

# Known ARM CPUs (for use with the -mcpu= and -mtune= options):
#  arm1020e arm1020t arm1022e arm1026ej-s arm10e arm10tdmi arm1136j-s
#  arm1136jf-s arm1156t2-s arm1156t2f-s arm1176jz-s arm1176jzf-s arm2 arm250
#  arm3 arm6 arm60 arm600 arm610 arm620 arm7 arm70 arm700 arm700i arm710
#  arm7100 arm710c arm710t arm720 arm720t arm740t arm7500 arm7500fe arm7d
#  arm7di arm7dm arm7dmi arm7m arm7tdmi arm7tdmi-s arm8 arm810 arm9 arm920
#  arm920t arm922t arm926ej-s arm940t arm946e-s arm966e-s arm968e-s arm9e
#  arm9tdmi cortex-a12 cortex-a15 cortex-a15.cortex-a7 cortex-a5 cortex-a53
#  cortex-a57 cortex-a57.cortex-a53 cortex-a7 cortex-a8 cortex-a9 cortex-m0
#  cortex-m0.small-multiply cortex-m0plus cortex-m0plus.small-multiply
#  cortex-m1 cortex-m1.small-multiply cortex-m3 cortex-m4 cortex-m7 cortex-r4
#  cortex-r4f cortex-r5 cortex-r7 ep9312 fa526 fa606te fa626 fa626te fa726te
#  fmp626 generic-armv7-a iwmmxt iwmmxt2 marvell-pj4 mpcore mpcorenovfp native
#  strongarm strongarm110 strongarm1100 strongarm1110 xscale
set(CMAKE_SYSTEM_PROCESSOR_CPU cortex-m4)

# Known ARM FPUs (for use with the -mfpu= option):
#  crypto-neon-fp-armv8 fp-armv8 fpv4-sp-d16 fpv5-d16 fpv5-sp-d16 neon
#  neon-fp-armv8 neon-fp16 neon-vfpv4 vfp vfp3 vfpv3 vfpv3-d16 vfpv3-d16-fp16
#  vfpv3-fp16 vfpv3xd vfpv3xd-fp16 vfpv4 vfpv4-d16
set(CMAKE_SYSTEM_PROCESSOR_FPU fpv4-sp-d16)

# Known floating-point ABIs (for use with the -mfloat-abi= option):
#  hard soft softfp
set(CMAKE_SYSTEM_PROCESSOR_FP_ABI hard)

set(CMAKE_SYSTEM_PROCESSOR_INSTRUCTION_SET thumb)

# Avoid running the linker while try_compile() for cross-compiling
# toolchains that cannot link without custom flags or linker scripts
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_C_COMPILER_TARGET arm-none-eabi)
set(CMAKE_C_COMPILER_SPECFILES nosys.specs)

set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_CXX_COMPILER_TARGET arm-none-eabi)
set(CMAKE_CXX_COMPILER_SPECFILES nosys.specs)

set(CMAKE_FIND_ROOT_PATH /usr/lib/arm-none-eabi)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
