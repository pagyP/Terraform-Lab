/*
output "subnets" {
  value = module.hubnetwork.vnet_subnets
}
*/

output "subnets" {
  value = module.hubnetwork.subnet_ids_map
}