resource "azurerm_public_ip_prefix" "hubipprefix" {
  name                = "nat-gateway-publicIPPrefix"
  location            = var.location
  resource_group_name = var.resource_group_name
  prefix_length       = 30
  zones               = ["1"]
}

resource "azurerm_nat_gateway" "hubnatgw" {
  name                    = var.hub_vnet_natgw_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  public_ip_prefix_ids    = [azurerm_public_ip_prefix.hubipprefix.id]
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]
}

resource "azurerm_subnet_nat_gateway_association" "hubsubassociation" {
  subnet_id      = var.subnet_associations[2]
  nat_gateway_id = azurerm_nat_gateway.hubnatgw.id
}