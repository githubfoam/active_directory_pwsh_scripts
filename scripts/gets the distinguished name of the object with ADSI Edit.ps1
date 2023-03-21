#ChatGPT
#gets the distinguished name of the object with ADSI Edit

# Import the ADSI module
Import-Module ActiveDirectory

# Define the name of the object you want to retrieve the DN for
$ObjectName = "JohnDoe"

# Define the domain context
$Domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
$DomainContext = New-Object System.DirectoryServices.DirectoryEntry("LDAP://" + $Domain.Name)

# Use ADSI Edit to retrieve the object
$Object = [ADSI]"LDAP://$($DomainContext.distinguishedName)"
$ObjectSearcher = New-Object System.DirectoryServices.DirectorySearcher($Object)

# Set the search filter to retrieve the object by its name
$ObjectSearcher.Filter = "(&(objectClass=user)(objectCategory=person)(sAMAccountName=$ObjectName))"

# Retrieve the DN of the object
$SearchResult = $ObjectSearcher.FindOne()
$ObjectDN = $SearchResult.Properties["distinguishedName"]

# Display the DN of the object
Write-Output "The distinguished name of $ObjectName is $ObjectDN"
