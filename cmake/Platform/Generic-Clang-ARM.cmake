# This module is shared by multiple languages; use include blocker.
if(__GENERIC_COMPILER_CLANG_ARM)
  return()
endif()
set(__GENERIC_COMPILER_CLANG_ARM 1)

macro(__generic_compiler_clang_arm lang)

  #add_compile_options(-nobuiltininc)

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

  if(CMAKE_SYSTEM_PROCESSOR_FP_ABI)
    add_compile_options(-mfloat-abi=${CMAKE_SYSTEM_PROCESSOR_FP_ABI})
  endif()

endmacro()
