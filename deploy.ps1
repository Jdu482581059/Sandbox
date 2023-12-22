# Variables
$subscriptionId = "01312e25-c8f2-49dc-a847-e994d5d4729b"
$resourceProvidersToRegister = @("Microsoft.Network", "Microsoft.App") # Add your resource providers here

# Set the subscription context
Set-AzContext -Subscription $subscriptionId

# Get currently registered resource providers
$registeredProviders = Get-AzResourceProvider -ListAvailable | Select-Object ProviderNamespace

# Iterate through the resource providers to register
foreach ($provider in $resourceProvidersToRegister) {
    if ($registeredProviders -notcontains $provider) {
        # Register the resource provider
        Register-AzResourceProvider -ProviderNamespace $provider
        Write-Output "Registered resource provider: $provider"
    } else {
        Write-Output "Resource provider $provider is already registered."
    }
}
