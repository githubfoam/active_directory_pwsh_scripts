# ChatGPT
# Generata a Powershell script that prints user's last successfull login in Active Directory.

# Set the username of the user to check
$username = "USERNAME"

# Get the user object from Active Directory
$user = Get-ADUser -Identity $username -Properties LastLogonTimestamp

# Check if the LastLogonTimestamp property is null
if ($user.LastLogonTimestamp -eq $null) {
    Write-Output "No successful logins found for $username."
} else {
    # Convert the LastLogonTimestamp to a readable date format
    $lastLogin = [DateTime]::FromFileTime($user.LastLogonTimestamp)

    # Print the last successful login for the user
    Write-Output "$username's last successful login was on $lastLogin."
}





