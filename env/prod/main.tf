module "rg-mb" {
  source = "../../module/resource-group"
  child-rg-mv = var.rgs-pm
  }
 
 module "stg-mb" {
  depends_on = [ module.rg-mb ]
   source = "../../module/storage-account"
  child-stg-v = var.stg-pm
 }

module "vnet-mb" {
  depends_on = [ module.rg-mb ]
  source = "../../module/virtual-network"
  child-vnet-v = var.vnet-pm

}

module "subnet-pm" {
  depends_on = [ module.vnet-mb ]
  source = "../../module/subnet"
  subnets = var.subnet-pv
  
}




module "vm-pm" {
  depends_on = [ module.subnet-pm ]
  source = "../../module/virtaul-machine"
  child-vm-v = var.vm-pv

}



  