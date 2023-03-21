#ChatGPT
#Generate a powershell script that prints an user account's expiration date in active directory.

# Replace "username" with the actual username of the account you want to check
$username = "username"

# Retrieve the user account object from AD
$user = Get-ADUser -Identity $username -Properties AccountExpirationDate

# Check if the account has an expiration date set
if ($user.AccountExpirationDate) {
    Write-Host "$username's account will expire on $($user.AccountExpirationDate)"
} else {
    Write-Host "$username's account does not have an expiration date set"
}
