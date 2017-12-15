FROM nvidia/cuda:9.0-devel-ubuntu16.04

LABEL com.nvidia.volumes.needed="nvidia_driver"

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update
# RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get update && \
    apt-get install -y \
    ocl-icd-libopencl1 \
    clinfo \
    python-software-properties \
    wget \
    git \
    python3-pip \
    python3 \
    xvfb \
    libxtst6 \
    # openjdk-9-jdk \
    openjdk-9-jre
    # oracle-java9-installer

RUN pip3 install snakemake pyyaml drmaa

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd && \
    echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/cuda-9.0/lib64:/usr/lib/x86_64-linux-gnu:/usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# Downloading FIJI and scripts
WORKDIR /opt/multiview
RUN mkdir /data && \
    git clone https://github.com/mpicbg-scicomp/snakemake-workflows.git && \
    wget http://tomancak-srv1.mpi-cbg.de/~schmied/workflow/2015-06-30_Fiji.app.tar.gz && \
    tar zxvf 2015-06-30_Fiji.app.tar.gz
RUN git clone https://github.com/obmarg/libsysconfcpus.git
RUN cd libsysconfcpus && \
    CFLAGS=-ansi ./configure && \
    make && \
    make install

# ADD ./libFourierConvolutionCUDALib.so /opt/multiview/CUDA/libFourierConvolutionCUDALib.so
RUN apt-get install -y cmake  libboost*
# RUN git clone https://github.com/StephanPreibisch/FourierConvolutionCUDALib.git
# RUN cd FourierConvolutionCUDALib && \
#     mkdir build && cd build && \
#     cmake -DCMAKE_INSTALL_PREFIX=/opt/multiview/CUDA .. && \
#     make && \
#     ctest && \
#     make install
ADD CUDA /opt/multiview/CUDA
ADD FourierConvolutionCUDALib /opt/multiview/FourierConvolutionCUDALib

WORKDIR /opt/multiview/snakemake-workflows/spim_registration/timelapse/

ENV NUM_JOBS 1
CMD snakemake -j $NUM_JOBS -d /data --verbose --cluster-config /opt/multiview/snakemake-workflows/spim_registration/timelapse/cluster.json --cluster ""
# RUN mkdir /opt/multiview/CUDA
# RUN ls /usr/lib/
# RUN mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=/opt/multiview/CUDA .. && LIBRARY_PATH=/usr/lib/nvidia-384:$LIBRARY_PATH make
# RUN ctest
# RUN make install
