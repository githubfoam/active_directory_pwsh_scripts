#ChatGPT
#reads a text file containing user account names and their corresponding expiration dates, and sets the expiration date for each user account in Active Directory:

# Connect to the Active Directory module
Import-Module ActiveDirectory


#ChatGPT
#Fix this code by adding functionality to checks whether the file exists:$file = "C:\tmp\users_expires.txt"
# Set the path to the text file containing user account names and expiration dates
$file = "C:\temp\users_expires.txt"

#ChatGPT
#Fix "Get-Content : Cannot find path" in this statement :Get-Content : Cannot find path 'C:\tmp\users_expires.txt' because it does not exist.
# windows key + R type "notepad C:\tmp\users_expires.txt" to verify 
# Check if the file exists
if (Test-Path $file) {
    # Read the contents of the text file and process each line
    Get-Content $file | ForEach-Object {
        # Split the line into the user account name and expiration date
        $user, $expire = $line.Split(" ")
        Write-Host "User account $user in the file $file"
        Write-Host "Expiration Date $expire in the file $file"

        # Convert the expiration date string to a DateTime object
        $expireDate = [DateTime]::ParseExact($expire, 'MM/dd/yyyy', $null)

        #ChatGPT
        #Fix this code by adding functionality to checks whether the user account exists before setting the account expiration date:Set-ADUser $user -AccountExpirationDate $expireDate
        # Set the expiration date for the user account in Active Directory
        #Set-ADUser $user -AccountExpirationDate $expireDate

        # Check if user account exists
        if (Get-ADUser -Filter {SamAccountName -eq $user}) {
            Write-Host "User account $user exists."
            # Set the account expiration date
            Set-ADUser $user -AccountExpirationDate $expireDate
            Write-Host "Account expiration date $expire set for $user"
        } else {
            Write-Host "User account $user does not exist."
        }


        # Print a message to confirm that the expiration date was set
        #Write-Host "Expiration date set for user account ${user}: $expireDate"
    }
} else {
    Write-Error "File not found at path $file"
}