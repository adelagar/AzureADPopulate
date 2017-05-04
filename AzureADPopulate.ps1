# The following application is provided as is without any guarantees or warranty. 
# Although the author has attempted to find and correct any bugs in the free software programs, 
# the author is not responsible for any damage or losses of any kind caused by the use or misuse of this script. 
# The author is under no obligation to provide support, service, corrections, or upgrades to for this free script. 
# For more information, please send and email to Anthony de Lagarde delagardecodeplex@hotmail.com. 
# Script written May 1, 2017. 
#
# Intended purpose of this script is to be executed in a lab for demonstration purposes.
# Script must be run under administrative credentials that have been granted the proper rights
# in Azure Active Directory. 
#
# The assumption is the operator has the ability to execute PowerShell scripts that are RemoteSigned. 
#  
# This script will add Active Directory users imported from a CSV file
# created and stored in the C:\CSV folder.
# 
#-------------------------------------------------------------------------------------------

# Importing module for MSOnline
Import-module MSOnline 


# Connect-MsolService 
Connect-MsolService

# Importing CSV file with users 
$users = Import-Csv -Path C:\CSV\staff.csv

# Loop through CSV and update users if the exist in CVS file
foreach ($user in $users) 
{
# Displaying users that are being processed from CSV file
$users | Select-object FirstName, LastName

# Setting a sleep period for five seconds to throttle
start-sleep -Seconds 5

# Fields from CSV file being inserted into Azure Active Directory
$UPN = $user.UPN
$UserFirstname = $user.Firstname
$UserLastname = $user.LastName
$DisplayName = $user.FirstName + " " + $user.LastName
$Title = $user.Title
$Loc = $user.UsageLocation
$Department = $user.Department
$AltEmail = $user.AlternateEmailAddress
$Mobile = $user.MobilePhone
$Altmobile = $user.AuthenticationPhone

# Creating a user based on the values supplied by the CSV
New-MsolUser -UserPrincipalName $UPN -FirstName $UserFirstname -LastName $UserLastname -DisplayName $DisplayName -Title $Title -UsageLocation $Loc  -Department $Department -AlternateEmailAddresses $AltEmail -MobilePhone $Mobile -AlternateMobilePhones $Altmobile  -StrongPasswordRequired $true -ForceChangePassword $true 
}
Write-Host -ForegroundColor Green "Completed please check for results in Azure AD!!"
