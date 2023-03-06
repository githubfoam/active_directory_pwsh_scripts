#ChatGPT
#Generate a PowerShell script that retrieves a list of all Windows operating system versions for 
#computer objects in an Active Directory domain
# For each operating system found, the script updates a hash table called $osCount to count the number of times each operating system appears.

#retrieves the domain of the current computer using the Get-WmiObject cmdlet and stores it in the $domain variable.
$domain = Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty Domain

#constructs a search base using the domain name and the DC= format required by the Get-ADObject cmdlet.
$searchBase = "DC=$($domain.Replace('.',',DC='))"

#retrieves the computer accounts using the Get-ADObject cmdlet with the operatingsystem property included in the output
$filter = "objectClass -eq 'computer'"
$computers = Get-ADObject -Filter $filter -SearchBase $searchBase -Properties operatingsystem


# Create a hash table to count the number of times each operating system appears
$osCount = @{}

$output = foreach ($computer in $computers) {
    $os = $computer.operatingsystem
    if ($osCount.ContainsKey($os)) {
        $osCount[$os]++
    } else {
        $osCount[$os] = 1
    }
    "Computer Name: $($computer.Name) Operating System: $os"
}

$output | Out-File -FilePath "C:\tmp\windows_versions_all_computers_total.txt"

# Print the total number of operating systems used by computer accounts in descending order
Write-Host "Total number of operating systems used by computer accounts in descending order:"
$output_total = $osCount.GetEnumerator() | Sort-Object -Property Value -Descending | ForEach-Object {
    Write-Host "$($_.Name) : $($_.Value)"
}

# Save the output to a file
Write-Host "PSScriptRoot: $PSScriptRootn"
#$output_total | Out-File -FilePath "$PSScriptRoot\windows_versions_all_computers_statistics.txt"
$output_total | Out-File -FilePath "C:\tmp\windows_versions_all_computers_statistics.txt"

