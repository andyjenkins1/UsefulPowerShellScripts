### Quick Script to display all the Compute Sizes available in a given location.
### If using Azure xCLI you can use azure vm sizes --location "North Europe"


$resources = Get-AzureRmResourceProvider -ProviderNamespace Microsoft.Compute
$resources.ResourceTypes.Where{($_.ResourceTypeName -eq 'virtualMachines')}.Locations
Get-AzureRmVmSize -Location "West Europe" | Sort-Object Name | ft Name, NumberOfCores, MemoryInMB, MaxDataDiskCount -AutoSize