if (SZIP_EXTERNALLY_CONFIGURED)
    install(
        EXPORT ${SZIP_EXPORTED_TARGETS}
        DESTINATION ${PACKAGE_CONFIG_DIR}
    )
    include(CMakePackageConfigHelpers)
    WRITE_BASIC_PACKAGE_VERSION_FILE(${CMAKE_CURRENT_BINARY_DIR}/szip-config-version.cmake
        COMPATIBILITY AnyNewerVersion)
    install(
        FILES ${CMAKE_CURRENT_BINARY_DIR}/szip-config-version.cmake
        DESTINATION ${PACKAGE_CONFIG_DIR}
    )
    install(
        FILES
            src/ricehdf.h
        DESTINATION
            ${SZIP_INSTALL_INCLUDE_DIR}
        COMPONENT
            headers
    )
endif()
