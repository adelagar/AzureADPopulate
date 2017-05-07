# AzureADPopulate
Populate users in Azure Active Directory in bulk.

Intended purpose of this script is to be executed in a lab scenario for demonstration/test purposes or to create a batch of users in Azure Active Directory.

Script must be run under administrative credentials that have been granted the proper rights in an Azure Active Directory tenant.

The operator of the script will require the installation Microsoft Azure Active Directory Module for Windows PowerShell Version 1.1.166.0
This is a release of the Azure Active Directory PowerShell V1 (MSOL) for general availability.

More information can be found about the Azure Active Directory PowerShell module from here: https://docs.microsoft.com/en-us/powershell/azure/install-adv2?view=azureadps-2.0 

Once the binary has been installed, administrative system rebooted, and the PowerShell module imported please update the csv file with the accounts you wish to provision in bulk.

Run the PowerShell AzureADPopulate.ps1 script and it will begin to create users in Azure Active Directory. Please note the passwords are created in Azure Active Directory to avoid storing them on a clear text file. The script can be modified to update that field if desired.

Please note the recommended business practice to onboard and populate users in Azure Active Directory in production is to use the Microsoft Azure Active Directory Connect tool which can be found here: https://www.microsoft.com/en-us/download/details.aspx?id=47594
