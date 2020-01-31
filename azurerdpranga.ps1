Login-AzureRmAccount


#Shashi Subscription
#Select-AzureRmSubscription -Subscription '90b8721c-c1b3-4374-a3f9-620c1e1a8a21' -Tenant '7571a489-bd29-4f38-b9a6-7c880f8cddf0'


#Ranganath Subscription
Select-AzureRmSubscription -subscription '5844af06-1ab5-48e6-8836-9f84255a4eeb' -Tenant '7571a489-bd29-4f38-b9a6-7c880f8cddf0'
$rgname = 'SHESHA-MIM'

#Shesha subscription
Select-AzureRmSubscription -subscription '230740bc-5f3a-48bd-90b5-790efbb514bf' -Tenant '7571a489-bd29-4f38-b9a6-7c880f8cddf0'
$rgname = 'RG-Shesha'



$vms = Get-AzureRmVM -ResourceGroupName $rgname
$vmarray = $null
foreach($avm in $vms){
$vmname = $avm.Name

$vmstate = Get-AzureRmVM -ResourceGroupName $rgname -Name $vmname -Status
$onoroff = $vmstate.Statuses[1].Code


if($onoroff -eq 'PowerState/running')
{


[array]$vmarray += $vmname
}

}

if ($rgname -eq 'RG-Shesha')
    {
remove-item -path C:\users\shesha\desktop\vms\shesha\* -Force -Recurse

foreach ($vm in $vmarray) {

$file = "C:\Users\Shesha\Desktop\vms\shesha\$vm.rdp"
Get-AzureRmRemoteDesktopFile -ResourceGroupName $rgname -Name $vm -LocalPath $file
Start-Sleep 2

}

}


if ($rgname -eq 'SHESHA-MIM')
    {
remove-item -path C:\users\shesha\desktop\vms\Ranga\* -Force -Recurse

foreach ($vm in $vmarray) {

$file = "C:\Users\Shesha\Desktop\vms\Ranga\$vm.rdp"
Get-AzureRmRemoteDesktopFile -ResourceGroupName $rgname -Name $vm -LocalPath $file
Start-Sleep 2

}

}
