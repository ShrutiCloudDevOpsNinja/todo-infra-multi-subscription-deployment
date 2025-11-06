terraform {
  backend "azurerm" {
    access_key           = "03iGc5tUQo8Lxq+CgQaneA5GSokG6D6vAINOcCj+AqTMvbtHTk/OUlEEJfvXrmcixgSzNjmASZxA+AStrfmqWw=="
    storage_account_name = "devtodo"                                 # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "todo-dev-cont"                                  # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"                   # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
