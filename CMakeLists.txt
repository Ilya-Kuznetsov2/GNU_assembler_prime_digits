cmake_minimum_required(VERSION 3.10)
project(caos ASM)

add_compile_options(-m32)
add_link_options(-m32)



add_executable(prog pros.s simpleio_i686.S)