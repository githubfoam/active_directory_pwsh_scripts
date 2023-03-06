# ChatGPT
# Generate a PowerShell script that retrieves a list of all Windows operating system versions for 
# computer objects in an Active Directory domain
# writes output into a file

# retrieves the domain of the current computer using the Get-WmiObject cmdlet and stores it in the $domain variable.
$domain = Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty Domain

# constructs a search base using the domain name and the DC= format required by the Get-ADObject cmdlet.
$searchBase = "DC=$($domain.Replace('.',',DC='))"

# retrieves the computer accounts using the Get-ADObject cmdlet with the operatingsystem property included in the output
$filter = "objectClass -eq 'computer'"
$computers = Get-ADObject -Filter $filter -SearchBase $searchBase -Properties operatingsystem

# loops through each computer account and extracts the operating system information.
$output = foreach ($computer in $computers) {
    "Computer Name: $($computer.Name) Operating System: $($computer.operatingsystem)"
}

# Save the output to a file
$output | Out-File -FilePath "$PSScriptRoot\windows_versions_all_computers.txt"