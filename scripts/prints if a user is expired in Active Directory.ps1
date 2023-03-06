# ChatGPT
# Generata a Powershell script that prints if a user is expired in Active Directory

# Set the username of the user to check
$username = "Username"

# Get the user object from Active Directory
$user = Get-ADUser -Identity $username -Properties AccountExpirationDate

# Check if the user account has expired
if ($user.AccountExpirationDate -ne $null) {
    if ($user.AccountExpirationDate -lt (Get-Date)) {
        Write-Output "$username's account has expired."
    } else {
        Write-Output "$username's account is not expired."
    }
} else {
    Write-Output "$username's account does not have an expiration date set."
}
