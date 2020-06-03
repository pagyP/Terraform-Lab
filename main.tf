terraform {
  required_version = ">= 0.12"
}

provider "azurerm" {
  version = ">= 2.0"
  features {}
}
#Configure Remote State
#terraform{
#   backend "azurerm"{}
#}
module "hubnetwork" {
  source              = "./modules/hub_network/"
  vnet_name           = var.hub_vnet_name
  resource_group_name = var.hub_resource_group_name
  location            = var.location
  address_space       = var.hub_address_space
  subnets = var.subnet_config
  #subnet_prefixes     = var.hub_subnet_prefixes
  #subnet_names        = var.hub_subnet_names
  #subnet_prefixes = var.subnet_config
  #subnet_names = var.subnet_config

  tags = var.tags
}

module "vpngw" {
  source              = "./modules/vpn_gateway/"
  vpngwname           = var.vpngwname
  resource_group_name = module.hubnetwork.hubrgname
  location            = var.location
  vpnpipname          = var.vpnpipname
  #gatewaysubnetid     = module.hubnetwork.vnet_subnets[0]
  #gatewaysubnetid = module.hubnetwork.module.subnets.output.subnet_ids_map[each.key].id
  gatewaysubnetid = lookup(module.hubnetwork.subnet_ids_map, "GatewaySubnet", null)
  tags = var.tags
  vpngwsku            = var.vpngwsku
}



