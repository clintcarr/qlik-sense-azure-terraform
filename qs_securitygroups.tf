resource "azurerm_network_security_group" "qlikSense_nsg" {
  name                = "qlikSense_nsg"
  location            = "${azurerm_resource_group.qlikSense.location}"
  resource_group_name = "${azurerm_resource_group.qlikSense.name}"
}

resource "azurerm_network_security_rule" "https" {
  name                        = "https"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.qlikSense.name}"
  network_security_group_name = "${azurerm_network_security_group.qlikSense_nsg.name}"
}

resource "azurerm_network_security_rule" "rdp" {
  name                        = "rdp"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${azurerm_resource_group.qlikSense.name}"
  network_security_group_name = "${azurerm_network_security_group.qlikSense_nsg.name}"
}
