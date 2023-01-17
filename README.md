# TRAVLUX Infrastructure

This repository is the infrastructure for the TRAVLUX Project.

> **Note**
> You can find the app repository [here](https://github.com/NourBelmabrouk/TravelLux).


## Deployment
We built the app using Docker and then Kubernetes for deployment.
### Kubernetes
The Cluster looks like the following:

![kubernetes](https://user-images.githubusercontent.com/62619786/212779816-a42f77d8-106c-40b3-b64d-af1013dfdf93.png)

- The microservices are in the default namespace.
- Each microservice is deployed via Helm Charts.
- The template contains the deployment , service, configMap and secrets for each microservice.
- Implemented Ingress to expose the website to the public and to enable communication between the front and the other microservices.

![app](https://user-images.githubusercontent.com/62619786/212779942-8a3be99f-2de2-4b7b-92c3-6903eec048a5.PNG)

### Deployment Strategy

## Automation

### Helm
We created Helm Charts that ArgoCD will use for automated deployment.
Any changes pushed made to the charts in the main branch will be updated in the cluster with the help of ArgoCD.

![1](https://user-images.githubusercontent.com/76130027/212870910-a3bbebab-9409-48fd-b366-815a90e9a6dc.PNG)

### Terraform
We used Terraform, which is an IAC tool to provision infrastructure, to build 2 microstacks:
 - Application Stack: We provisioned an AKS cluster and set-up the first Helm charts of our application.
 - Monitoring Stack: We created the observability tools for our application which are Prometheus, Grafana and Loki.

### Observability tools

- Grafana: for dashboarding.
- Prometheus: to store and query metrics.
- Grafana Loki: to store and query logs
- Jaeger: to collect traces and visualize them.
