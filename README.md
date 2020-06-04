# Terraform-Lab
Modularised code used mostly for lab deployments but also for customers
  I use this to a) learn/improve TF b) to deploy to my lab env c) spin up new labs quickly d) as a base for customer deployments
  
  At the moment this deploys a hub vnet and a vnet gateway
  Note I've used for_each in the hub vnet module for the subnet iteration - by the looks of it this means that I can't use variables from the
  root directory (tfvars for example) in the hub vnet module as I can't see a way to pass the variable down to the module when using
  for_each.  Adding and removing subnets would need to be managed via the variables.tf or tfvars file in the module directory
