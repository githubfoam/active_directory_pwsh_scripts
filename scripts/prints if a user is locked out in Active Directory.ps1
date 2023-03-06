# ChatGPT
# Generata a Powershell script that prints if a user is locked out in Active Directory


# Set the username of the user to check
$username = "Username"

# Get the user object from Active Directory
$user = Get-ADUser -Identity $username -Properties LockedOut

# Check if the user is locked out
if ($user.LockedOut -eq $true) {
    Write-Output "$username is locked out."
} else {
    Write-Output "$username is not locked out."
}
