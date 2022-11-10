#Author: Robert Murphy
#Date: 11/1/22
#Sec 275 assignment 9.0
#purpose: put ages into POBox attribute fields
#status: Works!!!!!!

#import csv file
$UserList = Import-Csv -Path C:\Users\Administrator\Desktop\m9\9.1ages.csv 

#creates the age for each user in list
foreach($User in $UserList){
Get-ADUser -Filter "SamAccountName -eq '$($User.First).$($User.Last)'" | Set-ADUser -POBox $User.Age
}

 
 
 
