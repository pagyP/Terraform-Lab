terraform {
  required_version = ">= 0.12"
}

provider "azurerm" {
  version = ">= 2.0"
  features {}
}
#Configure Remote State - To be used when in a CICD pipeline
#terraform{
#   backend "azurerm"{}
#}
module "hubnetwork" {
  source              = "./modules/hub_network/"
  vnet_name           = var.hub_vnet_name
  resource_group_name = var.hub_resource_group_name
  location            = var.location
  address_space       = var.hub_address_space
  #subnets = var.subnet_config
  #subnet_prefixes     = var.hub_subnet_prefixes
  #subnet_names        = var.hub_subnet_names
  #subnet_prefixes = var.subnet_config
  #subnet_names = var.subnet_config
  subnet_config = var.subnet_config

  tags = var.tags
}

module "vpngw" {
  source              = "./modules/vpn_gateway/"
  vpngwname           = var.vpngwname
  resource_group_name = module.hubnetwork.hubrgname
  location            = var.location
  vpnpipname          = var.vpnpipname
  #Below line was used when subnets were in a list
  #gatewaysubnetid     = module.hubnetwork.vnet_subnets[0]
  gatewaysubnetid = lookup(module.hubnetwork.subnet_ids_map, "GatewaySubnet", null)
  tags = var.tags
  vpngwsku            = var.vpngwsku
}




