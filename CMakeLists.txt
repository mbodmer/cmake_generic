cmake_minimum_required(VERSION 3.0)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_EXPORT_COMPILE_COMMANDS true)

project(project_zero VERSION 0.0.1 LANGUAGES C CXX)

include_directories(src)

add_executable(project_zero.c.elf
  src/main.c
  src/startup.c
)

add_executable(project_zero.cpp.elf
  src/main.cpp
  src/startup.cpp
)

target_link_libraries(project_zero.c.elf nosys)

target_link_libraries(project_zero.cpp.elf nosys)

set(LDSCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/src/ldscript.ld)

set_target_properties(project_zero.c.elf PROPERTIES
  LINK_FLAGS "-Wl,-T ${LDSCRIPT} -Wl,-gc-sections"# -Wl,--entry=ResetISR"
  COMPILE_FLAGS "-fno-common -ffunction-sections -fdata-sections"
  COMPILE_FLAGS_DEBUG "-gdwarf-2")

set_target_properties(project_zero.cpp.elf PROPERTIES
  LINK_FLAGS "-Wl,-T ${LDSCRIPT} -Wl,-gc-sections"# -Wl,--entry=ResetISR"
  COMPILE_FLAGS "-fno-common -ffunction-sections -fdata-sections -fno-rtti -fno-exceptions"
  COMPILE_FLAGS_DEBUG "-gdwarf-2")

add_custom_command(TARGET project_zero.c.elf POST_BUILD
  COMMAND ${CMAKE_OBJCOPY} -Oihex $<TARGET_FILE:project_zero.c.elf> project_zero.c.hex
  COMMAND ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:project_zero.c.elf> project_zero.c.bin
  COMMENT "converting ELF to HEX and BIN")

add_custom_command(TARGET project_zero.cpp.elf POST_BUILD
  COMMAND ${CMAKE_OBJCOPY} -Oihex $<TARGET_FILE:project_zero.cpp.elf> project_zero.cpp.hex
  COMMAND ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:project_zero.cpp.elf> project_zero.cpp.bin
  COMMENT "converting ELF to HEX and BIN")
