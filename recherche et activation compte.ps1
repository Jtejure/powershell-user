
#recherche les compte desactivé

Search-ADAccount -AccountDisabled -SearchBase "OU=Unite,DC=CPR,DC=intradef,DC=gouv,DC=fr"


#active le compte voulue

Enable-ADAccount -Identity a.abadie