#
# system setup
#------------------------------------------------------------
message("Configuring with Toolchain Linux-XilinxBoard-enterprise-image.cmake")
set(TARGET_ARCH "arm")
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_VERSION 1)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

set(ENV{TARGET_PREFIX}                  "aarch64-poky-linux-")
set(CROSS_PREFIX                        "aarch64-poky-linux")
set(PATH_SDK_NATIVE                     "/opt/sca_enterprise_sdk_xilinx-sca/sysroots/x86_64-pokysdk-linux")
set(PATH_SDK_NATIVE_CROSS               "${PATH_SDK_NATIVE}/usr/bin/${CROSS_PREFIX}")
set(PATH_SDK_TARGET                     "/opt/sca_enterprise_sdk_xilinx-sca/sysroots/aarch64-poky-linux")

set(ENV{PKG_CONFIG_SYSROOT_DIR}         ${PATH_SDK_TARGET})
set(ENV{PKG_CONFIG_PATH}                ${PATH_SDK_TARGET}/usr/lib/pkgconfig)
set(ENV{PKG_CONFIG_LIBDIR}              ${PATH_SDK_TARGET}/usr/lib/pkgconfig)

set(CMAKE_C_COMPILER        "${PATH_SDK_NATIVE_CROSS}/aarch64-poky-linux-gcc")
set(CMAKE_C_COMPILER_INIT   "-mcpu=cortex-a53+crypto+crc -march=armv8-a -feliminate-unused-debug-types --sysroot=${PATH_SDK_TARGET}")
set(CMAKE_C_FLAGS           "${CMAKE_C_COMPILER_INIT} -Wall -Wno-unused-variable " CACHE STRING "Flags used by the compiler during all build types." FORCE)
set(CMAKE_C_FLAGS_DEBUG     "${CMAKE_C_FLAGS} -g")
set(CMAKE_C_FLAGS_RELEASE   "${CMAKE_C_FLAGS} -O3")

set(CMAKE_CXX_COMPILER      "${PATH_SDK_NATIVE_CROSS}/aarch64-poky-linux-g++")
set(CMAKE_CXX_COMPILER_INIT "-mcpu=cortex-a53+crypto+crc -march=armv8-a -feliminate-unused-debug-types --sysroot=${PATH_SDK_TARGET}")
set(CMAKE_CXX_FLAGS         "${CMAKE_CXX_COMPILER_INIT} -Wall  " CACHE STRING "Flags used by the compiler during all build types." FORCE)
set(CMAKE_CXX_FLAGS_DEBUG   "${CMAKE_CXX_FLAGS} -g")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} -O3")

set(CMAKE_SHARED_LINKER_FLAGS "-O1 --sysroot=${PATH_SDK_TARGET}")

set(CMAKE_FIND_ROOT_PATH                ${PATH_SDK_TARGET})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM   NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY   ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE   ONLY)

#------------------------------------------------------------

#
# path setup
#------------------------------------------------------------
include_directories(
    ${PATH_SDK_TARGET}/usr/include
)

link_directories(
    ${PATH_SDK_TARGET}/lib
    ${PATH_SDK_TARGET}/usr/lib
    ${PATH_SDK_TARGET}/usr/lib/${CROSS_PREFIX}/
    ${TOOLCHAIN_PATH}/usr/lib
)
#------------------------------------------------------------
