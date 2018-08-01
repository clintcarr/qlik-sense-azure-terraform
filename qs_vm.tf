resource "azurerm_virtual_machine" "qlikSense" {
  name                  = "qlikSense"
  location              = "${azurerm_resource_group.qlikSense.location}"
  resource_group_name   = "${azurerm_resource_group.qlikSense.name}"
  network_interface_ids = ["${azurerm_network_interface.qlikSense_nic.id}"]
  vm_size               = "Standard_D2s_v3"

  storage_image_reference {
    publisher = "qlik"
    offer     = "qlik-sense"
    sku       = "qliksense"
    version   = "latest"
  }

  plan {
    name      = "qliksense"
    publisher = "qlik"
    product   = "qlik-sense"
  }

  storage_os_disk {
    name              = "qlikSenseosDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.server_hostname}"
    admin_username = "${var.windows_administrator}"
    admin_password = "${var.windows_administrator_pass}"
  }

  os_profile_windows_config {
    provision_vm_agent = true
    enable_automatic_upgrades = false
  }

  tags {
    environment = "production"
  }
}
