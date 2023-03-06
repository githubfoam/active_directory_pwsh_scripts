# ChatGPT
# a PowerShell script that disables  the "Password never expires" property for a user in Active Directory

# user logon name
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

# Disable the "Password never expires" option
Set-ADUser -Identity $userName -PasswordNeverExpires $false

# Confirm that the change was successful
$user = Get-ADUser -Identity $userName -Properties "PasswordNeverExpires"
if (!$user.PasswordNeverExpires) {
    Write-Host "The 'Password never expires' option has been disabled for user $userName."
} else {
    Write-Host "There was an error disabling the 'Password never expires' option for user $userName."
}
