$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

&"$scriptPath\paramtools\paramtools.exe" convert --game DS3 `
    --input-format csv --input-path "$scriptPath/../param/gameparam/csv" `
    --output-format regulation --output-path "$scriptPath/../param/gameparam/gameparam_dlc2.parambnd.dcx" `
    --paramdex-path "$scriptPath/paramdex"

Start-Sleep -s 10