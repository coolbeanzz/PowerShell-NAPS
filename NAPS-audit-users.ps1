#Author: Robert Murphy
#Date: 11/6/22
#Sec 275 assignment 10.2
#purpose: script makes menu to find disabled users, anyone under 18, and anyone who has not changed their password.

#POBox attribute holds the user's age!!!!!
$yorn = "y"
while ($yorn -eq "y")
{
    $ToDo = Read-host -Prompt "To list disabled users type 1. `nTo find users under 18 type 2. `nTo find users with default passwords type 3.`n"   
    if ($ToDo -eq 1)
    {
        Get-ADUser -filter "(Enabled -eq '$false')" | Format-Table Name,DistinguishedName,Enabled | Out-File -FilePath C:\Disabled_users.txt
        Write-Host "Complete. File is C:\Disabled_users.txt"   
    }
    elseif($ToDo -eq 2)
    {
        Get-ADUser -filter "(POBox -gt '0') -and (POBox -lt '18')" -Properties POBox | format-table Name,POBox,DistinguishedName,Enabled | Out-File -FilePath C:\User_Under_18.txt
        Write-Host "Complete. File is C:\Users_Under_18.txt"
    }  
    elseif($ToDo -eq 3)
    {
        Get-ADUser -Filter "LogonCount -eq '0'" -properties LogonCount | format-table Name,DistinguishedName,LogonCount,Enabled | Out-File -Filepath C:\Users_with_Default_Passwords.txt 
        Write-Host "Complete. File is C:\Users_with_Default_Passwords.txt"
    }
    $yorn = Read-Host -Prompt 'Search again? (y or n)'
}