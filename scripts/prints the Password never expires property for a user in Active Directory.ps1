# ChatGPT
# a PowerShell script that prints if the "Password never expires" property for a user in Active Directory

# Set the user's samAccountName
$userName = "johndoe"

# Get the user object from Active Directory
$user = Get-ADUser -Identity $userName -Properties "PasswordNeverExpires"

# Check if the "Password never expires" option is enabled or disabled
if ($user.PasswordNeverExpires) {
    Write-Host "The 'Password never expires' option is enabled for user $userName."
} else {
    Write-Host "The 'Password never expires' option is disabled for user $userName."
}
