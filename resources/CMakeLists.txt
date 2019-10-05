configure_file(my.service.in "${CMAKE_CURRENT_BINARY_DIR}/my.service" COPYONLY)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/my.service DESTINATION ${CMAKE_INSTALL_FULL_SYSCONFDIR}/systemd/system)
