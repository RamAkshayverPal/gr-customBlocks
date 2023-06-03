find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_CUSTOMBLOCKS gnuradio-customBlocks)

FIND_PATH(
    GR_CUSTOMBLOCKS_INCLUDE_DIRS
    NAMES gnuradio/customBlocks/api.h
    HINTS $ENV{CUSTOMBLOCKS_DIR}/include
        ${PC_CUSTOMBLOCKS_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_CUSTOMBLOCKS_LIBRARIES
    NAMES gnuradio-customBlocks
    HINTS $ENV{CUSTOMBLOCKS_DIR}/lib
        ${PC_CUSTOMBLOCKS_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-customBlocksTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_CUSTOMBLOCKS DEFAULT_MSG GR_CUSTOMBLOCKS_LIBRARIES GR_CUSTOMBLOCKS_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_CUSTOMBLOCKS_LIBRARIES GR_CUSTOMBLOCKS_INCLUDE_DIRS)
