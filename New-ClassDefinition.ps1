# https://ironscripter.us/a-powershell-conversion-challenge/

<#
    .Description

    .Example
    New-ClassDefinition -InputObject (gsv)[0] -ExcludeProperty CanPauseAndContinue,Status

    .Example
    New-ClassDefinition -InputObject (ps)[0] -UserMethod $UserMethod 
#>


## TODO
<#
    Implement IncludeProperty
#>
param(
    $ClassName,
    $InputObject,
    $ExcludeProperty,
    $UserMethod,
    $Ctor
)

if (!$ClassName) {
    $ClassName = "My{0}" -f $InputObject.GetType().Name
}
    
if (!$ctor) {
    $ctor = @"
    $ClassName() {
        #ctor
    }
"@
}

$propertyNames = $InputObject.psobject.properties | 
Where-Object { $_.MemberType -eq 'property' -and $_.name -notin $ExcludeProperty }
  
$classProperties = foreach ($property in $propertyNames | sort Name) {
    "`t[{0}]`${1}`n" -f $property.TypeNameOfValue, $property.Name        
}

$definition = @"
class $ClassName {

$ctor

$classProperties

$UserMethod
}
"@

if (Get-Command Out-CurrentFile -ErrorAction SilentlyContinue) {
    $null = $definition | Out-CurrentFile -AsNewFile
}
else {
    $definition
}