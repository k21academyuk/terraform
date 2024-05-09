# Define an Azure resource group with the specified name and location.
resource "azurerm_resource_group" "default" {
  name     = "azure-rg"
  location = "West US 2"
  
  # Set tags for the resource group to categorize it under a specific environment.
  tags = {
    environment = "Demo"
  }
}

# Define an Azure Kubernetes Service (AKS) cluster within the previously defined resource group.
resource "azurerm_kubernetes_cluster" "default" {
  name                = "azure-aks"
  location            = azurerm_resource_group.default.location  # Use the location of the resource group
  resource_group_name = azurerm_resource_group.default.name      # Use the name of the resource group
  dns_prefix          = "azure-k8s"                              # DNS prefix for the AKS cluster
  
  # Configure the default node pool for the AKS cluster.
  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }
  
  # Configure service principal for managing the AKS cluster.
  service_principal {
    client_id     = var.appId       # Assign the client ID for authentication
    client_secret = var.password     # Assign the client secret for authentication
  }
  
  # Enable role-based access control (RBAC) for the AKS cluster.
  role_based_access_control {
    enabled = true
  }
  
  # Set tags for the AKS cluster to categorize it under a specific environment.
  tags = {
    environment = "Demo"
  }
}
