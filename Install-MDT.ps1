function Install-MDT{
    <#
    .SYNOPSIS
    Short description
    
    .DESCRIPTION
    Long description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>

    param (
        [string]$MdtMsiPath,
        [string]$DownloadFolder = "C:\temp",
        [string]$InstallationFolder = "C:\temp"
    )

    $MSIArgumentsMdt = @(
    "/i"
    ('"{0}"' -f $MdtMsiPath)
    "/qn"
    "/norestart"
    "/L*v"
    $logFile

)
    #Install ADK

    Invoke-WebRequest -Uri https://go.microsoft.com/fwlink/p/?linkid=859206 -OutFile $DownloadFolder\adksetup.exe
    Start-Process 

    Start-Process msiexec.exe -Wait -ArgumentList $MSIArgumentsMdt
    
}