
$dom = Get-ADDomain
$DN = "OU=DL_TEST," + $dom.DistinguishedName


echo "Entrez le chemin absolu : "
$path = Read-Host 
$arborescence = Get-ChildItem -Path  $path -Recurse
$arborescence.FullName


New-ADOrganizationalUnit -Name DL_Test -Path "DC=zbr,DC=intradef,DC=gouv,DC=fr"




$dom = Get-ADDomain
$DN = "OU=DL_TEST," + $dom.DistinguishedName




Foreach ($dossier in $arborescence)
{
	# Création des DL relatives au nom de dossier
	$nom = "DL_"+ $dossier
	New-ADGroup -Name $nom"_R" -GroupScope DomainLocal -Path $DN
	New-ADGroup -Name $nom"_RW" -GroupScope DomainLocal -Path $DN	
}