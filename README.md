# New-ClassDefintion

Takes an instance of an object and creates a PowerShell class definition.

## Supports

- Overriding the class name
- Scaffolds only property names
- Allows the user to exclude properties
- Placeholder for a constructor
- Letting the user specify a constructor
- Letting the user specify a method
- VSCode aware and inserts the new class automatically into a new file
- Is cross-platform


```powershell
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
```

Creates

```powershell

class MyServiceController {
    
	[System.String]$BinaryPathName
 	[System.Boolean]$CanShutdown
 	[System.Boolean]$CanStop
 	[System.ComponentModel.IContainer]$Container
 	[System.Boolean]$DelayedAutoStart
 	[System.ServiceProcess.ServiceController[]]$DependentServices
 	[System.String]$Description
 	[System.String]$DisplayName
 	[System.String]$MachineName
 	[System.Runtime.InteropServices.SafeHandle]$ServiceHandle
 	[System.String]$ServiceName
 	[System.ServiceProcess.ServiceController[]]$ServicesDependedOn
 	[System.ServiceProcess.ServiceType]$ServiceType
 	[System.ComponentModel.ISite]$Site
 	[System.ServiceProcess.ServiceStartMode]$StartType
 	[Microsoft.PowerShell.Commands.ServiceStartupType]$StartupType
 	[System.String]$UserName


    MyServiceController() {
        #ctor
    }

    [string] WrittenBy() {
        return "PowerShell Tool Builder"
    }
}

```


## TODO

- [ ] Implement `IncludeProperty` option