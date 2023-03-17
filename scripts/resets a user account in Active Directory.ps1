#ChatGPT
#resets a user account in Active Directory


# Set the parameters for the script
$username = "jdoe"  # Replace with the username of the account you want to reset
$newPassword = "P@ssw0rd!"  # Replace with the new password for the account

# Get the user account from Active Directory
$user = Get-ADUser -Identity $username

# Reset the password for the user account
Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -String $newPassword -AsPlainText -Force)

# Enable the user account if it is currently disabled
if (!$user.Enabled) {
    Enable-ADAccount -Identity $user
}

# Unlock the user account if it is currently locked out
if ($user.LockedOut) {
    Unlock-ADAccount -Identity $user
}

# Set the user account to require a password change at next logon
Set-ADUser -Identity $user -ChangePasswordAtLogon $true

# Output a message indicating that the account has been reset
Write-Output "The account for $($user.Name) has been reset."
