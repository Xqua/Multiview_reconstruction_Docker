# CMake generated Testfile for 
# Source directory: /opt/multiview/FourierConvolutionCUDALib
# Build directory: /opt/multiview/FourierConvolutionCUDALib/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(gpu_convolve "/opt/multiview/FourierConvolutionCUDALib/build/tests/test_gpu_convolve")
add_test(gpu_numerical_stability "/opt/multiview/FourierConvolutionCUDALib/build/tests/test_gpu_numerical_stability")
add_test(how_cufft_works "/opt/multiview/FourierConvolutionCUDALib/build/tests/test_how_cufft_works")
subdirs(src)
subdirs(tests)
