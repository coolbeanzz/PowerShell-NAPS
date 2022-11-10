#Author: Robert Murphy
#Date: 10/3/22
#Sec 275 assignment 6.3
#purpose: put a thousand or so users in random OU's in the NAPS domain with proper settings
#status: Works!!!!!!

#import cvs file
$UserList = Import-Csv -Path C:\Users\Administrator\Desktop\NAPS-users.csv

#array of the OU's
$OUs = @("Mgmt", "Acct", "Production", "Sales", "Admin")
#hardcoded company 
$company = "NotAPornSite"

#creates the attributes for each user
foreach($User in $UserList)
{
    $randomOU = Get-Random -InputObject $OUs
    $Attributes = @{
        Enabled = $true
        ChangePasswordAtLogon = $true
        Path = "OU=$randomOU,DC=notapornsite,DC=com"
        Name = "$($User.First) $($User.Last)"
        UserPrincipalName = "$($User.First).$($User.Last)@notapornsite.com"
        SamAccountName = "$($User.First).$($User.Last)"
        Company = $company
        AccountPassword = "ChangeMe10!!" | ConvertTo-SecureString -AsPlainText -Force #(IK not a good sec practice but for testing)
    }
    New-ADUser @Attributes
}