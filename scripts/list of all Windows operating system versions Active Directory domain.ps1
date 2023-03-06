#ChatGPT
#Generate a PowerShell script that retrieves a list of all Windows operating system versions for 
#computer objects in an Active Directory domain

# Get the domain name from the current computer
$domain = Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty Domain

# Construct the search base for the computers
$searchBase = "DC=$($domain.Replace('.',',DC='))"

# Filter for computer objects and retrieve the operating system property
$filter = "objectClass -eq 'computer'"
$computers = Get-ADObject -Filter $filter -SearchBase $searchBase -Properties operatingsystem

# Create an array to store the operating systems
$operatingSystems = @()

# Iterate through each computer and extract the operating system information
foreach ($computer in $computers) {
    $operatingSystems += $computer.operatingsystem
    "Computer Name: $($computer.Name) Operating System: $($computer.operatingsystem)"
}

# Count the number of occurrences of each operating system and sort the results in ascending order
$sortedCounts = $operatingSystems | Group-Object | Sort-Object Count

# Format the results as a string
$output = "Total number of Windows operating systems in ascending order:`n"
foreach ($count in $sortedCounts) {
    $output += "$($count.Count) $($count.Name)`n"
}

# Write the output to the file
$output | Out-File -FilePath "$PSScriptRoot\total_usage_windows_versions_all_computers.txt"
