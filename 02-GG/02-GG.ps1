$var = Import-Csv "chemin du CSV\02-GG.csv"
	foreach ($item in $var)
	{
	    New-ADGroup -name $item.GGNAme -Path "chemin du domaine" -GroupCategory Security -GroupScope Global -PassThru –Verbose
	    Write-Host "Creation du GG : " $item.GGNAme
	}

 