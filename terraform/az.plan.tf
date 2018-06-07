# Configure the Azure Provider
provider "azurerm" {
  environment = "public"
  version = "~> 1.3"
}

resource "azurerm_resource_group" "pom" {
  name     = "infra-pom"
  location = "West Europe"

  tags {
    environment = "terraform"
  }
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "pom-vnet"
  address_space       = ["10.2.0.0/16"]
  location            = "${azurerm_resource_group.pom.location}"
  resource_group_name = "${azurerm_resource_group.pom.name}"

  tags {
    environment = "terraform"
  }
}

resource "azurerm_subnet" "snet1" {
  name                 = "pom-snet"
  resource_group_name  = "${azurerm_resource_group.pom.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet1.name}"
  address_prefix       = "10.2.0.0/24"
}

resource "azurerm_network_interface" "pom" {
  name                = "pom-nic"
  location            = "${azurerm_resource_group.pom.location}"
  resource_group_name = "${azurerm_resource_group.pom.name}"

  ip_configuration {
    name                          = "pom-ip"
    subnet_id                     = "${azurerm_subnet.snet1.id}"
    private_ip_address_allocation = "dynamic"
  }

  tags {
    environment = "terraform"
  }
}
