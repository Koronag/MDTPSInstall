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
        [string]$MdtMsiPath
    )

    $MSIArguments = @(
    "/i"
    ('"{0}"' -f $MdtMsiPath)
    "/qn"
    "/norestart"
    "/L*v"
    $logFile
)

    Start-Process msiexec.exe -Wait -ArgumentList $MSIArgument
    
}