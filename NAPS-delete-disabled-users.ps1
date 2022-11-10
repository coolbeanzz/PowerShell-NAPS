#Author: Robert Murphy
#Date: 11/2/22
#Sec 275 assignment 9.4
#purpose: finds all disabled accounts and gives option to delete them.

Write-Host "These accounts are disabled."
Get-ADUser -filter "(Enabled -eq '$false') -and (POBox -gt '75')" | format-table Name, DistinguishedName
$delete = Read-host -Prompt 'Do you want to delete all of these disabled users? (y or n)'
if ($delete -eq 'y') {
    Get-ADUser -filter "(Enabled -eq '$false') -and (POBox -gt '75')" | Remove-ADUser
    Write-Host "disabled users deleted"
}
else {
    Write-host "No users deleted"
}