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

        [string]$InstallationFolder = "C:\windows\temp"
    )
    $MDTMsiPath = "$InstallationFolder\MicrosoftDeploymentToolkit_x64.msi"
    $ADKSetupFile = "$InstallationFolder\adksetup.exe"

    $ADKDownloadPath = "https://go.microsoft.com/fwlink/p/?linkid=859206"
    $MDTDownloadPath = "https://download.microsoft.com/download/3/3/9/339BE62D-B4B8-4956-B58D-73C4685FC492/MicrosoftDeploymentToolkit_x64.msi"
    $LogFile = '{0}-{1}.log' -f $MDTMsiPath,$DataStamp

    $ADKArguments = '/quiet /features OptionID.DeploymentTools OptionID.WindowsPreinstallationEnvironment OptionID.ImagingAndConfigurationDesigner OptionID.ICDConfigurationDesigner'
    $MSIArgumentsMdt = @(
    "/i"
    ('"{0}"' -f $MDTMSIPath)
    "/qn"
    "/norestart"
    "/L*v"
    $logFile
    )

    #Install ADK
    
    Invoke-WebRequest -Uri $ADKDownloadPath -OutFile $ADKSetupFile
    Write-Progress -Activity "Installing ADK" -PercentComplete (100/10 * 4)
    Start-Process -Wait $ADKSetupFile $ADKArguments

    #Install MDT

    Invoke-WebRequest -Uri $MDTDownloadPath -OutFile $MDTMsiPath
    Write-Progress -Activity "Installing MDT" -PercentComplete (100/10 * 7)
    Start-Process msiexec.exe -Wait -ArgumentList $MSIArgumentsMdt
    
}