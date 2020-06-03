variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = "acctvnet"
}

variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "myapp-rg"
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "10.0.0.0/16"
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  default     = []
}

variable "subnet_prefixes" {
  type = list
  description = "The address prefix to use for the subnet."
  default     = ["10.0.1.0/24"]
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  default     = ["subnet1"]
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map

  default = {
    tag1 = "hello"
    tag2 = "there!"
  }
}

# variable "subnet_config" {
#     default = {}
# }
variable "subnet_config" {
  type = map
  default = {
    Gateway = {
      name      = "GatewaySubnet"
      cidr_base = "10.0.1.0/24"
    }
    Dmz2 = {
      name      = "Dmz2"
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
      name = "Dev2"
      cidr_base = "10.0.5.0/24"
    }
  }
  description = "Optional Input - Subnet config map for each subnet to be created in either existing or newly created VNET based on. (create_vnet=true/false)"
}
variable "subnets" {
  description = "map structure for the subnets to be created"
}
