# Google Compute Engine tutorial

# Prepare
First you will need to create an account on Google Compute Engine. Go on https://cloud.google.com/ and activate your account.

Second, you need to choose a location that has a GPU capability, you can find this info here: https://cloud.google.com/compute/docs/gpus/. For example us-east1-c will allow you to add K80 or K100 Tesla cards.

Next you will need to increase your Quota to be able to add GPU to your machines. To do that, go to the IAM quota page https://console.cloud.google.com/iam-admin/quotas?project=deconvolution-189100&service=compute.googleapis.com

Search for your datacenter and the Telsa model you want to add (K100 or K80), it will be at the bottom of the page.

Once your Quota is accepeted, you can create a VM. For the deconvolution of a cube of 500px, you will need at least 40Gb RAM. Select a GPU and create your machine.

Make sure the size of HDD you choose is big enough to contain 2x the size of your dataset.

Once you have your machine ready, you can move to the next step, installing the dependencies.

# Install dependencies

Open a SSH console to your new created VM, and download the install script.

`wget https://github.com/Xqua/Multiview_reconstruction_Docker/blob/master/google_compute_engine.sh`

Install the dependencies:

`chmod +x google_compute_engine.sh`

`./google_compute_engine.sh`

Once it is finished restart the machine:

`sudo reboot now`

Once it has restarted test it with:

`sudo docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi`

# Transfer your data to your server

Install the Gcloud SDK on the machine that will transfer the data: https://cloud.google.com/sdk/gcloud/

Once this is done, you can transfer the files on the server using the Gcloud SCP:

`gcloud compute scp /PATH/ON/COMPUTER/* gpu-01:/PATH/ON/VM  --zone YOUR_ZONE`

# Launch the computation

Once your files are on the server, follow the main README.md files.
