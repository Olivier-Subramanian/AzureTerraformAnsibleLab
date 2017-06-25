
# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
}

resource "azurerm_storage_container" "dev-tfstate" {
    name                 = "dev-tfstate"
    storage_account_name = "100satflabstateinfra"
    resource_group_name  = "100-rgTFLabState"
    container_access_type = "private"
    }
/*terraform {
  backend "azure" {
    storage_account_name = "100satflabstateinfra"
    container_name       = "dev-tfstate"
    key                  = "dev.terraform.tfstate"
    resource_group_name  = "100-rgTFLabState"
  }
}*/

module "lab_network" {
  source = "./modules/network"
  StudentId = "${var.StudentId}"
  azure_region = "${var.azure_region}"
}

module "lab_bastion" {
  source = "./modules/singlevm"

  StudentId = "${var.StudentId}"
  azure_region = "${var.azure_region}"
  server_role     = "Bastion"
  subnet_id       = "${module.lab_network.snManagementId}"
  vm_size         = "Standard_d2_v2"
  publisher       = "Canonical"
  offer           = "UbuntuServer"
  sku             = "16.04-LTS"
  version         = "latest"
  computer_name   = "vmBastion01"
  admin_username  = "tflabadm"
  admin_password  = "${var.admin_password}"
}

module "lab_webscaleset" {
  source = "./modules/vmscaleset"

  StudentId = "${var.StudentId}"
  azure_region = "${var.azure_region}"
  server_role     = "WebServer"
  subnet_id       = "${module.lab_network.snApplicationId}"
  vm_size         = "Standard_d2_v2"
  publisher       = "Canonical"
  offer           = "UbuntuServer"
  sku             = "16.04-LTS"
  version         = "latest"
  computer_name   = "vmWebserver"
  admin_username  = "tflabadm"
  admin_password  = "${var.admin_password}"
}
