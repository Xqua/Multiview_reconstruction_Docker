#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "FourierConvolutionCUDALib" for configuration "Release"
set_property(TARGET FourierConvolutionCUDALib APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(FourierConvolutionCUDALib PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/usr/local/cuda-9.0/lib64/libcudart_static.a;-lpthread;dl;/usr/lib/x86_64-linux-gnu/librt.so;/usr/local/cuda-9.0/lib64/libcufft.so;/usr/lib/x86_64-linux-gnu/libcuda.so"
  IMPORTED_LOCATION_RELEASE "/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib.so"
  IMPORTED_SONAME_RELEASE "libFourierConvolutionCUDALib.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS FourierConvolutionCUDALib )
list(APPEND _IMPORT_CHECK_FILES_FOR_FourierConvolutionCUDALib "/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib.so" )

# Import target "FourierConvolutionCUDALib_static" for configuration "Release"
set_property(TARGET FourierConvolutionCUDALib_static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(FourierConvolutionCUDALib_static PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/usr/local/cuda-9.0/lib64/libcudart_static.a;-lpthread;dl;/usr/lib/x86_64-linux-gnu/librt.so;/usr/local/cuda-9.0/lib64/libcufft.so;/usr/lib/x86_64-linux-gnu/libcuda.so"
  IMPORTED_LOCATION_RELEASE "/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib_static.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS FourierConvolutionCUDALib_static )
list(APPEND _IMPORT_CHECK_FILES_FOR_FourierConvolutionCUDALib_static "/opt/multiview/CUDA/lib/libFourierConvolutionCUDALib_static.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
