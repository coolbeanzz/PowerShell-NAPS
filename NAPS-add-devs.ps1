#Author: Robert Murphy
#Date: 11/1/22
#Assignment: 9.2
#Purpose: add one user to a new OU that will access NAPS webserver

New-ADOrganizationalUnit -Name "Dev" -Path "DC=notapornsite,DC=com"

$Attributes = @{
        Enabled = $true
        ChangePasswordAtLogon = $true
        Path = "OU=Dev,DC=notapornsite,DC=com"
        Name = "John Dev"
        UserPrincipalName = "John.Dev@notapornsite.com"
        SamAccountName = "John.Dev"
        Company = "NotAPornSite"
        AccountPassword = "ChangeMe10!!" | ConvertTo-SecureString -AsPlainText -Force
}
New-ADUser @Attributes