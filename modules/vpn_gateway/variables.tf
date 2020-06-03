variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "myapp-rg"
}

variable "vpnpipname" {
  description = "The public IP for the VPN gateway"
  default     = ""
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
}

variable "vpngwname" {
  description = "The name of the VPN gateway"
}

variable "gatewaysubnetid" {
  description = "the gateway subnet id"
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map

  default = {
    tag1 = "hello"
    tag2 = "there!"
  }
}

variable "vpngwsku" {
  description = "the sku type of the VPN gateway"
  default = "Basic"
}
