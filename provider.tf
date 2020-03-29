
provider "azurerm" {
  version = "=2.3.0"
  features {}
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
}

terraform {
  backend "azurerm" {
  storage_account_name = "terraformstateg"
  container_name       = "tfstate"
  key                  = "2d31be49-d999-4415-bb65-8aec2c90ba62.terraform.tfstate"
  access_key           = "tR3TTlctXM96ujooRlEnh+R/o09LWPOOV08KV9R1BFPmJbtgR3m7odVC5vK8G5HOgBH6RMPzC9VHify8SjwmNg=="
  }
}

provider "kubernetes" {
    version                 = "~> 1.3"
    host                    = "${azurerm_kubernetes_cluster.aks.kube_config.0.host}"
    client_certificate      = "${base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)}"
    client_key              = "${base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)}"
    cluster_ca_certificate  = "${base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)}"
}
