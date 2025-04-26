provider "azurerm" {
  features {}
  subscription_id = "bf9c4a23-fb6a-43a2-a6c4-9e224b69b5ac"
}

resource "azurerm_resource_group" "exam" {
  name     = "examResourceGroup"
  location = "East US"
}

resource "azurerm_virtual_network" "exam_vnet" {
  name                = "examVNet"
  location            = azurerm_resource_group.exam.location
  resource_group_name = azurerm_resource_group.exam.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "exam_subnet" {
  name                 = "examSubnet"
  resource_group_name  = azurerm_resource_group.exam.name
  virtual_network_name = azurerm_virtual_network.exam_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
