$pwd= ConvertTo-SecureString "Azerty+35" –AsPlainText -Force

New-ADUser -Name "Amedee Pan" -SamAccountName "a.pan" -GivenName "Amedee" -Surname "Pan" -path "OU=Cdt,OU=Unite,DC=CPR,DC=intradef,DC=gouv,DC=fr" -AccountPassword $pwd -UserPrincipalName "a.pan@CPR.defense.gouv.fr" -Description "Chef du Cdt" -Title "Chef du Cdt, adjoint au chef de l'unité"