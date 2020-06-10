subnet_config = {
  Gateway = {
    name      = "GatewaySubnet"
    cidr_base = "10.0.1.0/24"
  }
  Dmz2 = {
    name      = "Dmz22"
    cidr_base = "10.0.2.0/24"
  }
  Prod = {
    name      = "Prod"
    cidr_base = "10.0.3.0/24"
  }
  Dev = {
    name      = "Dev"
    cidr_base = "10.0.4.0/24"
  }
  Dev2 = {
    name      = "Dev2"
    cidr_base = "10.0.5.0/24"
  }
}

hub_address_space = "10.0.0.0/16"

hub_resource_group_name  = "hub-vnet-rg"

location  = "northeurope"

hub_vnet_name = "hub_vnet"

tags =   {
    customer    = "Lab"
    environment = "Dev"
    IaCMethod  = "terraform"
    deployedby = "Manual"
  }

vpnpipname = "labgwpip"

vpngwname = "labvpngw"

vpngwsku = "Basic"
    
