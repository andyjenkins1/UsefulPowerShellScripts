### Quick Script for checking the power status of all VM's running within all resource groups
### Need to remove / surpress errors on future release

$RGs = Get-AzureRMResourceGroup
foreach($RG in $RGs)
{
    $VMs = Get-AzureRmVM -ResourceGroupName $RG.ResourceGroupName
    foreach($VM in $VMs)
    {
        $VMDetail = Get-AzureRmVM -ResourceGroupName $RG.ResourceGroupName -Name $VM.Name -Status
        foreach ($VMStatus in $VMDetail.Statuses)
        { 
             if($VMStatus.Code -like "PowerState/*")
            {
                $VMStatusDetail = $VMStatus.DisplayStatus
            }
        }
        write-output $VM.Name $VMStatusDetail
    }
}