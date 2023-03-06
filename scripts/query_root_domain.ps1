#ChatGPT


# Get the current computer's domain name
$domainName = $env:USERDNSDOMAIN

# Print current computer's domain name
Write-Host "Current computer's domain name: $domainName"

# Connect to the Active Directory domain
Import-Module ActiveDirectory
$domain = Get-ADDomain $domainName

# Print Active Directory domain name
Write-Host "Active Directory domain: $($domain.Name)"

# Define search base (root of the domain)
$searchBase = $domain.DistinguishedName

# Print search base
Write-Host "Search base: $searchBase"

# Define filter to retrieve all computer objects
$filter = "(objectClass=computer)"
Write-Host "filter: $filter"

# Retrieve a list of all computer objects in the domain
#$computers = Get-ADObject -Filter $filter -SearchBase $searchBase -Properties operatingsystem

