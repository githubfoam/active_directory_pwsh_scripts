#ChatGPT
# Replace "USERNAME" with the username of the user you want to check

$Username = "USERNAME"

# Connect to Active Directory
Import-Module ActiveDirectory

# Get the user's AD account
#$User = Get-ADUser $Username -Properties PasswordExpired
$User = Get-ADUser $Username -Properties PasswordExpired, PasswordLastSet


# Check if the user's password is expired

if ($User.PasswordExpired) {
    $ExpirationDate = $User.PasswordLastSet.AddDays($User.PasswordNeverExpires ? 0 : (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge.TotalDays)
    Write-Host "The password for user $Username has expired. It expired on $($ExpirationDate.ToShortDateString())."
}
else {
    Write-Host "The password for user $Username is not expired."
}