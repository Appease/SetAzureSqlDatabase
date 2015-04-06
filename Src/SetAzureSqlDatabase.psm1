# halt immediately on any errors which occur in this module
$ErrorActionPreference = 'Stop'
Import-Module 'C:\Program Files (x86)\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure' -Force -RequiredVersion '0.8.8'

function Invoke(

    [string]
    [ValidateNotNullOrEmpty()]
    [Parameter(
        Mandatory=$true,
        ValueFromPipelineByPropertyName=$true)]
    $Name,

    [string]
    [ValidateNotNullOrEmpty()]
    [Parameter(
        Mandatory=$true,
        ValueFromPipelineByPropertyName=$true)]
    $ServerName,

    [string]
    [ValidateNotNullOrEmpty()]
    [Parameter(
        ValueFromPipelineByPropertyName=$true)]
    $Edition,

    [int]
    [ValidateNotNullOrEmpty()]
    [Parameter(
        ValueFromPipelineByPropertyName=$true)]
    $MaxSizeGB
){
    # build up parameters
    $Parameters = @{
        DatabaseName = $Name;
        ServerName = $ServerName
    }
    if($Edition){
        $Parameters.Edition = $Edition
    }
    if($MaxSizeGB){
        $Parameters.MaxSizeGB = $MaxSizeGB
    }


    If(!(Azure\Get-AzureSqlDatabase -ServerName $ServerName | ?{$_.Name -eq $Name})){
        Azure\New-AzureSqlDatabase @Parameters
    }
    Else{
        Azure\Set-AzureSqlDatabase @Parameters
    }
}

Export-ModuleMember -Function Invoke
