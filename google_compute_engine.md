# Google Compute Engine tutorial

# Prepare
First you will need to create an account on Google Compute Engine. Go on https://cloud.google.com/ and activate your account.

Second, you need to choose a location that has a GPU capability, you can find this info here: https://cloud.google.com/compute/docs/gpus/. For example us-east1-c will allow you to add K80 or K100 Tesla cards.

Next you will need to increase your Quota to be able to add GPU to your machines. To do that, go to the IAM quota page https://console.cloud.google.com/iam-admin/quotas?project=deconvolution-189100&service=compute.googleapis.com

Search for your datacenter and the Telsa model you want to add (K100 or K80), it will be at the bottom of the page and look like:



gcloud compute scp ./data/config.yaml gpu-01:~/data  --zone us-east1-c
