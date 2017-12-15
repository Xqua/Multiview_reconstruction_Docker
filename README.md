# Multiview_reconstruction_Docker
Docker Containerization of the Multiview Registration Plugin (https://github.com/preibischLab/multiview-reconstruction).

This is the repository for the docker image located at:

# Description
This docker image contains FIJI and the Multiview Reconstruction plugin developped by Stephan Preibisch. It has been built for CPU and GPU computing (Nvidia only) and works using the SnakeMake automated pipeline built by Stephan Preibisch (https://github.com/mpicbg-scicomp/snakemake-workflows).

The CUDA Library has been built under Ubuntu 16.04 for CUDA 9 compatibility and is integrated in the image, along with all dependencies.

# Usage

This docker image uses a mounted volume and launches N jobs as a parameter.

## Install Docker and Nvidia-Docker
Follow the installation steps to install docker on your platform: https://docs.docker.com/engine/installation/

## GPU computing requirements
If you want to perform GPU computing for the deconvolution step you need to install the CUDA driver on your machine (refer the the Nvidia CUDA install page: https://developer.nvidia.com/cuda-downloads)
Once this is working you need to install nvidia-docker as explained here: https://github.com/NVIDIA/nvidia-docker

## Prepare the data
- Create a data folder containing your TIFF stack or CZI images.
- copy the `config.yaml` file from this repository (https://github.com/Xqua/Multiview_reconstruction_Docker) to the same data folder (or modify as explained bellow in Important Notes.)
- Edit the `config.yaml` file to reflect your dataset structure and the analysis you want to perform on it (see the tutorial here: https://imagej.net/Automated_workflow_for_parallel_Multiview_Reconstruction)

## Launch the computation CPU
There are 3 flags that needs to be set, 2 volumes and 1 environnment variable:
- FULL_PATH_TO_YOUR_DATA:    data volume
- FULL_PATH_TO_A_LOG_FOLDER: log volume
- NUMBER_OF_CONCURRENT_JOBS: number of concurent jobs

```bash
sudo docker run \
-v FULL_PATH_TO_YOUR_DATA:/data/ \
-v FULL_PATH_TO_A_LOG_FOLDER:/opt/multiview/snakemake-workflows/spim_registration/timelapse/.snakemake/log/ \
-e 'NUM_JOBS=NUMBER_OF_CONCURRENT_JOBS' \
xqua:multiview_reconstruction:latest
```
example:

```bash
sudo docker run \
-v /scratch/flyEmbryo:/data/ \
-v /var/log/snakemake:/opt/multiview/snakemake-workflows/spim_registration/timelapse/.snakemake/log/ \
-e 'NUM_JOBS=8' \
xqua:multiview_reconstruction:latest
```

## GPU enabled
You need to replace the docker command with the nvidia-docker tool as such:

```bash
sudo nvidia-docker run \
-v FULL_PATH_TO_YOUR_DATA:/data/ \
-v FULL_PATH_TO_A_LOG_FOLDER:/opt/multiview/snakemake-workflows/spim_registration/timelapse/.snakemake/log/ \
-e 'NUM_JOBS=NUMBER_OF_CONCURRENT_JOBS' \
xqua:multiview_reconstruction:latest
```

# Important notes

## Using your own config.yaml

If you are using your own config.yaml there are 3 lines that you must change for as shown below it to work with the docker container:
```
# current working Fiji
fiji-app: "/opt/multiview/2015-06-30_Fiji.app/ImageJ-linux64",
# bean shell scripts and Snakefile
bsh_directory: "/opt/multiview/snakemake-workflows/spim_registration/timelapse/",
# Directory that contains the cuda libraries
directory_cuda: "/opt/multiview/CUDA/lib",
```

## Deconvolution missing file error:
If you see this error trying to launch a deconvolution:
```
MissingInputException in line 377 of /opt/multiview/snakemake-workflows/spim_registration/timelapse/Snakefile:
Missing input files for rule deconvolution:
dataset_one_merge.xml_timelapse_transform
```

You need to add an empty file in your data repository:
`touch /PATH/TO/DATA/dataset_one_merge.xml_timelapse_transform`

## Deconvolution GPU Error CUFFT_ALLOC_FAILED

If you get a `CUFFT_ALLOC_FAILED` error, it means your GPU is running out of memory. The probable reason for this is that the block size you defined for the deconvolution is too big to be handle by your card. It is easily fixed by changing the block_size parameter in the `config.yaml`:
Valid values (that I know off) are: 
- `"in 64x64x64 blocks"`
- `"in 128x128x128 blocks"`
- `"in 256x256x256 blocks"`
- `"in 512x512x512 blocks"`

```
compute: '"in 256x256x256 blocks"',
```
