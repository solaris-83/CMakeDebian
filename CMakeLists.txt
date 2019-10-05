cmake_minimum_required(VERSION 3.5)

project(sca-cpp-cmake-example VERSION 0.0.1)

#
# aditional cmake packages
#------------------------------------------------------------

# this module is required to have the variables CMAKE_INSTALL_*
# and CMAKE_INSTALL_FULL_* set. These should then be used in
# install() instead of using absolute paths as the locations
# could be different depending on the runtime-system.
include(GNUInstallDirs)
#------------------------------------------------------------


#
# An executable
#------------------------------------------------------------
#add_executable(my-app main.cpp)
#install(TARGETS my-app DESTINATION ${CMAKE_INSTALL_FULL_BINDIR})
#------------------------------------------------------------

#
# subdirs
#------------------------------------------------------------
add_subdirectory(resources)
add_subdirectory(backend)
#------------------------------------------------------------

#
# packaging for the target-system
#------------------------------------------------------------
SET(CPACK_GENERATOR "DEB")

set(CPACK_PACKAGE_DESCRIPTION "my-executable")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "my-executable")
set(CPACK_PACKAGE_VENDOR "Company Name")
set(CPACK_PACKAGE_CONTACT "maintainer@company.com")
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
string(TOLOWER ${CMAKE_PROJECT_NAME} PROJECT_NAME_LOWERCASE)
set(CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME_LOWERCASE}_${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "${PROJECT_NAME_LOWERCASE}_${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")
set(CPACK_DEBIAN_PACKAGE_PRIORITY "optional")
set(CPACK_DEBIAN_PACKAGE_SECTION "application")
#set(CPACK_DEBIAN_PACKAGE_DEPENDS "")
set(CPACK_DEBIAN_ARCHITECTURE ${CMAKE_SYSTEM_PROCESSOR})
set(CPACK_SET_DESTDIR ON)
set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY 0)
SET(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA
   "${CMAKE_CURRENT_SOURCE_DIR}/resources/CPack_scripts/postinst;${CMAKE_CURRENT_SOURCE_DIR}/resources/CPack_scripts/prerm;${CMAKE_CURRENT_SOURCE_DIR}/resources/CPack_scripts/conffiles")
#set(CPACK_DEBIAN_FILE_NAME "${CPACK_PACKAGE_FILE_NAME}_${CPACK_DEBIAN_ARCHITECTURE}.ipk")
include(CPack)
#------------------------------------------------------------
