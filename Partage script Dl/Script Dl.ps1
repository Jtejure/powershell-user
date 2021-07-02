# SECURISATION RESSOURCES WINDOWS SERVER 2008




# Emplacement du fichier de création de l'arbo
$fic = "E:\Scripts\arbo_NTFS.txt"

# Récupération du SID pour le CREATEUR PROPRIETAIRE
$CP = New-Object System.Security.Principal.NtAccount("CREATEUR PROPRIETAIRE")
$CPsid = $CP.Translate([System.Security.Principal.SecurityIdentifier])

# Récupération du SID pour le compte SYSTEM
$ST = New-Object System.Security.Principal.NtAccount("SYSTEM")
$STsid = $ST.Translate([System.Security.Principal.SecurityIdentifier])

# Création de l'UO DL dans le domaine
New-ADOrganizationalUnit -Name DL

# Stockage du DN de l'UO DL
$dom = Get-ADDomain
$DN = "OU=DL," + $dom.DistinguishedName

# Stockage du nom de domaine NETBIOS
$domaine = $dom.NetBIOSName
 
# Récupération du contenu du fichier d'import
$liste = Get-Content -Path $fic

Foreach ($dossier in $liste)
{
	# Récupération du nom relatif du dossier
	$lignes = $dossier.Split("\") | Measure-Object -Line
	$pos = $lignes.Lines
	$rep = $dossier.Split("\")[$pos-1]

	# Création des DL relatives au nom de dossier
	$nom = "DL_"+$rep
	New-ADGroup -Name $nom"_R" -GroupScope DomainLocal -Path $DN
	New-ADGroup -Name $nom"_RW" -GroupScope DomainLocal -Path $DN

	# Création des dossiers avec chemin complet
	New-Item -Type directory -Path $dossier

	
}
