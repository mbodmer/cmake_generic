# This module is shared by multiple languages; use include blocker.
if(__GENERIC_COMPILER_GNU_ARM)
  return()
endif()
set(__GENERIC_COMPILER_GNU_ARM 1)

macro(__generic_compiler_gnu_arm lang)
  # compiler options first
  if(CMAKE_${lang}_COMPILER_SPECFILES)
    foreach(specfile ${CMAKE_${lang}_COMPILER_SPECFILES})
      add_compile_options(--specs=${specfile})
    endforeach()
  endif()

  if(CMAKE_SYSTEM_PROCESSOR_ARCH)
    add_compile_options(-march=${CMAKE_SYSTEM_PROCESSOR_ARCH})
  endif()

  if(CMAKE_SYSTEM_PROCESSOR_CPU)
    add_compile_options(-mcpu=${CMAKE_SYSTEM_PROCESSOR_CPU})
  endif()

  if(CMAKE_SYSTEM_PROCESSOR_INSTRUCTION_SET)
    if(CMAKE_SYSTEM_PROCESSOR_INSTRUCTION_SET STREQUAL thumb)
      add_compile_options(-mthumb)
    endif()
  endif()

  if(CMAKE_SYSTEM_PROCESSOR_ABI)
    add_compile_options(-mabi=${CMAKE_SYSTEM_PROCESSOR_ABI})
  endif()

  if(CMAKE_SYSTEM_PROCESSOR_FPU)
    add_compile_options(-mfpu=${CMAKE_SYSTEM_PROCESSOR_FPU})
  endif()

  # assembler options
  if(CMAKE_SYSTEM_PROCESSOR_FP_ABI)
    add_compile_options(-Xassembler -mfloat-abi=${CMAKE_SYSTEM_PROCESSOR_FP_ABI})
  endif()

endmacro()
