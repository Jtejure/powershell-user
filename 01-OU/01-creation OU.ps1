$var = Import-Csv "C:\Users\Administrateur.WIN-1M80S6L8VPO\Desktop\01-OU.csv"
	foreach ($item in $var)
	{
	    New-ADOrganizationalUnit -Name $item.OUNAme -Path "DC=BRICOFLEX,DC=fr"
	    Write-Host "Creation de l'OU : " $item.OUNAme
	}
