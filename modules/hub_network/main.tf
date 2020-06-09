
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
  for_each = var.subnet_config

  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.hubvnetrg.name
  virtual_network_name = azurerm_virtual_network.hubvnet.name
  address_prefixes     = [each.value.cidr_base]
}

#At one point I used a child module to create the subnets.  Seemed overly complex and unnecessary to do so
# module "subnets" {
#   source                = "./subnet"

#   resource_group        = azurerm_virtual_network.hubvnet.resource_group_name
#   virtual_network_name  = azurerm_virtual_network.hubvnet.name
#   subnets               = var.subnet_config
#   tags                  = var.tags
#   location              = azurerm_virtual_network.hubvnet.location
# }
/*
#The below was using count for the subnets.  Changed in favour of the for_each method above
resource "azurerm_subnet" "hubsubnets" {
  name                 = var.subnet_names[count.index]
  virtual_network_name = azurerm_virtual_network.hubvnet.name
  resource_group_name  = azurerm_resource_group.hubvnetrg.name
  #address_prefix       = var.subnet_prefixes[count.index]
  address_prefixes = [var.subnet_prefixes[count.index]]
  count                = length(var.subnet_names)
}
*/

#Before I figured out how to output the subnet IDs as a map I considered having a special subnets section
#to make it easier to output subnet IDs for things like VPN gateways and Azure firewall
#Special Subnets
/*resource "azurerm_subnet" "gatewaysubnet" { 
  name = "GateWaySubnet"
  virtual_network_name = azurerm_virtual_network.hubvnet.name
  resource_group_name = azurerm_resource_group.hubvnetrg.name
  address_prefix = "10.0.4.0/24"
  
}
*/