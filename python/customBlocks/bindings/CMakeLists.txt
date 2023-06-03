# Copyright 2020 Free Software Foundation, Inc.
#
# This file is part of GNU Radio
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

########################################################################
# Check if there is C++ code at all
########################################################################
if(NOT customBlocks_sources)
    MESSAGE(STATUS "No C++ sources... skipping python bindings")
    return()
endif(NOT customBlocks_sources)

########################################################################
# Check for pygccxml
########################################################################
GR_PYTHON_CHECK_MODULE_RAW(
    "pygccxml"
    "import pygccxml"
    PYGCCXML_FOUND
    )

include(GrPybind)

########################################################################
# Python Bindings
########################################################################

list(APPEND customBlocks_python_files
    permutation_python.cc python_bindings.cc)

GR_PYBIND_MAKE_OOT(customBlocks
   ../../..
   gr::customBlocks
   "${customBlocks_python_files}")

# copy bindings extension for use in QA test module
add_custom_command(TARGET customBlocks_python POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:customBlocks_python>
    ${PROJECT_BINARY_DIR}/test_modules/gnuradio/customBlocks/
)

install(TARGETS customBlocks_python DESTINATION ${GR_PYTHON_DIR}/gnuradio/customBlocks COMPONENT pythonapi)
