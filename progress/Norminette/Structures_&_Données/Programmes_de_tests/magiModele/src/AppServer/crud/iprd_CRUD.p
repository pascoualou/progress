/*------------------------------------------------------------------------
File        : iprd_CRUD.p
Purpose     : Librairie contenant les procedures li�es � la mise � jour de la table iprd
Author(s)   : generation automatique le 01/31/18
Notes       : permet de travailler sur un sous ensemble de colonnes de la table � condition
              que les champs de l'index unique soient tous pr�sents.
derniere revue: 2018/09/04
------------------------------------------------------------------------*/

{oerealm/include/instanciateTokenOnModel.i}      // Doit �tre positionn�e juste apr�s using
define variable ghttiprd as handle no-undo.      // le handle de la temp table � mettre � jour

function getIndexField returns logical private(phBuffer as handle, output phSoc-cd as handle, output phEtab-cd as handle, output phPrd-cd as handle, output phPrd-num as handle):
    /*------------------------------------------------------------------------------
    Purpose: r�cup�re les handles des n champs de l'index unique
    Notes: si la temp-table contient un mapping de label sur soc-cd/etab-cd/prd-cd/prd-num, 
           il faut mapper les champs dynamiques
    ------------------------------------------------------------------------------*/
    define variable vi as integer no-undo.
    do vi = 1 to phBuffer:num-fields:
        case phBuffer:buffer-field(vi):label:
            when 'soc-cd'  then phSoc-cd = phBuffer:buffer-field(vi).
            when 'etab-cd' then phEtab-cd = phBuffer:buffer-field(vi).
            when 'prd-cd'  then phPrd-cd = phBuffer:buffer-field(vi).
            when 'prd-num' then phPrd-num = phBuffer:buffer-field(vi).
       end case.
    end.
end function.

procedure crudIprd private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    run deleteIprd.
    run updateIprd.
    run createIprd.
end procedure.

procedure setIprd:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  : service externe
    ------------------------------------------------------------------------------*/
    define input parameter table-handle phttIprd.
    ghttIprd = phttIprd.
    run crudIprd.
    delete object phttIprd.
end procedure.

procedure readIprd:
    /*------------------------------------------------------------------------------
    Purpose: Lecture d'un enregistrement de la table iprd Liste des periodes pour un etablissement d'une societe.
    Notes  : service externe
    ------------------------------------------------------------------------------*/
    define input parameter piSoc-cd  as integer    no-undo.
    define input parameter piEtab-cd as integer    no-undo.
    define input parameter piPrd-cd  as integer    no-undo.
    define input parameter piPrd-num as integer    no-undo.
    define input parameter table-handle phttIprd.

    define variable vhttBuffer as handle no-undo.
    define buffer iprd for iprd.

    vhttBuffer = phttIprd:default-buffer-handle.
    for first iprd no-lock
        where iprd.soc-cd = piSoc-cd
          and iprd.etab-cd = piEtab-cd
          and iprd.prd-cd = piPrd-cd
          and iprd.prd-num = piPrd-num:
        vhttBuffer:buffer-create().
        outils:copyValidField(buffer iprd:handle, vhttBuffer).  // copy table physique vers temp-table
    end.
    delete object phttIprd no-error.
    assign error-status:error = false no-error.   // reset error-status
    return.                                       // reset return-value
end procedure.

procedure getIprd:
    /*------------------------------------------------------------------------------
    Purpose: Lecture des enregistrements de la table iprd Liste des periodes pour un etablissement d'une societe.
    Notes  : service externe. Crit�re piPrd-cd = ? si pas � prendre en compte
    ------------------------------------------------------------------------------*/
    define input parameter piSoc-cd  as integer    no-undo.
    define input parameter piEtab-cd as integer    no-undo.
    define input parameter piPrd-cd  as integer    no-undo.
    define input parameter table-handle phttIprd.

    define variable vhttBuffer as handle  no-undo.
    define buffer iprd for iprd.

    vhttBuffer = phttIprd:default-buffer-handle.
    if piPrd-cd = ?
    then for each iprd no-lock
        where iprd.soc-cd = piSoc-cd
          and iprd.etab-cd = piEtab-cd:
        vhttBuffer:buffer-create().
        outils:copyValidField(buffer iprd:handle, vhttBuffer).  // copy table physique vers temp-table
    end.
    else for each iprd no-lock
        where iprd.soc-cd = piSoc-cd
          and iprd.etab-cd = piEtab-cd
          and iprd.prd-cd = piPrd-cd:
        vhttBuffer:buffer-create().
        outils:copyValidField(buffer iprd:handle, vhttBuffer).  // copy table physique vers temp-table
    end.
    delete object phttIprd no-error.
    error-status:error = false no-error.   // reset error-status
    return.                                // reset return-value
end procedure.

procedure updateIprd private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    define variable vhttquery  as handle  no-undo.
    define variable vhttBuffer as handle  no-undo.
    define variable vhSoc-cd   as handle  no-undo.
    define variable vhEtab-cd  as handle  no-undo.
    define variable vhPrd-cd   as handle  no-undo.
    define variable vhPrd-num  as handle  no-undo.
    define buffer iprd for iprd.

    create query vhttquery.
    vhttBuffer = ghttIprd:default-buffer-handle.
    vhttquery:set-buffers(vhttBuffer).
    vhttquery:query-prepare(substitute("for each &1 where &1.crud = 'U'", ghttIprd:name)).
    vhttquery:query-open().
    getIndexField(vhttBuffer, output vhSoc-cd, output vhEtab-cd, output vhPrd-cd, output vhPrd-num).
blocTrans:
    do transaction:
        repeat:
            vhttquery:get-next().
            if vhttquery:query-off-end then leave blocTrans.

            find first iprd exclusive-lock
                where rowid(iprd) = vhttBuffer::rRowid no-wait no-error.
            if outils:isUpdated(buffer iprd:handle, 'soc-cd/etab-cd/prd-cd/prd-num: ', substitute('&1/&2/&3/&4', vhSoc-cd:buffer-value(), vhEtab-cd:buffer-value(), vhPrd-cd:buffer-value(), vhPrd-num:buffer-value()), vhttBuffer::dtTimestamp)
            or not outils:copyValidField(buffer iprd:handle, vhttBuffer, "U", mtoken:cUser)
            then undo blocTrans, leave blocTrans.
        end.
    end.
    vhttquery:query-close().
    delete object vhttQuery no-error.
    error-status:error = false no-error.   // reset error-status
    return.                                // reset return-value
end procedure.

procedure createIprd private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    define variable vhttquery  as handle   no-undo.
    define variable vhttBuffer as handle   no-undo.
    define buffer iprd for iprd.

    create query vhttquery.
    vhttBuffer = ghttIprd:default-buffer-handle.
    vhttquery:set-buffers(vhttBuffer).
    vhttquery:query-prepare(substitute("for each &1 where &1.crud = 'C'", ghttIprd:name)).
    vhttquery:query-open().
blocTrans:
    do transaction:
        repeat:
            vhttquery:get-next().
            if vhttquery:query-off-end then leave blocTrans.

            create iprd.
            if not outils:copyValidField(buffer iprd:handle, vhttBuffer, "C", mtoken:cUser)
            then undo blocTrans, leave blocTrans.
        end.
    end.
    vhttquery:query-close().
    delete object vhttQuery no-error.
    error-status:error = false no-error.   // reset error-status
    return.                                // reset return-value
end procedure.

procedure deleteIprd private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    define variable vhttquery  as handle  no-undo.
    define variable vhttBuffer as handle  no-undo.
    define variable vhSoc-cd   as handle  no-undo.
    define variable vhEtab-cd  as handle  no-undo.
    define variable vhPrd-cd   as handle  no-undo.
    define variable vhPrd-num  as handle  no-undo.
    define buffer iprd for iprd.

    create query vhttquery.
    vhttBuffer = ghttIprd:default-buffer-handle.
    vhttquery:set-buffers(vhttBuffer).
    vhttquery:query-prepare(substitute("for each &1 where &1.crud = 'D'", ghttIprd:name)).
    vhttquery:query-open().
    getIndexField(vhttBuffer, output vhSoc-cd, output vhEtab-cd, output vhPrd-cd, output vhPrd-num).
blocTrans:
    do transaction:
        repeat:
            vhttquery:get-next().
            if vhttquery:query-off-end then leave blocTrans.

            find first iprd exclusive-lock
                where rowid(Iprd) = vhttBuffer::rRowid no-wait no-error.
            if outils:isUpdated(buffer iprd:handle, 'soc-cd/etab-cd/prd-cd/prd-num: ', substitute('&1/&2/&3/&4', vhSoc-cd:buffer-value(), vhEtab-cd:buffer-value(), vhPrd-cd:buffer-value(), vhPrd-num:buffer-value()), vhttBuffer::dtTimestamp)
            then undo blocTrans, leave blocTrans.

            delete iprd no-error.
            if error-status:error then do:
                mError:createError({&error}, error-status:get-message(1)).
                undo blocTrans, leave blocTrans.
            end.
        end.
    end.
    vhttquery:query-close().
    delete object vhttQuery no-error.
    error-status:error = false no-error.   // reset error-status
    return.                                // reset return-value
end procedure.

procedure suppressionIprdParExercice:
    /*------------------------------------------------------------------------------
    Purpose: suppression de tous les enregistrements correspondant aux parametres de selection 
    Notes  : service externe
    ------------------------------------------------------------------------------*/
    define input parameter piSociete      as integer no-undo.
    define input parameter piCodeEtabl    as integer no-undo.
    define input parameter piCodeExercice as integer no-undo.

    define buffer iprd for iprd.
    define buffer ijouprd for ijouprd.

blocTrans:
    do transaction:
        for each iprd exclusive-lock
           where iprd.soc-cd  = piSociete
             and iprd.etab-cd = piCodeEtabl
             and (piCodeExercice = ? or iprd.prd-cd = piCodeExercice):
            if can-find(first ccptmvt no-lock
                        where ccptmvt.soc-cd  = iprd.soc-cd
                        and   ccptmvt.etab-cd = iprd.etab-cd
                        and   ccptmvt.prd-cd = iprd.prd-cd
                        and   ccptmvt.prd-num = iprd.prd-num) then do:
                mError:createError({&error}, substitute("La p�riode du &1 au &2 ne peut pas �tre modifi�e car elle est mouvement�e", iprd.dadebprd, iprd.dafinprd)).
                undo blocTrans, leave blocTrans.
            end.
            for each ijouprd exclusive-lock
                where ijouprd.soc-cd = iprd.soc-cd
                and   ijouprd.etab-cd = iprd.etab-cd
                and   ijouprd.jou-cd = ijou.jou-cd
                and   ijouprd.prd-cd = iprd.prd-cd
                and   ijouprd.prd-num = iprd.prd-num:
                delete ijouprd no-error.
            end.
            delete iprd no-error.
            if error-status:error then do:
                mError:createError({&error}, error-status:get-message(1)).
                undo blocTrans, leave blocTrans.
            end.
        end.
    end.
    error-status:error = false no-error.  // reset error-status

end procedure.

procedure suppressionIprdParDate:
    /*------------------------------------------------------------------------------
    Purpose: suppression de tous les enregistrements correspondant aux parametres de selection 
    Notes  : service externe
    ------------------------------------------------------------------------------*/
    define input parameter piSociete      as integer no-undo.
    define input parameter piCodeEtabl    as integer no-undo.
    define input parameter pdaDebut       as date    no-undo.
    define input parameter pdaFin         as date    no-undo.

    define buffer iprd for iprd.
    define buffer ijouprd for ijouprd.

blocTrans:
    do transaction:
        for each iprd exclusive-lock
           where iprd.soc-cd  = piSociete
             and iprd.etab-cd = piCodeEtabl
             and iprd.dadebprd >= pdaDebut
             and iprd.dadebprd <= pdaFin:
            if can-find(first ccptmvt no-lock
                        where ccptmvt.soc-cd  = iprd.soc-cd
                        and   ccptmvt.etab-cd = iprd.etab-cd
                        and   ccptmvt.prd-cd = iprd.prd-cd
                        and   ccptmvt.prd-num = iprd.prd-num) then do:
                mError:createError({&error}, substitute("La p�riode du &1 au &2 ne peut pas �tre modifi�e car elle est mouvement�e", iprd.dadebprd, iprd.dafinprd)).
                undo blocTrans, leave blocTrans.
            end.
            for each ijouprd exclusive-lock
                where ijouprd.soc-cd = iprd.soc-cd
                and   ijouprd.etab-cd = iprd.etab-cd
                and   ijouprd.jou-cd = ijou.jou-cd
                and   ijouprd.prd-cd = iprd.prd-cd
                and   ijouprd.prd-num = iprd.prd-num:
                delete ijouprd no-error.
            end.
            delete iprd no-error.
            if error-status:error then do:
                mError:createError({&error}, error-status:get-message(1)).
                undo blocTrans, leave blocTrans.
            end.
        end.
    end.
    error-status:error = false no-error.  // reset error-status

end procedure.

procedure creationNouvellesPeriodes:
    /*------------------------------------------------------------------------------
    Purpose: Cr�ation de nouvelles p�riodes dans un exercice comptable
    Notes  : service externe
    ------------------------------------------------------------------------------*/
    define input parameter piSociete      as integer no-undo.
    define input parameter piCodeEtabl    as integer no-undo.
    define input parameter piNumeroExercice as integer  no-undo.
    define input parameter pdaDebut       as date    no-undo.
    define input parameter pdaFin         as date    no-undo.

    define variable viNumeroPeriode as integer no-undo.
    define variable viCompteur      as integer no-undo.
    define variable vdaDebutPeriode as date    no-undo.

blocTrans:
    do transaction:
        vdaDebutPeriode = pdaDebut.
        for last iprd no-lock
            where iprd.soc-cd  = piSociete
            and   iprd.etab-cd = piCodeEtabl
            and   iprd.prd-cd = piNumeroExercice:
            viNumeroPeriode = iprd.prd-num.
        end.
        do viCompteur = 1 to interval(pdaFin, pdaDebut, "month") + 1:
            viNumeroPeriode = viNumeroPeriode + 1.
            run creationPeriode(piSociete, piCodeEtabl, piNumeroExercice, viNumeroPeriode, vdaDebutPeriode).
            vdaDebutPeriode = add-interval(vdaDebutPeriode, 1, "month").
        end.
    end.
    error-status:error = false no-error.  // reset error-status

end procedure.

procedure creationNouvelExercice:
    /*------------------------------------------------------------------------------
    Purpose:  
    Notes  : service externe
    ------------------------------------------------------------------------------*/
    define input parameter piSociete        as integer  no-undo.
    define input parameter piCodeEtabl      as integer  no-undo.
    define input parameter pdaDebutExercice as date     no-undo.
    define input parameter pdaFinExercice   as date     no-undo.
    define input parameter piNumeroExercice as integer  no-undo.

    define variable viNumeroPeriode as integer no-undo.
    define variable viCompteur      as integer no-undo.
    define variable vdaDebutPeriode as date    no-undo.

    define buffer isoc for isoc.
    define buffer iprd for iprd.

blocTrans:
    do transaction:
        for each isoc no-lock
            where isoc.soc-cd  = piSociete:
            //R�f�rence ADB
            if isoc.specif-cle = 1000 then do:
                //Si pas de num�ro d'exercice en entr�e, on prend le derier + 1
                if piNumeroExercice = ? then
                for last iprd no-lock
                    where iprd.soc-cd  = piSociete
                    and   iprd.etab-cd = piCodeEtabl:
                    piNumeroExercice = iprd.prd-cd + 1.
                end.
                if piNumeroExercice = ? then piNumeroExercice = 5. //On commence � 5 pour garder de la marge afin de pouvoir cr�er ult�rieurement des exercices ant�rieurs
                vdaDebutPeriode = pdaDebutExercice.
                do viCompteur = 1 to interval(pdaFinExercice, pdaDebutExercice, "month") + 1:
                    viNumeroPeriode = viNumeroPeriode + 1.
                    run creationPeriode(piSociete, piCodeEtabl, piNumeroExercice, viNumeroPeriode, vdaDebutPeriode).
                    vdaDebutPeriode = add-interval(vdaDebutPeriode, 1, "month").
                end.
             end.
             //Soci�t� "PME"
             else do:
             end.
        end.
        
    end.
    error-status:error = false no-error.  // reset error-status

end procedure.

procedure creationPeriode private:
    /*------------------------------------------------------------------------------
    Purpose: Cr�ation iprd et ijouprd 
    Notes  : 
    ------------------------------------------------------------------------------*/

    define input parameter piSociete        as integer  no-undo.
    define input parameter piCodeEtabl      as integer  no-undo.
    define input parameter piNumeroExercice as integer  no-undo.
    define input parameter piNumeroPeriode  as integer  no-undo.
    define input parameter pdaDebutPeriode  as date     no-undo.

    define buffer iprd for iprd.
    define buffer ijou for ijou.
    define buffer ijouprd for ijouprd.

    if not can-find(first iprd no-lock
                    where iprd.soc-cd  = piSociete
                    and   iprd.etab-cd = piCodeEtabl
                    and   iprd.prd-cd  = piNumeroExercice
                    and   iprd.prd-num = piNumeroPeriode)
        and not can-find(first iprd no-lock
                         where iprd.soc-cd  = piSociete
                         and   iprd.etab-cd = piCodeEtabl
                         and   iprd.dadebprd = pdaDebutPeriode)
    then do:
        create iprd.
        assign  
            iprd.soc-cd     = piSociete
            iprd.etab-cd    = piCodeEtabl
            iprd.prd-cd     = piNumeroExercice
            iprd.prd-num    = piNumeroPeriode
            iprd.dadebprd   = pdaDebutPeriode
            iprd.dafinprd   = add-interval(pdaDebutPeriode, 1, "month") - 1
            iprd.val        = true
            iprd.mvt        = false
            iprd.dispo      = 0
            .

       for each ijou no-lock
           where ijou.soc-cd = piSociete
           and   ijou.etab-cd = piCodeEtabl:
           if not can-find(first ijouprd no-lock
                           where ijouprd.soc-cd = iprd.soc-cd
                           and   ijouprd.etab-cd = iprd.etab-cd
                           and   ijouprd.jou-cd = ijou.jou-cd
                           and   ijouprd.prd-cd = iprd.prd-cd
                           and   ijouprd.prd-num = iprd.prd-num)
           then do:
               create ijouprd.
               assign
                   ijouprd.soc-cd  = iprd.soc-cd 
                   ijouprd.etab-cd = iprd.etab-cd 
                   ijouprd.jou-cd  = ijou.jou-cd 
                   ijouprd.prd-cd  = iprd.prd-cd
                   ijouprd.prd-num = iprd.prd-num
                   ijouprd.statut  = "O".
           end.
       end.
    end.

end procedure.