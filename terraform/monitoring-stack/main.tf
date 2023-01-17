data "terraform_remote_state" "aks" {
  backend = "azurerm"
  config = {
    resource_group_name  = "devops-project"
    storage_account_name = "devopsprojectbackend"
    container_name       = "backend"
    key                  = "terraform.tfstate"
  }
}

resource "helm_release" "prometheus" {
  name = "prometheus"
  chart = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  values = [ "${file("./helm-values/prometheus-values.yaml")}" ]
}

resource "helm_release" "grafana" {
  name = "grafana"
  chart = "grafana"
  repository = "https://grafana.github.io/helm-charts"
}

resource "helm_release" "loki" {
  name = "grafana"
  chart = "grafana/loki"
  repository = "https://grafana.github.io/helm-charts"
  values = [ "${file("./helm-values/grafana-values.yaml")}" ]
}