
    $managedstoragedetails = "C:\Users\M1048404\Documents\" + "ARM-" + "ManagedstorageDetails-v4-" + (get-date -Format dd-MM-yyyy-hh-mm) + ".csv"
    $subscriptions = Get-AzSubscription
        foreach($subscription in $subscriptions)
            {
            Select-AzSubscription -Subscription $subscription
            $subname = $subscription.name
            $subid = $subscription.id
            $manageddisks = Get-AzDisk
            foreach ($manageddisk in $manageddisks)
                {
                $ownerid = $manageddisk.ownerId
                if($manageddisk.ManagedBy -eq $null)
                    {
                    $managedDisk.Id
                   
                    $managedDisk | Select-Object @{Name = "Subscription Name";Expression={$subname}},`
                                                 @{Name = "Subscription ID";Expression={$subid}},`
                                                 @{Name = "Storage Account Resource Group Name";Expression={$manageddisk.ResourceGroupNAme}},`
                                                 @{Name = "Storage Account Name";Expression={$manageddisk.Name}},`
                                                 @{Name = "Storage Replication Type";Expression={$manageddisk.AccountType}},`
                                                 @{Name = "Storage Account Location";Expression={$manageddisk.Location}},`
                                                 @{Name = "Disk Size";Expression={$manageddisk.DiskSizeGB}},`
                                                 @{Name = "Disk State";Expression={$manageddisk.DiskState}},`
                                                 @{Name = "Storage Account ID";Expression={$manageddisk.Id}} | Export-Csv -Path $managedstoragedetails -Delimiter "," -NoTypeInformation -Append
                    }
                                                 }
                    }

