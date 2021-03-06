/*------------------------------------------------------------------------
File        : atass_CRUD.p
Purpose     : Librairie contenant les procedures li�es � la mise � jour de la table atass
Author(s)   : generation automatique le 01/31/18
Notes       : permet de travailler sur un sous ensemble de colonnes de la table � condition
              que les champs de l'index unique soient tous pr�sents.
------------------------------------------------------------------------*/

{oerealm/include/instanciateTokenOnModel.i}      // Doit �tre positionn�e juste apr�s using
//{include/atass.i}
{application/include/error.i}
define variable ghttatass as handle no-undo.      // le handle de la temp table � mettre � jour


function getIndexField returns logical private(phBuffer as handle, output phTprol as handle, output phNorol as handle, output phNoatt as handle):
    /*------------------------------------------------------------------------------
    Purpose: r�cup�re les handles des n champs de l'index unique
    Notes: si la temp-table contient un mapping de label sur TpRol/Norol/NoAtt, 
           il faut mapper les champs dynamiques
    ------------------------------------------------------------------------------*/
    define variable vi as integer no-undo.
    do vi = 1 to phBuffer:num-fields:
        case phBuffer:buffer-field(vi):label:
            when 'TpRol' then phTprol = phBuffer:buffer-field(vi).
            when 'Norol' then phNorol = phBuffer:buffer-field(vi).
            when 'NoAtt' then phNoatt = phBuffer:buffer-field(vi).
       end case.
    end.
end function.

procedure crudAtass private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    run deleteAtass.
    run updateAtass.
    run createAtass.
end procedure.

procedure setAtass:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  : service externe
    ------------------------------------------------------------------------------*/
    define input parameter table-handle phttAtass.
    ghttAtass = phttAtass.
    run crudAtass.
    delete object phttAtass.
end procedure.

procedure readAtass:
    /*------------------------------------------------------------------------------
    Purpose: Lecture d'un enregistrement de la table atass Table pour l'�dition de l'attestation ASSEDIC
    Notes  : service externe
    ------------------------------------------------------------------------------*/
    define input parameter pcTprol as character  no-undo.
    define input parameter piNorol as int64      no-undo.
    define input parameter piNoatt as integer    no-undo.
    define input parameter table-handle phttAtass.
    define variable vhttBuffer as handle no-undo.
    define buffer atass for atass.

    vhttBuffer = phttAtass:default-buffer-handle.
    for first atass no-lock
        where atass.TpRol = pcTprol
          and atass.Norol = piNorol
          and atass.NoAtt = piNoatt:
        vhttBuffer:buffer-create().
        outils:copyValidField(buffer atass:handle, vhttBuffer).  // copy table physique vers temp-table
    end.
    delete object phttAtass no-error.
    assign error-status:error = false no-error.   // reset error-status
    return.                                       // reset return-value
end procedure.

procedure getAtass:
    /*------------------------------------------------------------------------------
    Purpose: Lecture des enregistrements de la table atass Table pour l'�dition de l'attestation ASSEDIC
    Notes  : service externe. Crit�re piNorol = ? si pas � prendre en compte
    ------------------------------------------------------------------------------*/
    define input parameter pcTprol as character  no-undo.
    define input parameter piNorol as int64      no-undo.
    define input parameter table-handle phttAtass.
    define variable vhttBuffer as handle  no-undo.
    define buffer atass for atass.

    vhttBuffer = phttAtass:default-buffer-handle.
    if piNorol = ?
    then for each atass no-lock
        where atass.TpRol = pcTprol:
        vhttBuffer:buffer-create().
        outils:copyValidField(buffer atass:handle, vhttBuffer).  // copy table physique vers temp-table
    end.
    else for each atass no-lock
        where atass.TpRol = pcTprol
          and atass.Norol = piNorol:
        vhttBuffer:buffer-create().
        outils:copyValidField(buffer atass:handle, vhttBuffer).  // copy table physique vers temp-table
    end.
    delete object phttAtass no-error.
    error-status:error = false no-error.   // reset error-status
    return.                                // reset return-value
end procedure.

procedure updateAtass private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    define variable vhttquery  as handle   no-undo.
    define variable vhttBuffer as handle   no-undo.
    define variable vhTprol    as handle  no-undo.
    define variable vhNorol    as handle  no-undo.
    define variable vhNoatt    as handle  no-undo.
    define buffer atass for atass.

    create query vhttquery.
    vhttBuffer = ghttAtass:default-buffer-handle.
    vhttquery:set-buffers(vhttBuffer).
    vhttquery:query-prepare(substitute("for each &1 where &1.crud = 'U'", ghttAtass:name)).
    vhttquery:query-open().
    getIndexField(vhttBuffer, output vhTprol, output vhNorol, output vhNoatt).
blocTrans:
    do transaction:
        repeat:
            vhttquery:get-next().
            if vhttquery:query-off-end then leave blocTrans.

            find first atass exclusive-lock
                where rowid(atass) = vhttBuffer::rRowid no-wait no-error.
            if outils:isUpdated(buffer atass:handle, 'TpRol/Norol/NoAtt: ', substitute('&1/&2/&3', vhTprol:buffer-value(), vhNorol:buffer-value(), vhNoatt:buffer-value()), vhttBuffer::dtTimestamp)
            or not outils:copyValidField(buffer atass:handle, vhttBuffer, "U", mtoken:cUser)
            then undo blocTrans, leave blocTrans.
        end.
    end.
    vhttquery:query-close().
    delete object vhttQuery no-error.
    error-status:error = false no-error.   // reset error-status
    return.                                // reset return-value
end procedure.

procedure createAtass private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    define variable vhttquery  as handle   no-undo.
    define variable vhttBuffer as handle   no-undo.
    define buffer atass for atass.

    create query vhttquery.
    vhttBuffer = ghttAtass:default-buffer-handle.
    vhttquery:set-buffers(vhttBuffer).
    vhttquery:query-prepare(substitute("for each &1 where &1.crud = 'C'", ghttAtass:name)).
    vhttquery:query-open().
blocTrans:
    do transaction:
        repeat:
            vhttquery:get-next().
            if vhttquery:query-off-end then leave blocTrans.

            create atass.
            if not outils:copyValidField(buffer atass:handle, vhttBuffer, "C", mtoken:cUser)
            then undo blocTrans, leave blocTrans.
        end.
    end.
    vhttquery:query-close().
    delete object vhttQuery no-error.
    error-status:error = false no-error.   // reset error-status
    return.                                // reset return-value
end procedure.

procedure deleteAtass private:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
    define variable vhttquery  as handle   no-undo.
    define variable vhttBuffer as handle   no-undo.
    define variable vhTprol    as handle  no-undo.
    define variable vhNorol    as handle  no-undo.
    define variable vhNoatt    as handle  no-undo.
    define buffer atass for atass.

    create query vhttquery.
    vhttBuffer = ghttAtass:default-buffer-handle.
    vhttquery:set-buffers(vhttBuffer).
    vhttquery:query-prepare(substitute("for each &1 where &1.crud = 'D'", ghttAtass:name)).
    vhttquery:query-open().
    getIndexField(vhttBuffer, output vhTprol, output vhNorol, output vhNoatt).
blocTrans:
    do transaction:
        repeat:
            vhttquery:get-next().
            if vhttquery:query-off-end then leave blocTrans.

            find first atass exclusive-lock
                where rowid(Atass) = vhttBuffer::rRowid no-wait no-error.
            if outils:isUpdated(buffer atass:handle, 'TpRol/Norol/NoAtt: ', substitute('&1/&2/&3', vhTprol:buffer-value(), vhNorol:buffer-value(), vhNoatt:buffer-value()), vhttBuffer::dtTimestamp)
            then undo blocTrans, leave blocTrans.

            delete atass no-error.
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

