#Author: Robert Murphy
#Date: 11/1/22
#Sec 275 assignment 9.1
#purpose: diables accounts over 75 on NAPS domain
#status: works

#I originally used POBox attribute to hold my ages

Get-ADUser -filter "POBox -gt 75" -properties POBox | Disable-ADAccount
