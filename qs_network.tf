resource "azurerm_virtual_network" "qlikSense_virtualNetwork" {
  name                = "qlikSense_VN"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.qlikSense.location}"
  resource_group_name = "${azurerm_resource_group.qlikSense.name}"
}

resource "azurerm_subnet" "qlikSense_subnet" {
  name                      = "qlikSense_Sub"
  resource_group_name       = "${azurerm_resource_group.qlikSense.name}"
  virtual_network_name      = "${azurerm_virtual_network.qlikSense_virtualNetwork.name}"
  address_prefix            = "10.0.2.0/24"
  network_security_group_id = "${azurerm_network_security_group.qlikSense_nsg.id}"
}
