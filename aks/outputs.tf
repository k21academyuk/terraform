# Output the name of the Azure resource group created earlier.
output "resource_group_name" {
  value = azurerm_resource_group.default.name  # Retrieve the name of the resource group
}

# Output the name of the Azure Kubernetes Service (AKS) cluster created earlier.
output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.default.name  # Retrieve the name of the AKS cluster
}
