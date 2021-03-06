/*------------------------------------------------------------------------
File        : cinech_CRUD.p
Purpose     : Librairie contenant les procedures li�es � la mise � jour de la table cinech
Author(s)   : generation automatique le 01/31/18
Notes       : permet de travailler sur un sous ensemble de colonnes de la table � condition
              que les champs de l'index unique soient tous pr�sents.
------------------------------------------------------------------------*/

{oerealm/include/instanciateTokenOnModel.i}      // Doit �tre positionn�e juste apr�s using
//{include/cinech.i}
{application/include/error.i}
define variable ghttcinech as handle no-undo.      // le handle de la temp table � mettre � jour


function getIndexField returns logical private(phBuffer as handle, output phSoc-cd as handle, output phEtab-cd as handle, output phType-invest as handle, output phNum-int as handle, output phOrder-num as handle, output phMat-num as handle, output phProjection as handle):
    /*------------------------------------------------------------------------------
    Purpose: r�cup�re les handles des n champs de l'index unique
    Notes: si la temp-table contient un mapping de label sur soc-cd/etab-cd/type-invest/num-int/order-num/mat-num/projection, 
           il faut mapper les champs dynamiques
    ------------------------------------------------------------------------------*/
    define variable vi as integer no-undo.
    do vi = 1 to phBuffer:num-fields:
        case phBuffer:buffer-field(vi):label:
            when 'soc-cd' then phSoc-cd = phBuffer:buffer-field(vi).
            when 'etab-cd' then phEtab-cd = phBuffer:buffer-field(vi).
            when 'type-invest' then phType-invest = phBuffer:buffer-field(vi).
            when 'num-int' then phNum-int = phBuffer:buffer-field(vi).
            when 'order-num' then phOrder-num = phBuffer:buffer-field(vi).
            when 'mat-num' then phMat-num = phBuffer:buffer-field(vi).
            when 'projection' then phProjection = phBuffer:buffer-field(vi).
       end case.
    end.
end function.

procedure crudCinech private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    run deleteCinech.
    run updateCinech.
    run createCinech.
end procedure.

procedure setCinech:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  : service externe
    ------------------------------------------------------------------------------*/
    define input parameter table-handle phttCinech.
    ghttCinech = phttCinech.
    run crudCinech.
    delete object phttCinech.
end procedure.

procedure readCinech:
    /*------------------------------------------------------------------------------
    Purpose: Lecture d'un enregistrement de la table cinech detail amortissements
    Notes  : service externe
    ------------------------------------------------------------------------------*/
    define input parameter piSoc-cd      as integer    no-undo.
    define input parameter piEtab-cd     as integer    no-undo.
    define input parameter piType-invest as integer    no-undo.
    define input parameter piNum-int     as integer    no-undo.
    define input parameter piOrder-num   as integer    no-undo.
    define input parameter pcMat-num     as character  no-undo.
    define input parameter plProjection  as logical    no-undo.
    define input parameter table-handle phttCinech.
    define variable vhttBuffer as handle no-undo.
    define buffer cinech for cinech.

    vhttBuffer = phttCinech:default-buffer-handle.
    for first cinech no-lock
        where cinech.soc-cd = piSoc-cd
          and cinech.etab-cd = piEtab-cd
          and cinech.type-invest = piType-invest
          and cinech.num-int = piNum-int
          and cinech.order-num = piOrder-num
          and cinech.mat-num = pcMat-num
          and cinech.projection = plProjection:
        vhttBuffer:buffer-create().
        outils:copyValidField(buffer cinech:handle, vhttBuffer).  // copy table physique vers temp-table
    end.
    delete object phttCinech no-error.
    assign error-status:error = false no-error.   // reset error-status
    return.                                       // reset return-value
end procedure.

procedure getCinech:
    /*------------------------------------------------------------------------------
    Purpose: Lecture des enregistrements de la table cinech detail amortissements
    Notes  : service externe. Crit�re pcMat-num = ? si pas � prendre en compte
    ------------------------------------------------------------------------------*/
    define input parameter piSoc-cd      as integer    no-undo.
    define input parameter piEtab-cd     as integer    no-undo.
    define input parameter piType-invest as integer    no-undo.
    define input parameter piNum-int     as integer    no-undo.
    define input parameter piOrder-num   as integer    no-undo.
    define input parameter pcMat-num     as character  no-undo.
    define input parameter table-handle phttCinech.
    define variable vhttBuffer as handle  no-undo.
    define buffer cinech for cinech.

    vhttBuffer = phttCinech:default-buffer-handle.
    if pcMat-num = ?
    then for each cinech no-lock
        where cinech.soc-cd = piSoc-cd
          and cinech.etab-cd = piEtab-cd
          and cinech.type-invest = piType-invest
          and cinech.num-int = piNum-int
          and cinech.order-num = piOrder-num:
        vhttBuffer:buffer-create().
        outils:copyValidField(buffer cinech:handle, vhttBuffer).  // copy table physique vers temp-table
    end.
    else for each cinech no-lock
        where cinech.soc-cd = piSoc-cd
          and cinech.etab-cd = piEtab-cd
          and cinech.type-invest = piType-invest
          and cinech.num-int = piNum-int
          and cinech.order-num = piOrder-num
          and cinech.mat-num = pcMat-num:
        vhttBuffer:buffer-create().
        outils:copyValidField(buffer cinech:handle, vhttBuffer).  // copy table physique vers temp-table
    end.
    delete object phttCinech no-error.
    error-status:error = false no-error.   // reset error-status
    return.                                // reset return-value
end procedure.

procedure updateCinech private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    define variable vhttquery  as handle   no-undo.
    define variable vhttBuffer as handle   no-undo.
    define variable vhSoc-cd    as handle  no-undo.
    define variable vhEtab-cd    as handle  no-undo.
    define variable vhType-invest    as handle  no-undo.
    define variable vhNum-int    as handle  no-undo.
    define variable vhOrder-num    as handle  no-undo.
    define variable vhMat-num    as handle  no-undo.
    define variable vhProjection    as handle  no-undo.
    define buffer cinech for cinech.

    create query vhttquery.
    vhttBuffer = ghttCinech:default-buffer-handle.
    vhttquery:set-buffers(vhttBuffer).
    vhttquery:query-prepare(substitute("for each &1 where &1.crud = 'U'", ghttCinech:name)).
    vhttquery:query-open().
    getIndexField(vhttBuffer, output vhSoc-cd, output vhEtab-cd, output vhType-invest, output vhNum-int, output vhOrder-num, output vhMat-num, output vhProjection).
blocTrans:
    do transaction:
        repeat:
            vhttquery:get-next().
            if vhttquery:query-off-end then leave blocTrans.

            find first cinech exclusive-lock
                where rowid(cinech) = vhttBuffer::rRowid no-wait no-error.
            if outils:isUpdated(buffer cinech:handle, 'soc-cd/etab-cd/type-invest/num-int/order-num/mat-num/projection: ', substitute('&1/&2/&3/&4/&5/&6/&7', vhSoc-cd:buffer-value(), vhEtab-cd:buffer-value(), vhType-invest:buffer-value(), vhNum-int:buffer-value(), vhOrder-num:buffer-value(), vhMat-num:buffer-value(), vhProjection:buffer-value()), vhttBuffer::dtTimestamp)
            or not outils:copyValidField(buffer cinech:handle, vhttBuffer, "U", mtoken:cUser)
            then undo blocTrans, leave blocTrans.
        end.
    end.
    vhttquery:query-close().
    delete object vhttQuery no-error.
    error-status:error = false no-error.   // reset error-status
    return.                                // reset return-value
end procedure.

procedure createCinech private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    define variable vhttquery  as handle   no-undo.
    define variable vhttBuffer as handle   no-undo.
    define buffer cinech for cinech.

    create query vhttquery.
    vhttBuffer = ghttCinech:default-buffer-handle.
    vhttquery:set-buffers(vhttBuffer).
    vhttquery:query-prepare(substitute("for each &1 where &1.crud = 'C'", ghttCinech:name)).
    vhttquery:query-open().
blocTrans:
    do transaction:
        repeat:
            vhttquery:get-next().
            if vhttquery:query-off-end then leave blocTrans.

            create cinech.
            if not outils:copyValidField(buffer cinech:handle, vhttBuffer, "C", mtoken:cUser)
            then undo blocTrans, leave blocTrans.
        end.
    end.
    vhttquery:query-close().
    delete object vhttQuery no-error.
    error-status:error = false no-error.   // reset error-status
    return.                                // reset return-value
end procedure.

procedure deleteCinech private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    define variable vhttquery  as handle   no-undo.
    define variable vhttBuffer as handle   no-undo.
    define variable vhSoc-cd    as handle  no-undo.
    define variable vhEtab-cd    as handle  no-undo.
    define variable vhType-invest    as handle  no-undo.
    define variable vhNum-int    as handle  no-undo.
    define variable vhOrder-num    as handle  no-undo.
    define variable vhMat-num    as handle  no-undo.
    define variable vhProjection    as handle  no-undo.
    define buffer cinech for cinech.

    create query vhttquery.
    vhttBuffer = ghttCinech:default-buffer-handle.
    vhttquery:set-buffers(vhttBuffer).
    vhttquery:query-prepare(substitute("for each &1 where &1.crud = 'D'", ghttCinech:name)).
    vhttquery:query-open().
    getIndexField(vhttBuffer, output vhSoc-cd, output vhEtab-cd, output vhType-invest, output vhNum-int, output vhOrder-num, output vhMat-num, output vhProjection).
blocTrans:
    do transaction:
        repeat:
            vhttquery:get-next().
            if vhttquery:query-off-end then leave blocTrans.

            find first cinech exclusive-lock
                where rowid(Cinech) = vhttBuffer::rRowid no-wait no-error.
            if outils:isUpdated(buffer cinech:handle, 'soc-cd/etab-cd/type-invest/num-int/order-num/mat-num/projection: ', substitute('&1/&2/&3/&4/&5/&6/&7', vhSoc-cd:buffer-value(), vhEtab-cd:buffer-value(), vhType-invest:buffer-value(), vhNum-int:buffer-value(), vhOrder-num:buffer-value(), vhMat-num:buffer-value(), vhProjection:buffer-value()), vhttBuffer::dtTimestamp)
            then undo blocTrans, leave blocTrans.

            delete cinech no-error.
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

