terraform {
  backend "azurerm" {
    access_key           = "KyZfhDVlbETYorG/kmtwhAgHkErpusX+NfD1F27or08HYXB/Huzd0+5e/PECyr/vI11vtlEiVNm4+AStUjjxXA==" 
    storage_account_name = "azurepipeline123"                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "azure"                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
