# New-ClassDefintion

Takes an instance of an object and creates a PowerShell class definition.

## Supports

- Overriding the class name
- Scaffolds only property names
- Allows the user to exclude properties
- Placeholder for a constructor
- Letting the user specify a constructor
- Letting the user specify a method
- VSCode aware and inserts the new class automatically into the current file
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

    MyServiceController() {
        #ctor
    }

	[System.Boolean]$CanShutdown
 	[System.Boolean]$CanStop
 	[System.ComponentModel.IContainer]$Container
 	[System.ServiceProcess.ServiceController[]]$DependentServices
 	[System.String]$DisplayName
 	[System.String]$MachineName
 	[System.Runtime.InteropServices.SafeHandle]$ServiceHandle
 	[System.String]$ServiceName
 	[System.ServiceProcess.ServiceController[]]$ServicesDependedOn
 	[System.ServiceProcess.ServiceType]$ServiceType
 	[System.ComponentModel.ISite]$Site
 	[System.ServiceProcess.ServiceStartMode]$StartType


    [string] WrittenBy() {
        return "PowerShell Tool Bulider"
    }
}

```


## TODO

- [ ] Implement `IncludeProperty` option