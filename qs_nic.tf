resource "azurerm_public_ip" "qlikSense_pubIP" {
  name                         = "qsPubIP"
  location                     = "${azurerm_resource_group.qlikSense.location}"
  resource_group_name          = "${azurerm_resource_group.qlikSense.name}"
  public_ip_address_allocation = "Dynamic"
  idle_timeout_in_minutes      = 30

  tags {
    environment = "production"
  }
}

resource "azurerm_network_interface" "qlikSense_nic" {
  name                = "qlikSense_Nic"
  location            = "${azurerm_resource_group.qlikSense.location}"
  resource_group_name = "${azurerm_resource_group.qlikSense.name}"

  ip_configuration {
    name                          = "qlikSenseconfiguration1"
    subnet_id                     = "${azurerm_subnet.qlikSense_subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.qlikSense_pubIP.id}"
  }
}
