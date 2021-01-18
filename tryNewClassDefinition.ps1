$UserMethod = @"
    [string] WrittenBy() {
        return "PowerShell Tool Builder"
    }
"@

$params = @{
    InputObject     = (Get-Service)[0]
    UserMethod      = $UserMethod
    ExcludeProperty = 'CanPauseAndContinue','Status'
}

.\New-ClassDefinition.ps1  @params