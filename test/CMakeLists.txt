cmake_minimum_required (VERSION 2.8)
PROJECT (SZIP_TEST)

#-----------------------------------------------------------------------------
# Setup include Directories
#-----------------------------------------------------------------------------
INCLUDE_DIRECTORIES (${SZIP_SOURCE_DIR})

#-----------------------------------------------------------------------------
# Define Sources
#-----------------------------------------------------------------------------
SET (TEST_LIB_SRCS
    ${SZIP_TEST_SOURCE_DIR}/mcgill.c
)

SET (TEST_LIB_HEADERS
    ${SZIP_TEST_SOURCE_DIR}/mcgill.h
)

ADD_LIBRARY (${SZIP_TEST_LIB_TARGET} ${LIB_TYPE} ${TEST_LIB_SRCS} ${TEST_LIB_HEADERS})
TARGET_LINK_LIBRARIES (${SZIP_TEST_LIB_TARGET} ${SZIP_LIB_TARGET})
#SET_GLOBAL_VARIABLE (SZIP_LIBRARIES_TO_EXPORT "${SZIP_LIBRARIES_TO_EXPORT};${SZIP_TEST_LIB_TARGET}")
SZIP_SET_LIB_OPTIONS (${SZIP_TEST_LIB_TARGET} ${SZIP_TEST_LIB_NAME} ${LIB_TYPE})

#-- Adding test 
if(SZIP_ENABLE_ENCODING)
  add_executable(gentest gentest.c)
  TARGET_NAMING(gentest)
  target_link_libraries (gentest ${SZIP_TEST_LIB_TARGET} ${SZIP_LIB_TARGET})
  add_test(NAME gentest COMMAND $<TARGET_FILE:gentest>)
endif()
