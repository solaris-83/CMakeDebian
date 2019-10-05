add_custom_target(
    backend ALL COMMENT "Building the dotnet-part..."
)

add_custom_command(
    TARGET backend
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMAND rm -rf ${CMAKE_CURRENT_BINARY_DIR}/backend
    COMMAND rm -rf ${CMAKE_CURRENT_SOURCE_DIR}/bin/Release/netcoreapp2.2/publish
    COMMAND dotnet publish -c Release
    COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/backend/myapp
    COMMAND cp -a ${CMAKE_CURRENT_SOURCE_DIR}/bin/Release/netcoreapp2.2/publish/* ${CMAKE_CURRENT_BINARY_DIR}/backend/myapp
)

message("CMAKE_CURRENT_SOURCE_DIR --> ${CMAKE_CURRENT_SOURCE_DIR}")
message("CMAKE_CURRENT_BINARY_DIR --> ${CMAKE_CURRENT_BINARY_DIR}")

install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/backend/myapp" DESTINATION /usr/lib USE_SOURCE_PERMISSIONS PATTERN ".git" EXCLUDE)
install(PROGRAMS "${CMAKE_CURRENT_SOURCE_DIR}/my-dotnet-app" DESTINATION bin)
