# Change the link below to the URL of your spreadsheet without the /edit part on the end
$sheetsUrl = "https://docs.google.com/spreadsheets/d/1STHKx7fVc5Hxz2LqUUg5gPrQHgmeAQT6sMxEZwfKoKA"

echo "Downloading export from Google Sheets"

$ProgressPreference = 'Continue'
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
invoke-webrequest -Uri "$sheetsUrl/export?format=xlsx" -OutFile "$scriptPath/../param/gameparam/params.xlsx"

&"$scriptPath\paramtools\paramtools.exe" convert --game DS3 `
    --input-format excel --input-path "$scriptPath/../param/gameparam/params.xlsx" `
    --output-format regulation --output-path "$scriptPath/../param/gameparam/gameparam_dlc2.parambnd.dcx" `
    --paramdex-path "$scriptPath/paramdex"

Sleep -s 10