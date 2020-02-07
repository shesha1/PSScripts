    $tmplt = 'Data Source=hackaata.database.windows.net;initial catalog=HackAata;User ID=serviceaccount;password=Sonata@09876'
    $connStr = $tmplt -f 'serviceaccount', 'Sonata@09876', 'HackAata', 'hackaata.database.windows.net\HackAata'
    $conn = [System.Data.SQLClient.SQLConnection]::new($tmplt)
    $conn.Open()
    $command = 'Select * from hackaatatable'
    $sql = $conn.CreateCommand()
    $sql.CommandText = $command
    $adapter = New-Object System.Data.SqlClient.SqlDataAdapter ($command, $conn)
    $table = New-Object System.Data.DataTable
    $adapter.Fill($table) | out-null
    $comparray = @($table | select -ExpandProperty Customername)
    Write-Output $comparray