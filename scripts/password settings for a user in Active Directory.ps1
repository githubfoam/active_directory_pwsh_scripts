#ChatGPT

# Replace "USERNAME" with the username of the user you want to check
$Username = "USERNAME"

# Connect to Active Directory
Import-Module ActiveDirectory

# Get the user's AD account
$User = Get-ADUser $Username -Properties PasswordLastSet

# Get the domain password policy
$DomainPolicy = Get-ADDefaultDomainPasswordPolicy

# Calculate the expiration date
$MaxPasswordAge = $DomainPolicy.MaxPasswordAge
$PasswordLastSet = $User.PasswordLastSet
$ExpirationDate = $PasswordLastSet + $MaxPasswordAge
$DaysUntilExpiration = ($ExpirationDate - (Get-Date)).Days

# Print the results
Write-Host "User: $Username"
Write-Host "Password Last Set: $($PasswordLastSet.ToShortDateString())"
Write-Host "Maximum Password Age: $($MaxPasswordAge.TotalDays) days"
Write-Host "Expiration Date: $($ExpirationDate.ToShortDateString())"
Write-Host "Days Until Expiration: $DaysUntilExpiration days"
