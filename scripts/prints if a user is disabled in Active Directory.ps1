#ChatGPT
#Generata a Powershell script that prints if a user is disabled in Active Directory

# Set the username of the user to check
$username = "Username"

# Get the user object from Active Directory
$user = Get-ADUser -Identity $username

# Check if the user is disabled
if ($user.Enabled -eq $false) {
    Write-Output "$username is disabled."
} else {
    Write-Output "$username is enabled."
}


