/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ATTENTION : 
Ce fichier doit �tre recopi� dans le repertoire d'intallation de progress
sur chaque machine 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/

/* Affectations des variables */
ASSIGN
	Disque 	= os-getenv("disque")
	Reseau 	= os-getenv("reseau")
	Util	= os-getenv("devusr")
	dlc	= os-getenv("DLC")
	windows	= os-getenv("windir")
	.

/*if os-getenv("MACHINE_VIRTUELLE") = "oui" then reseau = "Z:\H_Barbade\".*/
  
/* Affectation de la variable prowin */
prowin = "".
if search(dlc + "\bin\prowin32.exe") <> ? then prowin = "prowin32.exe".
if search(dlc + "\bin\prowin.exe") <> ? then prowin = "prowin.exe".
if prowin = "" then prowin = "prowin32.exe".

GET-KEY-VALUE SECTION "Outils" KEY "Serveur" 		VALUE Serveur.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_Appli" 		VALUE Ser_appli.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_Appdev"		VALUE Ser_appdev.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_outils" 	VALUE Ser_Outils.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_tmp" 		VALUE Ser_tmp.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_log" 		VALUE Ser_Log.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_intf" 		VALUE Ser_intf.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_dat" 		VALUE ser_dat.

GET-KEY-VALUE SECTION "Outils" KEY "Rep_outils" 	VALUE Loc_Outils.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_Appli" 		VALUE Loc_appli.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_Appdev"		VALUE Loc_appdev.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_tmp" 		VALUE Loc_tmp.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_log" 		VALUE Loc_Log.
GET-KEY-VALUE SECTION "Outils" KEY "Rep_intf" 		VALUE Loc_intf.

GET-KEY-VALUE SECTION "Outils" KEY "imp_dev" 		VALUE imprimante.

ASSIGN
	ser_outils = reseau + ser_outils
	ser_outadb = ser_outils + "\adb"
	ser_outgest = ser_outils + "\gest"
	ser_outcadb = ser_outils + "\cadb"
	ser_outtrans = ser_outils + "\trans"
	ser_appli = reseau + ser_appli
	ser_appdev = reseau + ser_appdev
	ser_tmp = reseau + ser_tmp
	ser_log = reseau + ser_log
	ser_intf = reseau + ser_intf
	ser_dat = reseau + ser_dat
	loc_outils = Disque + loc_outils
	loc_outadb = loc_outils + "\adb"
	loc_outgest = loc_outils + "\gest"
	loc_outcadb = loc_outils + "\cadb"
	loc_outtrans = loc_outils + "\trans"
	loc_appli = disque + loc_appli
	loc_appdev = disque + loc_appdev
	loc_tmp = disque + loc_tmp
	loc_log = disque + loc_log
	loc_intf = disque + loc_intf
	.

ASSIGN
	RpOriGi = ser_appli
	RpDesGi = Loc_appli
	RpOriadb = ser_appli + "\adb"
	RpDesadb = Loc_appli + "\adb"
	RpOriges = ser_appli + "\gest"
	RpDesges = Loc_appli + "\gest"
	RpOricad = ser_appli + "\cadb"
	RpDescad = Loc_appli + "\cadb"
	RpOritrf = ser_appli + "\trans"
	RpDestrf = Loc_appli + "\trans"
	.

/* le propath est retravaill� apres pour remplacer LOC par le disque local courant et SRV avec le disque serveur courant */
ASSIGN
	PMEPATH = "" +
		"LOC:\gidev," +
		"SRV:\gidev," +
		"LOC:\gidev\src," +
		"SRV:\gidev\src," +
		"LOC:\gidev\gest," +
		"LOC:\gidev\gest\src," +
		"LOC:\gidev\gest\comm," +
		"LOC:\gidev\gest\exe," +
		"LOC:\gidev\gest\src\batch," +
		"SRV:\gidev\gest," +
		"SRV:\gidev\gest\src," +
		"SRV:\gidev\gest\comm," +
		"SRV:\gidev\gest\exe," +
		"SRV:\gidev\gest\src\batch"
	CDBPATH = "" +
		"LOC:\gidev," +
		"SRV:\gidev," +
		"LOC:\gidev\src," +
		"SRV:\gidev\src," +
		"LOC:\gidev\cadb," +
		"LOC:\gidev\cadb\src," +
		"LOC:\gidev\cadb\comm," +
		"LOC:\gidev\cadb\exe," +
		"SRV:\gidev\cadb," +
		"SRV:\gidev\cadb\src," +
		"SRV:\gidev\cadb\comm," +
		"SRV:\gidev\cadb\exe," +
		"LOC:\gidev\gest," +
		"LOC:\gidev\gest\src," +
		"LOC:\gidev\gest\comm," +
		"LOC:\gidev\gest\exe," +
		"LOC:\gidev\cadb\src\batch," +
		"LOC:\gidev\gest\src\batch," +
		"SRV:\gidev\gest," +
		"SRV:\gidev\gest\src," +
		"SRV:\gidev\gest\comm," +
		"SRV:\gidev\gest\exe," +
		"SRV:\gidev\cadb\src\batch," +
		"SRV:\gidev\gest\src\batch"
/*------
	ADBPATH = "" +
		"DLC:\src," +
		"DLC:\src\prodict.pl," +
		"LOC:\gidev," +
		"LOC:\gidev\src," +
		"LOC:\gidev\gest," +
		"LOC:\gidev\comm," +
		"LOC:\gidev\trans\comm," +
		"LOC:\gidev\adb\comm," +
		"LOC:\gidev\dwh\comm," +
		"LOC:\gidev\trans\src\incl," +
		"LOC:\gidev\adb\objet," +
		"LOC:\gidev\adb\src\envt," +
		"LOC:\gidev\trans\src\edigene," +
		"LOC:\gidev\trans\src\lecture," +
		"LOC:\gidev\cadb," +
		"LOC:\gidev\cadb\src," +
		"LOC:\gidev\cadb\src\batch," +
		"SRV:\gidev\trans\src\incl," +
		"SRV:\gidev\cadb," +
		"SRV:\gidev\cadb\src," +
		"SRV:\gidev\cadb\src\batch," +
		"LOC:\gidev\adb," +
		"LOC:\gidev\dwh," + 
		"LOC:\gidev\gest\src," +
		"LOC:\gidev\adb," +
		"LOC:\gidev\adb\src"
----*/
	ADBPATH = "" +
		"DLC:\src," +
		"DLC:\src\prodict.pl," +
		"LOC:\gidev," +
		"SRV:\gidev," +
		"LOC:\gidev\src," +
		"SRV:\gidev\src," +
		"LOC:\gidev\gest," +
		"SRV:\gidev\gest," +
		"LOC:\gidev\comm," +
		"SRV:\gidev\comm," +
		"LOC:\gidev\trans\comm," +
		"SRV:\gidev\trans\comm," +
		"LOC:\gidev\adb\comm," +
		"SRV:\gidev\adb\comm," +
		"LOC:\gidev\dwh\comm," +
		"SRV:\gidev\dwh\comm," +
		"LOC:\gidev\trans\src\incl," +
		"SRV:\gidev\trans\src\incl," +
		"LOC:\gidev\adb\objet," +
		"SRV:\gidev\adb\objet," +
		"LOC:\gidev\adb\src\envt," +
		"SRV:\gidev\adb\src\envt," +
		"LOC:\gidev\trans\src\edigene," +
		"SRV:\gidev\trans\src\edigene," +
		"LOC:\gidev\trans\src\lecture," +
		"SRV:\gidev\trans\src\lecture," +
		"LOC:\gidev\cadb," +
		"SRV:\gidev\cadb," +
		"LOC:\gidev\cadb\src," +
		"SRV:\gidev\cadb\src," +
		"LOC:\gidev\cadb\src\batch," +
		"SRV:\gidev\cadb\src\batch," +
		"LOC:\gidev\adb," +
		"SRV:\gidev\adb," +
		"LOC:\gidev\dwh," + 
		"SRV:\gidev\dwh," + 
		"LOC:\gidev\gest\src," +
		"SRV:\gidev\gest\src," +
		"LOC:\gidev\adb\src," +
		"SRV:\gidev\adb\src"
	DROITPATH = "" +
		"DLC:\src," +
		"DLC:\src\prodict.pl," +
		"LOC:\gidev\src," +
		"LOC:\gidev\gest," +
		"LOC:\gidev\gest\src," +
		"LOC:\gidev\gest\comm," +
		"LOC:\gidev\gest\src\batch," +
		"LOC:\gidev\comm," +
		"SRV:\gidev\src," +
		"SRV:\gidev\gest," +
		"SRV:\gidev\gest\src," +
		"SRV:\gidev\gest\comm," +
		"SRV:\gidev\gest\src\batch," +
		"SRV:\gidev\comm," +
		"LOC:\gidev," +
		"SRV:\gidev"
		.
		
    CARTUPATH = "" +
        "C:\MAGI\workspace\magiController\PASOEContent\WEB-INF\openedge," +
        "C:\MAGI\workspace\magiController\src," +
        "C:\MAGI\workspace\magiController\src\AppServer," +
        "C:\MAGI\workspace\magiController," +
        "C:\MAGI\workspace\magiModele\src\AppServer," +
        "C:\dlc\oe117\gui\," +
        "C:\dlc\oe117\gui\adecomm.pl," +
        "C:\dlc\oe117\gui\adecomp.pl," +
        "C:\dlc\oe117\gui\adedict.pl," +
        "C:\dlc\oe117\gui\adeedit.pl," +
        "C:\dlc\oe117\gui\adeicon.pl," +
        "C:\dlc\oe117\gui\adeshar.pl," +
        "C:\dlc\oe117\gui\adeuib.pl," +
        "C:\dlc\oe117\gui\adeweb.pl," +
        "C:\dlc\oe117\gui\adexml.pl," +
        "C:\dlc\oe117\gui\dataadmin.pl," +
        "C:\dlc\oe117\gui\prodict.pl," +
        "C:\dlc\oe117\gui\protools.pl," +
        "C:\dlc\oe117\gui\OpenEdge.Core.pl," +
        "C:\dlc\oe117\gui\OpenEdge.BusinessLogic.pl," +
        "C:\dlc\oe117\gui\netlib\OpenEdge.Net.pl," +
        "C:\dlc\oe117," +
        "C:\dlc\oe117\bin," +
        "C:\dlc\oe117\tty," +
        "C:\MAGI\Appli_V11\gidev\comm," +
        "C:\dlc\oe117\gui," +
        "C:\dlc\oe117\gui\ablunit.pl," +
        "C:\dlc\oe117\gui\adedesk.pl," +
        "C:\dlc\oe117\gui\aderes.pl," +
        "C:\dlc\oe117\gui\OpenEdge.ServerAdmin.pl"
        .
        
ASSIGN
	PMEPATH = REPLACE(PMEPATH,"LOC:\",disque).
	PMEPATH = REPLACE(PMEPATH,"SRV:\",reseau).
	PMEPATH = REPLACE(PMEPATH,"DLC:",dlc).
	CDBPATH = REPLACE(CDBPATH,"LOC:\",disque).
	CDBPATH = REPLACE(CDBPATH,"SRV:\",reseau).
	CDBPATH = REPLACE(CDBPATH,"DLC:",dlc).
	ADBPATH = REPLACE(ADBPATH,"LOC:\",disque).
	ADBPATH = REPLACE(ADBPATH,"SRV:\",reseau).
	ADBPATH = REPLACE(ADBPATH,"DLC:",dlc).
	DROITPATH = REPLACE(DROITPATH,"LOC:\",disque).
	DROITPATH = REPLACE(DROITPATH,"SRV:\",reseau).
	DROITPATH = REPLACE(DROITPATH,"DLC:",dlc).
	.


PROCEDURE GenerePF:

    DEFINE INPUT PARAMETER cFichierPfOriginal-in AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER cListeBases-in AS CHARACTER NO-UNDO.
    DEFINE INPUT PARAMETER cFichierPfGenere-in AS CHARACTER NO-UNDO.
    
    DEFINE VARIABLE cLigne AS CHARACTER NO-UNDO.
    DEFINE VARIABLE lAGarder AS LOGICAL NO-UNDO.
    DEFINE VARIABLE iBoucle AS INTEGER NO-UNDO.
    
    
    INPUT FROM VALUE(cFichierPfOriginal-in).
    OUTPUT TO VALUE(cFichierPfGenere-in).
    
    PUT UNFORMATTED "# Fichier .pf g�n�r� par asvarenv.i pour menudev2 � partir de " + cFichierPfOriginal-in SKIP(1).
    
    REPEAT:
        IMPORT UNFORMATTED cLigne.
        
        /* La ligne est-elle � conserver */
        lAGarder = FALSE.
        IF TRIM(cLigne) = "" OR cLigne BEGINS("#") THEN lAGarder = TRUE.
        DO iBoucle = 1 TO NUM-ENTRIES(cListeBases-in):
            IF cLigne MATCHES("*" + ENTRY(iBoucle,cListeBases-in) + "*") THEN lAGarder = TRUE.
        END.
        IF lAGarder THEN DO:
            PUT UNFORMATTED cLigne SKIP.
        END.
    END.
    
    INPUT CLOSE.
    OUTPUT CLOSE.

END PROCEDURE.