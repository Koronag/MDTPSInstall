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
        [string]$MDTMsiPath = "C:\temp\MicrosoftDeploymentToolkit_x64.msi",
        [string]$ADKSetupFile = "C:\temp\adksetup.exe",
        [string]$InstallationFolder = "C:\temp"
    )

    $ADKDownloadPath = "https://go.microsoft.com/fwlink/p/?linkid=859206"
    $MDTDownloadPath = "https://www.microsoft.com/en-us/download/confirmation.aspx?id=54259"

    $ADKArguments = "'/quiet /features OptionID.DeploymentTools OptionID.WindowsPreinstallationEnvironment OptionID.ImagingAndConfigurationDesigner OptionID.ICDConfigurationDesigner'"
    $MSIArgumentsMdt = @(
    "/i"
    ('"{0}"' -f $MdtMsiPath)
    "/qn"
    "/norestart"
    "/L*v"
    $logFile
)
    #Install ADK
    
    Invoke-WebRequest -Uri $ADKDownloadPath -OutFile $ADKSetupFile
    Write-Progress -Activity "Installing MDT" -PercentComplete (100/10 * 4)
    Start-Process -Wait $ADKSetupFile $ADKArguments

    #Install MDT

    Invoke-WebRequest -Uri $MDTDownloadPath -OutFile $MDTMsiPath
    Write-Progress -Activity "Installing MDT" -PercentComplete (100/10 * 7)
    Start-Process msiexec.exe -Wait -ArgumentList $MSIArgumentsMdt
    
}