data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "app" {
  name                = "travellux-cluster"
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  dns_prefix          = "projectgl5"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}


locals {
  host                   = azurerm_kubernetes_cluster.app.kube_config.0.host
  username               = azurerm_kubernetes_cluster.app.kube_config.0.username
  password               = azurerm_kubernetes_cluster.app.kube_config.0.password
  client_certificate     = base64decode(azurerm_kubernetes_cluster.app.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.app.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.app.kube_config.0.cluster_ca_certificate)
}

provider "kubernetes" {
  alias = "my-cluster"
  host                   = local.host
  username               = local.username
  password               = local.password
  client_certificate     = local.client_certificate
  client_key             = local.client_key
  cluster_ca_certificate = local.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = local.host
    username               = local.username
    password               = local.password
    client_certificate     = local.client_certificate
    client_key             = local.client_key
    cluster_ca_certificate = local.cluster_ca_certificate
  }
}


resource "helm_release" "project" {
  name       = "travellux"
  chart      = var.chart
}