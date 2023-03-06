#ChatGPT

# Replace "USERNAME" with the username of the user you want to check
$Username = "USERNAME"

# Connect to Active Directory
Import-Module ActiveDirectory

# Get the user's AD account
$User = Get-ADUser $Username -Properties PasswordExpired

# Check if the user's password is expired
if ($User.PasswordExpired) {
    Write-Host "The password for user $Username has expired."
}
else {
    Write-Host "The password for user $Username is not expired."
}
