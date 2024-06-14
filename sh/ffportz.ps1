# Archive a particular program's directory

$craps = "Data\profile\storage\default\https+++web.whatsapp.com\", "Data\profile\storage\default\https+++codesandbox.io", "Data\profile\storage\default\https+++www.nytimes.com", "Data\profile\cache2\"


echo "This script location: $PSScriptRoot"
$ffpath = $PSScriptRoot

$rootpath = Split-Path -Path $ffpath
$ffdirname = Split-Path -Path $ffpath -Leaf
echo "FF dir name: $ffdirname"


foreach ($crap in $craps) {
	if (Test-Path -LiteralPath "$ffpath/$crap") {
		echo "del $crap"
		rm -r "$ffpath/$crap"
		#Remove-Item -LiteralPath $path -Verbose -Recurse -WhatIf
	}
}


$mstime = [Math]::Round((Get-Date).ToFileTimeUTC()/10000)
$mstime = ($mstime % 1000)
$outname = "$ffdirname" + "__" + "$mstime" + ".7z"
$outpath = "$rootpath/$outname"

7z -mmt6 -mx6 a $outpath $ffpath
cp $outpath h:/$outname
