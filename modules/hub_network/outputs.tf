output "hubrgname" {
  value       = azurerm_resource_group.hubvnetrg.name
  description = ""
}

output "vnet_id" {
  description = "The id of the virtual network."
  value       = "${azurerm_virtual_network.hubvnet.id}"
}
/*
output "vnet_subnets" {
  description = "The ids of subnets inside the virtual network."
  value       = "${azurerm_subnet.hubsubnets.*.id}"
  depends_on = [
    azurerm_subnet.hubsubnets
  ]
}
*/


#output "gatewaysubnetid" {
#value = azurerm_subnet.gatewaysubnet.id
#}