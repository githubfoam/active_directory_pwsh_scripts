#ChatGPT
#Here's a PowerShell script that subtracts the maximum password age from the password last set date for all users in Active Directory and prints the results

# Connect to Active Directory
Import-Module ActiveDirectory

# Get the domain password policy
$policy = Get-ADDefaultDomainPasswordPolicy

# Get all user accounts in Active Directory
$users = Get-ADUser -Filter * -Properties PasswordLastSet



# Loop through each user account
foreach ($user in $users) {
    # Calculate the password expiration date
    $expiration = $user.PasswordLastSet.AddDays($policy.MaxPasswordAge.TotalDays)

    # Calculate the remaining days until expiration
    $daysLeft = ($expiration - (Get-Date)).Days

    # Print the results
    Write-Host "User: $($user.SamAccountName)"
    Write-Host "Password last set: $($user.PasswordLastSet)"
    Write-Host "Maximum password age: $($policy.MaxPasswordAge.TotalDays) days"
    Write-Host "Password expiration date: $($expiration.ToShortDateString())"
    Write-Host "Days until password expiration: $daysLeft"
    Write-Host ""
}
