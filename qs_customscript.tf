resource "azurerm_virtual_machine_extension" "qlikSense_custom_script" {
  name                 = "install_qse"
  location             = "${azurerm_resource_group.qlikSense.location}"
  resource_group_name  = "${azurerm_resource_group.qlikSense.name}"
  virtual_machine_name = "${azurerm_virtual_machine.qlikSense.name}"
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
    {
        "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.qlikSense_powershell_script.rendered)}')) | Out-File -filepath c:\\qlikSenseUserdata.ps1\" && powershell -ExecutionPolicy Unrestricted -File c:\\qlikSenseUserdata.ps1"
    }
SETTINGS
}

data "template_file" "qlikSense_powershell_script" {
  template = "${file("./qlikSenseUserdata.ps1")}"

  vars {
    user                       = "${var.windows_administrator}"
    password                   = "${var.windows_administrator_pass}"
    qse_svc_password           = "${var.qse_svc_password}"
    qse_db_admin_password      = "${var.qse_db_admin_password}"
    qse_db_repository_password = "${var.qse_db_repository_password}"
    qse_license                = "${var.qse_license}"
    qse_control                = "${var.qse_control}"
    qse_name                   = "${var.qse_name}"
    qse_org                    = "${var.qse_org}"
  }
}
