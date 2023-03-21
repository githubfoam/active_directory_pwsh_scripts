#ChatGPT
#Generate a PowerShell script that retrieves and prints the user accounts with expiration dates in Active Directory

# Connect to the Active Directory module
Import-Module ActiveDirectory

# Retrieve all enabled user accounts with an expiration date set
#he error message you are receiving occurs when the variable $null is not defined. 
#This can happen when you are using an older version of PowerShell that does not automatically define the $null variable.
#$users = Get-ADUser -Filter {Enabled -eq $true -and AccountExpirationDate -ne $null} -Properties AccountExpirationDate

# Retrieve all enabled user accounts with an expiration date set
$users = Get-ADUser -Filter {Enabled -eq $true -and AccountExpirationDate -ne $false} -Properties AccountExpirationDate


# Print the user accounts and their expiration dates
foreach ($user in $users) {
    Write-Host "User account $($user.Name) has an expiration date of $($user.AccountExpirationDate)"
}
