#Author: Robert Murphy
#assignment 6.5 sec audit
#date: 10/13/22
#Purpose: audit the NAPS-DC system for users with default passwords 

# cmdlet Showed all of the porperties a user has that I can filter for
#Get-ADUser -Filter "SamAccountName -eq 'Ana.Lynch'" -Properties * 
 
#specifically finds users with no logons, indicating that they have default passwords
Get-ADUser -Filter "LogonCount -eq '0'" -properties LogonCount | Format-Table Name,LogonCount
  