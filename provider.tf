
provider "azurerm" {
  version = "=2.3.0"
  features {}
  subscription_id = "5652c124-c26e-4794-aa1c-79ff06c51131"
  client_id       = "36baaee0-b871-4ece-b02a-027c009c00bc"
  client_secret   = "14g7]_Rrs?VB6=sh2t4S[wYzK_p0VfI9"
  tenant_id       = "8ac5aed4-f3af-48ac-9c9b-601de02603fa"
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