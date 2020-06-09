vpngwsku = "vpngw1"


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
