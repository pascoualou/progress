&ANALYZE-SUSPEND _VERSION-NUMBER UIB_v9r12 GUI
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME CURRENT-WINDOW
&Scoped-define FRAME-NAME frmPrefs
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS frmPrefs 
/*------------------------------------------------------------------------

  File: 

  Description: 

  Input Parameters:
      

  Output Parameters:
      <none>

  Author: 

  Created: 
------------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.       */
/*----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */
    DEFINE INPUT PARAMETER cIdentModule-in AS CHARACTER NO-UNDO.

/* Local Variable Definitions ---                                       */

    {includes\i_environnement.i}
    {includes\i_dialogue.i}
    {menudev2\includes\menudev2.i}

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Dialog-Box
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME frmPrefs

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS Btn_PrefsGenerales Btn_Cancel 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define a dialog box                                                  */

/* Definitions of the field level widgets                               */
DEFINE BUTTON Btn_Cancel AUTO-GO 
     LABEL "Retour" 
     SIZE 68 BY 1.14
     BGCOLOR 8 .

DEFINE BUTTON Btn_PrefsGenerales 
     LABEL "Pr�f�rences g�n�rales" 
     SIZE 31 BY 1.14
     BGCOLOR 8 .

DEFINE VARIABLE filRepertoireCommentaires AS CHARACTER FORMAT "X(256)":U 
     LABEL "R�pertoire de stockage des commentaires" 
     VIEW-AS FILL-IN NATIVE 
     SIZE 55 BY .95 NO-UNDO.

DEFINE VARIABLE tglActionsClassees AS LOGICAL INITIAL no 
     LABEL "Une action 'A Faire' vient en t�te de liste, une 'Faite' ou 'Abandonn�e' passe en fin de liste" 
     VIEW-AS TOGGLE-BOX
     SIZE 90 BY .95 NO-UNDO.

DEFINE VARIABLE tglNomAction AS LOGICAL INITIAL no 
     LABEL "Utiliser le nom de l'action plut�t qu'un num�ro pour le fichier commentaire d'une action" 
     VIEW-AS TOGGLE-BOX
     SIZE 87 BY .95 NO-UNDO.

DEFINE VARIABLE tglRetourDebut AS LOGICAL INITIAL no 
     LABEL "Retour au d�but de la liste apr�s action 'Faite'" 
     VIEW-AS TOGGLE-BOX
     SIZE 49 BY .95 NO-UNDO.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME frmPrefs
     Btn_PrefsGenerales AT ROW 9.1 COL 3 WIDGET-ID 2
     Btn_Cancel AT ROW 9.1 COL 35
     SPACE(1.79) SKIP(0.37)
    WITH VIEW-AS DIALOG-BOX KEEP-TAB-ORDER 
         SIDE-LABELS NO-UNDERLINE THREE-D  SCROLLABLE 
         TITLE "Pr�f�rences xxx".

DEFINE FRAME frmModule
     tglActionsClassees AT ROW 2.43 COL 3 WIDGET-ID 346
     tglNomAction AT ROW 3.62 COL 3 WIDGET-ID 344
     tglRetourDebut AT ROW 4.81 COL 3 WIDGET-ID 348
     filRepertoireCommentaires AT ROW 6 COL 42 COLON-ALIGNED WIDGET-ID 278
    WITH 1 DOWN KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 3 ROW 1.24
         SIZE 100 BY 7.62
         TITLE "Pr�f�rences du module : xxx".


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Dialog-Box
   Allow: Basic,Browse,DB-Fields,Query
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS



/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* REPARENT FRAME */
ASSIGN FRAME frmModule:FRAME = FRAME frmPrefs:HANDLE.

/* SETTINGS FOR FRAME frmModule
                                                                        */
ASSIGN 
       FRAME frmModule:HIDDEN           = TRUE.

/* SETTINGS FOR DIALOG-BOX frmPrefs
   NOT-VISIBLE FRAME-NAME                                               */

DEFINE VARIABLE XXTABVALXX AS LOGICAL NO-UNDO.

ASSIGN XXTABVALXX = FRAME frmModule:MOVE-BEFORE-TAB-ITEM (Btn_PrefsGenerales:HANDLE IN FRAME frmPrefs)
/* END-ASSIGN-TABS */.

ASSIGN 
       FRAME frmPrefs:SCROLLABLE       = FALSE
       FRAME frmPrefs:HIDDEN           = TRUE.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME frmPrefs
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL frmPrefs frmPrefs
ON WINDOW-CLOSE OF FRAME frmPrefs /* Pr�f�rences xxx */
DO:
  APPLY "END-ERROR":U TO SELF.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME Btn_PrefsGenerales
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL Btn_PrefsGenerales frmPrefs
ON CHOOSE OF Btn_PrefsGenerales IN FRAME frmPrefs /* Pr�f�rences g�n�rales */
DO:
  RUN DonneOrdre("PREFS-GENERALES").
  APPLY "CHOOSE" TO Btn_Cancel.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME frmModule
&Scoped-define SELF-NAME filRepertoireCommentaires
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL filRepertoireCommentaires frmPrefs
ON LEAVE OF filRepertoireCommentaires IN FRAME frmModule /* R�pertoire de stockage des commentaires */
DO:
      SauvePreference("PREF-REPERTOIRE-COMMENTAIRES",SELF:SCREEN-VALUE).
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME tglActionsClassees
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL tglActionsClassees frmPrefs
ON VALUE-CHANGED OF tglActionsClassees IN FRAME frmModule /* Une action 'A Faire' vient en t�te de liste, une 'Faite' ou 'Abandonn�e' passe en fin de liste */
DO:
    SauvePreference("PREF-ACTION-DEBUT-FIN",(IF SELF:CHECKED THEN "OUI" ELSE "NON")).
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME tglNomAction
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL tglNomAction frmPrefs
ON VALUE-CHANGED OF tglNomAction IN FRAME frmModule /* Utiliser le nom de l'action plut�t qu'un num�ro pour le fichier commentaire d'une action */
DO:
    SauvePreference("PREF-ACTION-COMMENTAIRE-NOM",(IF SELF:CHECKED THEN "OUI" ELSE "NON")).
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME tglRetourDebut
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL tglRetourDebut frmPrefs
ON VALUE-CHANGED OF tglRetourDebut IN FRAME frmModule /* Retour au d�but de la liste apr�s action 'Faite' */
DO:
    SauvePreference("PREF-ACTION-RETOUR-DEBUT",(IF SELF:CHECKED THEN "OUI" ELSE "NON")).
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME frmPrefs
&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK frmPrefs 


/* ***************************  Main Block  *************************** */

/* Parent the dialog-box to the ACTIVE-WINDOW, if there is no parent.   */
IF VALID-HANDLE(ACTIVE-WINDOW) AND FRAME {&FRAME-NAME}:PARENT eq ?
THEN FRAME {&FRAME-NAME}:PARENT = ACTIVE-WINDOW.


/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
DO ON ERROR   UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK
   ON END-KEY UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK:
  RUN enable_UI.
  RUN Initialisation.
  WAIT-FOR GO OF FRAME {&FRAME-NAME}.
END.
RUN disable_UI.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI frmPrefs  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Hide all frames. */
  HIDE FRAME frmModule.
  HIDE FRAME frmPrefs.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE DonneOrdre frmPrefs 
PROCEDURE DonneOrdre :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
DEFINE INPUT PARAMETER  cOrdre-in   AS CHARACTER    NO-UNDO.


    /* Handle valide ? */
    IF VALID-HANDLE(ghGeneral) THEN DO:
        /* appel du module */
        RUN ExecuteOrdre IN ghGeneral (cOrdre-in).
    END.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enable_UI frmPrefs  _DEFAULT-ENABLE
PROCEDURE enable_UI :
/*------------------------------------------------------------------------------
  Purpose:     ENABLE the User Interface
  Parameters:  <none>
  Notes:       Here we display/view/enable the widgets in the
               user-interface.  In addition, OPEN all queries
               associated with each FRAME and BROWSE.
               These statements here are based on the "Other 
               Settings" section of the widget Property Sheets.
------------------------------------------------------------------------------*/
  ENABLE Btn_PrefsGenerales Btn_Cancel 
      WITH FRAME frmPrefs.
  {&OPEN-BROWSERS-IN-QUERY-frmPrefs}
  DISPLAY tglActionsClassees tglNomAction tglRetourDebut 
          filRepertoireCommentaires 
      WITH FRAME frmModule.
  ENABLE tglActionsClassees tglNomAction tglRetourDebut 
         filRepertoireCommentaires 
      WITH FRAME frmModule.
  VIEW FRAME frmModule.
  {&OPEN-BROWSERS-IN-QUERY-frmModule}
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE Initialisation frmPrefs 
PROCEDURE Initialisation :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
    FRAME frmPrefs:TITLE = "Pr�f�rences " + DonneNomModule(cIdentModule-in).
    FRAME frmModule:TITLE = "Pr�f�rences du module : " + DonneNomModule(cIdentModule-in).

    DO WITH FRAME frmModule:
        tglActionsClassees:CHECKED = (IF DonnePreference("PREF-ACTION-DEBUT-FIN") = "OUI" THEN TRUE ELSE FALSE).
        tglNomAction:CHECKED = (IF DonnePreference("PREF-ACTION-COMMENTAIRE-NOM") = "OUI" THEN TRUE ELSE FALSE).
        tglRetourDebut:CHECKED = (IF DonnePreference("PREF-ACTION-RETOUR-DEBUT") = "OUI" THEN TRUE ELSE FALSE).
        
        IF DonnePreference("PREF-REPERTOIRE-COMMENTAIRES") = "" THEN SauvePreference("PREF-REPERTOIRE-COMMENTAIRES",loc_log).        
        filRepertoireCommentaires:SCREEN-VALUE = DonnePreference("PREF-REPERTOIRE-COMMENTAIRES").
        
    END.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

