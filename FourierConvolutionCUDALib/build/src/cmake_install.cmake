# Install script for directory: /opt/multiview/FourierConvolutionCUDALib/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/opt/multiview/CUDA")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/opt/multiview/CUDA/lib" TYPE SHARED_LIBRARY FILES "/opt/multiview/FourierConvolutionCUDALib/build/src/libFourierConvolutionCUDALib.so")
  if(EXISTS "$ENV{DESTDIR}/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib.so"
         OLD_RPATH "/usr/local/cuda-9.0/lib64:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib.so")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/opt/multiview/CUDA/include/convolution3Dfft.h;/opt/multiview/CUDA/include/FourierConvolutionCUDALib_Export.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/opt/multiview/CUDA/include" TYPE FILE FILES
    "/opt/multiview/FourierConvolutionCUDALib/src/convolution3Dfft.h"
    "/opt/multiview/FourierConvolutionCUDALib/src/FourierConvolutionCUDALib_Export.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib_static.a")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/opt/multiview/CUDA/lib" TYPE STATIC_LIBRARY FILES "/opt/multiview/FourierConvolutionCUDALib/build/src/libFourierConvolutionCUDALib_static.a")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/opt/multiview/CUDA/include/convolution3Dfft.h;/opt/multiview/CUDA/include/FourierConvolutionCUDALib_Export.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/opt/multiview/CUDA/include" TYPE FILE FILES
    "/opt/multiview/FourierConvolutionCUDALib/src/convolution3Dfft.h"
    "/opt/multiview/FourierConvolutionCUDALib/src/FourierConvolutionCUDALib_Export.h"
    )
endif()

