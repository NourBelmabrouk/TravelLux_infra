# TRAVLUX Infrastructure

This repository is the infrastructure for the TRAVLUX Project.

> **Note**
> You can find the app repository [here](https://github.com/NourBelmabrouk/TravelLux).


## Deployment
We built the app using Docker and then Kubernetes for deployment.
### Kubernetes
The Cluster looks like the following:

![kubernetes](https://user-images.githubusercontent.com/62619786/212779816-a42f77d8-106c-40b3-b64d-af1013dfdf93.png)

- The 4 microservices are in the default namespace.
- Each microservice is deployed via Helm Charts.
- The template contains Deployment + Service.

![app](https://user-images.githubusercontent.com/62619786/212779942-8a3be99f-2de2-4b7b-92c3-6903eec048a5.PNG)

### Deployment Strategy

## Automation

### Helm
We created Helm Charts that Argo CD will use for automated deployment.

### Terraform
We used Terraform which is an IAC tool to provision infrastructure and set-up the first Helm charts.

### Monitoring tools

- Grafana: for dashboarding.
- Prometheus: to store and query metrics.
- Grafana Loki: to store and query logs
- Jaeger: to collect traces and visualize them.
