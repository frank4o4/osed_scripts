# Define color variables
$blue = [console]::ForegroundColor = "Blue"
$red = [console]::ForegroundColor = "Red"
$green = [console]::ForegroundColor = "Green"
$yellow = [console]::ForegroundColor = "Yellow"
$reset = [console]::ResetColor()

# Define line
$bottom_line = "----------------------------------------------------------------------------------------------------"

# Check if a filename is provided as an argument
if ($args.Count -ne 1) {
    Write-Host "Usage: $MyInvocation.MyCommand <filename>" -ForegroundColor Red
    exit 1
}

$filename = $args[0]

# Check if the file exists
if (-not (Test-Path $filename -PathType Leaf)) {
    Write-Host "File $filename not found." -ForegroundColor Red
    exit 1
}

# Perform the operation on the input file
Write-Host ""

Write-Host "$red(jmp|call) $reset"
Select-String '(jmp|call) esp;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(mov)$reset"
Select-String 'mov e.., \[e..\];' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Select-String 'mov \[e..\], e..;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Select-String 'mov e.., e..;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(xchg)$reset"
Select-String 'xchg e.., e..;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(push)$reset"
Select-String 'push e..;.*pop e..;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(inc)$reset"
Select-String 'inc e..;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(dec)$reset"
Select-String 'dec e..;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(neg)$reset"
Select-String 'neg e..;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(push)$reset"
Select-String 'push e..;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(pop)$reset"
Select-String 'pop e..;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(pushad)$reset"
Select-String 'pushad;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(and)$reset"
Select-String 'and e.., (e..|0x.+?);' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(xor)$reset"
Select-String 'xor e.., (e..|0x.+?);' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(add)$reset"
Select-String 'add e.., (e..|0x.+?);' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(sub)$reset"
Select-String 'sub e.., (e..|0x.+?);' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"

Write-Host "$red(lea|mov|and)$reset"
Select-String '(lea|mov|and) \[?e..\]?, 0;' $filename | ForEach-Object { $_.Line.Length, $_.Line } | Sort-Object -Descending | Select-Object -First 1 | ForEach-Object { $_[1] }
Write-Host "$blue$bottom_line$reset"
