
#On traite le fichier CSV
$fichier = Import-Csv -path "C:\Users\CPR\Desktop\users.csv" -Delimiter ";"

#Variables générales
$dndomain = (Get-ADDomain).DistinguishedName
$dns_domain = (Get-ADDomain).dnsroot
$DN_OU_Base = "OU=Unite,$dndomain"

Write-host
Write-host
pause

#On traite ligne par ligne le contenu du tableau $fichier

    foreach ( $i in $fichier ) #$i, nom donné arbitrairement
    {
    $SurName = $i.prenom
    $GivenName = $i.nom
    $Name = $i.Nom_User
    $DisplayName = $i.Nom_User
	$SAMAccountName =  $i.Login
	$Title = $i.fonction_et_description
    $Description =  $i.fonction_et_description
    $pwd_clair = $i.mot_de_passe
	$GG_app = $i.GG
	$ou = $i.OU

    # Conversion chaine securisee du mdp en clair
    $pwd_Secure = ConvertTo-SecureString -AsPlainText $pwd_clair -force

    # On recupere le DN de l'OU :
    $DN_OU = (Get-ADOrganizationalUnit -Filter { Name -eq $ou } -SearchBase $DN_OU_Base -SearchScope Subtree).DistinguishedName
    
    # creation de l'user
	New-ADUser -SamAccountName $SAMAccountName -name $DisplayName -DisplayName $DisplayName -surname $SurName`    -GivenName $GivenName -Title $title -Description $description -AccountPassword $pwd_Secure -Path $DN_OU -Enabled $false
    		
    # nous allons maintenant le rajouter au groupe designé dans le CSV
	Add-ADGroupMember -identity $GG_app -Members $SAMAccountName
		
	}


write-host
write-host " #####################"
write-host "#                     #"
Write-host "#  ! Fin du script !  #"
write-host "#                     #"
write-host " #####################"
write-host

pause
exit



	





