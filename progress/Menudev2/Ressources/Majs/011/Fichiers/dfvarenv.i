/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ATTENTION : 
Ce fichier doit �tre recopi� dans le repertoire d'intallation de progress
sur chaque machine 
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
/* D�finitions des variables */
DEFINE {1} VARIABLE Util	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Disque	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Reseau	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE dlc		AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE windows	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Serveur	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Ser_appli	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Ser_appdev	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Ser_outils	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Ser_dat	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Ser_outadb	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Ser_outgest	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Ser_outcadb	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Ser_outtrans AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Ser_tmp	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Ser_log	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Ser_intf	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Loc_outils	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Loc_dat	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Loc_outadb	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Loc_outgest	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Loc_outcadb	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Loc_outtrans AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Loc_appli	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Loc_appdev	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Loc_tmp	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Loc_log	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE Loc_intf	AS CHARACTER	NO-UNDO.

DEFINE {1} VARIABLE RpOriGi	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE RpDesGi	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE RpOriadb	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE RpDesadb	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE RpOriges	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE RpDesges	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE RpOritrf	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE RpDestrf	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE RpOricad	AS CHARACTER	NO-UNDO.
DEFINE {1} VARIABLE RpDescad	AS CHARACTER	NO-UNDO.

DEFINE {1} VARIABLE PMEPATH	AS CHARACTER	FORMAT "x(512)" NO-UNDO.
DEFINE {1} VARIABLE ADBPATH	AS CHARACTER	FORMAT "x(512)" NO-UNDO.
DEFINE {1} VARIABLE CDBPATH	AS CHARACTER	FORMAT "x(512)" NO-UNDO.
DEFINE {1} VARIABLE DROITPATH	AS CHARACTER	FORMAT "x(512)" NO-UNDO.
DEFINE {1} VARIABLE CARTUPATH	AS CHARACTER	FORMAT "x(512)" NO-UNDO.

DEFINE {1} VARIABLE imprimante	AS CHARACTER	NO-UNDO.

