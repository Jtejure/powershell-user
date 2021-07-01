New-ADGroup -name "GG_Soutien" -Path "OU=Soutien,OU=Unite,DC=CPR,DC=intradef,DC=gouv,DC=fr"  -GroupCategory Security -GroupScope Global
Add-ADGroupMember -Identity "GG_Soutien" -Members "CN=Aubin Didon,OU=Soutien,OU=Unite,DC=CPR,DC=intradef,DC=gouv,DC=fr"

#lancer cette commande apres pour rajouter le GG dans un autre GG #

Add-ADGroupMember -Identity "GG_Unite" -Members "CN=GG_Soutien,OU=Soutien,OU=Unite,DC=CPR,DC=intradef,DC=gouv,DC=fr"