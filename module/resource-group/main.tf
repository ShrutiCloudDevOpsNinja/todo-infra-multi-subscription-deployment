resource "azurerm_resource_group" "child-module-rg" {
for_each = var.child-rg-mv
name = each.value.name
location = each.value.location
}

