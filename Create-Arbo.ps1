$ErrorActionPreference = "SilentlyContinue"

# Variables générales :
$lecteur_Arbo = "E:"


    cls
    Write-host
    Write-host
    Write-host
    Write-host "`t`t    ############################################################################"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #              " -nonewline ; write-host "-  Création de l'arborescence de ressources -"-nonewline -foreGroundColor Red ; Write-host "                 #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #         E:\                                                                #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #          ==> Bdd                                                           #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #               ==> Atelier                                                  #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #                      ==> Logiciel                                          #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #                      ==> Materiel                                          #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #               ==> Commun                                                   #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #               ==> Em                                                       #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #               ==> Rh                                                       #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #                    ==> Civil                                               #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #                    ==> Mili                                                #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #                                                                            #"
    Write-host "`t`t   #      Total : 9 dossiers                                                    #"
    Write-host "`t`t   #                                                        ,Powered By Valéry  #"
    Write-host "`t`t    ############################################################################"
    Write-host
    Write-host
    Write-host
    Write-host

    pause
    cls

    Write-host
    Write-host
    Write-host " *** Test de la présence de la partition E:\ *** "-foreGroundColor Red
    Write-host
    Write-host
    
        if ( (test-path "e:\") -eq $false )
        {
        Write-host " Vous n'avez pas créé la partition E:\ , Veuillez faire le nécessaire et relancer le script..."
        Write-host
        Write-host "Le script ne peut pas continuer.."
        Write-host
        Write-host
        Write-host
        pause
        exit
        }
        else
        {
        $vol_E = Get-Volume | where-Object { $_.Driveletter -eq "E" }

            if ( $vol_E.FileSystem -ne "NTFS")
            {
            Write-host " La partition E:\ existe mais n'est pas en NTFS , Veuillez faire le nécessaire et relancer le script..."
            Write-host
            Write-host "Le script ne peut pas continuer.."
            Write-host
            Write-host
            Write-host
            pause
            exit
            }
            if ( $vol_E.FileSystem -eq "NTFS")
            {
            Write-host " La partition E:\ existe..."
            Write-host
            Write-host " Le script peut continuer.."
            Write-host
            Write-host
            Write-host
            pause
            }
        }

    cls

    Write-host
    Write-host
    Write-host " *** Création des dossiers : *** "-foreGroundColor Red
    Write-host
    Write-host

    $count = 0
    $tab_folders = @(
                    "E:\Bdd",
                    "E:\Bdd\Atelier",
                    "E:\Bdd\Atelier\Logiciel",
                    "E:\Bdd\Atelier\Materiel",
                    "E:\Bdd\Commun",
                    "E:\Bdd\Em",
                    "E:\Bdd\Rh",
                    "E:\Bdd\Rh\Civil",
                    "E:\Bdd\Rh\Mili"
                    )

    ForEach ($i in $tab_folders )
    {
        if ( (test-path $i) -eq $false )
        {
        New-item -Path $i -ItemType Directory -Confirm:$false | out-null
        Write-host " Le dossier " -nonewline ; Write-host "$i"  -nonewline -foreGroundColor Yellow ; Write-host " a bien été créé ..."
        $count++
        }
        else
        {
        Write-host " Le dossier " -nonewline ; Write-host "$i"  -nonewline -foreGroundColor Yellow ; Write-host " existait déjà."
        $count++
        }

    }
    
    Write-host
    Write-host
    Write-host
    Write-host " ==> Total dossiers attendus : " -nonewline ; Write-host " $($tab_folders.count)"  -nonewline -foreGroundColor Red
    Write-host
    Write-host
    Write-host " ==> Total dossiers créés ou existant : " -nonewline ; Write-host "$count"  -nonewline -foreGroundColor Red
    Write-host
    Write-host
    Write-host
    Write-host

    pause
    cls

    Write-host
    Write-host
    Write-host "    ###############################"
    Write-host "    #                             #"
    Write-host "    #    *** FIN DU SCRIPT ***    #" -foreGroundColor Red
    Write-host "    #                             #"
    Write-host "    ###############################"
    Write-host
    Write-host
    Write-host
    Write-host
    Write-host
    Write-host

    pause
    exit


























