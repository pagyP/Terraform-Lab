resource "azurerm_public_ip" "hubvpngw" {
  name                = var.vpnpipname
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Dynamic"
  tags              = var.tags
}


resource "azurerm_virtual_network_gateway" "hubvpngw" {
  name                = var.vpngwname
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = var.vpngwsku


  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.hubvpngw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gatewaysubnetid
  }
}