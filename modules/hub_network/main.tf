resource "azurerm_resource_group" "hubvnetrg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}


resource "azurerm_virtual_network" "hubvnet" {
  name                = var.vnet_name
  location            = var.location
  address_space       = [var.address_space]
  resource_group_name = azurerm_resource_group.hubvnetrg.name
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "hub_subnet" {
for_each                = var.subnet_config

  name                    = each.value.name
  resource_group_name     = azurerm_resource_group.hubvnetrg.name
  virtual_network_name    = azurerm_virtual_network.hubvnet.name
  address_prefix          = each.value.cidr_base
}

output "subnet_ids_map" {

  depends_on = [azurerm_subnet.hub_subnet ]
  #value = azurerm_subnet.hub_subnet[each.key]
  value = {
    for subnet in azurerm_subnet.hub_subnet:
    subnet.name => subnet.id
  }
}
# module "subnets" {
#   source                = "./subnet"

#   resource_group        = azurerm_virtual_network.hubvnet.resource_group_name
#   virtual_network_name  = azurerm_virtual_network.hubvnet.name
#   subnets               = var.subnet_config
#   tags                  = var.tags
#   location              = azurerm_virtual_network.hubvnet.location
# }
/*
resource "azurerm_subnet" "hubsubnets" {
  name                 = var.subnet_names[count.index]
  virtual_network_name = azurerm_virtual_network.hubvnet.name
  resource_group_name  = azurerm_resource_group.hubvnetrg.name
  #address_prefix       = var.subnet_prefixes[count.index]
  address_prefixes = [var.subnet_prefixes[count.index]]
  count                = length(var.subnet_names)
}
*/
/*
resource "azurerm_subnet" "hubsubnets" {
  for_each = var.subnet_config
  subnet_config = var.subnet_config
  name                 = each.value.name
  virtual_network_name = azurerm_virtual_network.hubvnet.name
  resource_group_name  = azurerm_resource_group.hubvnetrg.name
  #address_prefix       = var.subnet_prefixes[count.index]
  address_prefixes = each.value.cidr_base
  #count                = length(var.subnet_names)
}
*/

#Special Subnets
/*resource "azurerm_subnet" "gatewaysubnet" { 
  name = "GateWaySubnet"
  virtual_network_name = azurerm_virtual_network.hubvnet.name
  resource_group_name = azurerm_resource_group.hubvnetrg.name
  address_prefix = "10.0.4.0/24"
  
}
*/