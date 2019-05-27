#Requires -module ComputerManagementDsc

Install-Module ComputerManagementDsc -Force
Import-Module ComputerManagementDsc -Force    
#

Configuration TimeZone_SetTimeZone_Config
{
Param(
[Parameter(Mandatory=$true)] 
	    [String[]]$computer
)


    Import-DSCResource -ModuleName ComputerManagementDsc

    Node $computer
    {
        TimeZone TimeZoneExample
        {
            IsSingleInstance = 'Yes'
            TimeZone         = 'AUS Eastern Standard Time'
        }
    }
}

#CREATE 

#CREATE CONFIG FILES FOR COMPUTERS
TimeZone_SetTimeZone_Config -computer <#PCNAME OR get-Content C:\pclist.xt)#> -OutputPath C:\temp\DSC 


#DEPLOY

# RUN THIS COMMAND
Start-DscConfiguration -Wait -Verbose -Path C:\temp\DSC

