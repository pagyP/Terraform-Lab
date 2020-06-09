variable "hub_vnet_name" {
  description = "Name of the vnet to create"
  default     = "hub_vnet"
}

variable "hub_resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "hub-vnet-rg"
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default     = "uksouth"
}

variable "hub_address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}

# If no values specified, this defaults to Azure DNS 
variable "hub_dns_servers" {
  description = "The DNSs servers to be used with vNet."
  default     = []
}

/*
variable "hub_subnet_prefixes" {
  type = list
  description = "The address prefix to use for the subnet."
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  #default     = ["10.0.1.0/24", "10.0.3.0/24"]
}

variable "hub_subnet_names" {
  description = "A list of public subnets inside the vNet."
  default     = ["GateWaySubnet", "Subnet2",  "Subnet3"]
  #default     = ["GateWaySubnet", "Subnet3"]
}
*/

variable "subnet_config" {
  type    = map
  default = {}
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map

  default = {
    tag1 = "hello"
    tag2 = "there!"
  }
}

variable "vpnpipname" {
  description = "The public IP for the VPN gateway"
  default     = "labgwpip"
}

variable "vpngwname" {
  description = "The name of the VPN gateway"
  default     = "labvpngw"
}

variable "vpngwsku" {
  description = "the sku type of the VPN gateway"
  default     = "Basic"
}

