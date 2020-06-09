/*
output "subnets" {
  value = module.hubnetwork.vnet_subnets
}
*/

output "hub_subnets" {
  value = module.hubnetwork.subnet_ids_map
}