# ChatGPT
# a PowerShell script that enables the "Password never expires" property for a user in Active Directory


# Set the user's samAccountName
$userName = "johndoe"


# Get the user object from Active Directory
$user = Get-ADUser -Identity $userName

# Check if the "Password never expires" option is enabled or disabled
if ($user.PasswordNeverExpires) {
    Write-Host "The 'Password never expires' option is enabled for user $userName."
} else {
    Write-Host "The 'Password never expires' option is disabled for user $userName."
}

# Enable the "Password never expires" option
Set-ADUser -Identity $userName -PasswordNeverExpires $true

# Confirm that the change was successful
$user = Get-ADUser -Identity $userName -Properties "PasswordNeverExpires"
if ($user.PasswordNeverExpires) {
    Write-Host "The 'Password never expires' option has been enabled for user $userName."
} else {
    Write-Host "There was an error enabling the 'Password never expires' option for user $userName."
}
