#Author: Robert Murphy
#Date: 11/3/22
#Sec 275 assignment 9.3
#purpose: audit dc system for users in each OU

$yorn = "y"
while ($yorn -eq "y")
{
    Get-ADOrganizationalUnit -filter * | format-table Name
    $OU = Read-Host -Prompt 'Enter the OU to see all of the users in it'
    if ($OU) {
        $file = Read-Host -Prompt 'Do you want to output to console (1) or a txt file (2)?'
        if ($file -eq 2){
            $pathh = Read-Host -Prompt 'Please specify file name with file extension (ex. job.txt)'
            Get-ADUser -Filter * -SearchBase "OU=$OU,DC=notapornsite,DC=com" -properties Name,PrimaryGroup,Enabled | format-table Name,PrimaryGroup,Enabled | Out-File -Filepath C:\$pathh
        }   
        else {
            Get-ADUser -Filter * -SearchBase "OU=$OU,DC=notapornsite,DC=com" -properties Name,PrimaryGroup,Enabled | format-table Name,PrimaryGroup,Enabled
        }
    }
    $yorn = Read-Host -Prompt 'Search again? (y) or (n)'
}