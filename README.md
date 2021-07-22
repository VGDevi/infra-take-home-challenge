# Take Home Challenge

Our objective here is to understand the candidate's knowledge about Kubernetes, Helm, and Terraform. The Infrastructure and Operations Team at Mobimeo uses these tools heavily in our day-to-day work.

In [`./lib/terraform-modules`](./lib/terraform-modules) you'll find sub-directories for different components of a Kubernetes cluster - [`./lib/terraform-modules/prometheus`](./lib/terraform-modules/prometheus) and [`./lib/terraform-modules/loki`](./lib/terraform-modules/loki) for observability, [`./lib/terraform-modules/postgres`](./lib/terraform-modules/postgres) and [`./lib/terraform-modules/app`](./lib/terraform-modules/app) for some kind of simple backend service. These directories are skeleton modules that can be updated by you. There are no configurations, secrets, deployments, or even pointers to safe Docker images. This is your challenge.

You might also be wondering where the K8s cluster is. This is also your challenge!

## Tasks:

- Fork this repo and submit your results as PR from your own Github account

- Create a Kubernetes cluster with Terraform and any additional tooling/scripting of your choice or own devising. You can use any Kubernetes distro you like - minikube, kind, a Vagrantfile and some fancy `kubeadm` scripting, etc. If you want to use a public cloud, please use AWS. The objective here is to give us something we can run here at Mobimeo to review the rest of your work. And we don't have a GCP or an Azure account that we can use for this. We do have both Mac and Linux laptops.

- Fill in the `app` Terraform module to Deploy a basic application on the cluster you created. This can be a simple 'hello world' container or a vanilla 'Welcome to nginx!' server. But if you find a cool containerized app to deploy, we appreciate creativity and exploration!

- Ensure an ingress is created and that the Mobimeo engineer who reviews your implementation knows how to access it/curl it in order to see 'hello world' or 'welcome to nginx' or the echo server.

- Update [main.tf](./main.tf) and this README in the root directory. You may also need to update the providers that you find there. Make sure that the engineer reviewing your work has all the information they need to run your scripts, build your cluster, and repeat the setup you did.

==============
Completed the above tasks. Please run the below steps to deploy the cluster and app

- Clone the repository
- terraform init --> to install all the providers and modules
- terraform plan , terraform apply to install the cluster.
- Run terraform output config_map_aws_auth and save the config output to a file config.yaml
- Run run kubectl apply -f config.yaml ->> this creates an aws-auth configmap in that helps to join nodes to the cluster
- 

#Accessing the application

- Once the application is installed run kubectl get ingress -n app and copy the Address --> this is the dns name of the ALB.
- curl -H "Host: chart-example.local" <dns name copied above> -> this will send curl request to the application with the required host
