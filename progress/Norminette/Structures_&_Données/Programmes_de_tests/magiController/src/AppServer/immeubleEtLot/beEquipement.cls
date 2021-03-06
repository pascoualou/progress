/*------------------------------------------------------------------------
File        : beEquipement
Syntax      : 
Author(s)   : devweb1  -  2017/07/11
Notes       : 
derniere revue: 2018/05/25 - phm: OK
------------------------------------------------------------------------*/
@program FILE(name="beEquipement.cls", module="AppServer").
@openapi.openedge.export FILE(type="REST", executionMode="singleton", useReturnValue="false", writeDataSetBeforeImage="false").
@progress.service.resource FILE(name="beEquipement", URI="/beEquipement", schemaName="dsbeEquipement", schemaFile="").

using outils.outilHandle.
using outils.collection.

block-level on error undo, throw.

class immeubleEtLot.beEquipement:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes:
    ------------------------------------------------------------------------------*/
    define private property goCollection as class collection no-undo private get. private set.
    define public  property selfDestroy  as logical no-undo initial true private get. public set.

    {immeubleEtLot/include/equipementBien.i}
    {application/include/error.i}
    define dataset dsbeEquipement for ttEquipement, ttError.

    constructor public beEquipement():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/        
        goCollection = new collection().
    end constructor.
        
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="read", URI="?filter=~{filter~}", alias="", mediaType="application/json"). 
    method public void ReadbeEquipement(pcFiltre as longchar, output dataset dsbeEquipement):
        /*------------------------------------------------------------------------------
        Purpose: Get one or more records, based on a filter string
        Notes:
        ------------------------------------------------------------------------------*/
        define variable vhttFilter       as handle    no-undo.
        define variable vhBuffer         as handle    no-undo.
        define variable vcTypeEquipement as character no-undo.
        define variable vhProcEquipement as handle    no-undo.

        create temp-table vhttFilter.
        vhttFilter:read-json("LONGCHAR", pcFiltre, "empty") no-error. // il faut le no-error, mais error-status:error = false !!!
        vhBuffer = vhttFilter:default-buffer-handle no-error.
        if valid-handle(vhBuffer) then do:
            vhBuffer:find-first() no-error.
            if vhBuffer:available then do:
                vcTypeEquipement = vhBuffer::cTypeEquipement no-error.
            end.
        end.
        delete object vhttFilter no-error.

        vhProcEquipement = outilHandle:connectMaGIModele("immeubleEtLot/equipementBien.p").
        case vcTypeEquipement:
            when "IMMEUBLE" then run getTypeEquipementImmeuble in vhProcEquipement(output table ttEquipement). 
            when "LOT"      then run getTypeEquipementLot      in vhProcEquipement(output table ttEquipement).
        end case.        
        run getErrors in vhProcEquipement(output table ttError).
        {outils/include/tryCatch.i}
    end method.

    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="create", URI="", alias="", mediaType="application/json").
    method public void CreatebeEquipement(input-output dataset dsbeEquipement):
        /*------------------------------------------------------------------------------
        Purpose: Create one or more new records
        Notes:
        ------------------------------------------------------------------------------*/  
    end method.

    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="update", URI="", alias="", mediaType="application/json").
    method public void UpdatebeEquipement(input-output dataset dsbeEquipement):
        /*------------------------------------------------------------------------------
        Purpose:  Update one or more records
        Notes:
        ------------------------------------------------------------------------------*/
    end method.

    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="true").
    @progress.service.resourceMapping(type="REST", operation="delete", URI="", alias="", mediaType="application/json").
    method public void DeletebeEquipement(input-output dataset dsbeEquipement):
        /*------------------------------------------------------------------------------
        Purpose: Delete a record
        Notes:
        ------------------------------------------------------------------------------*/
    end method.
 
    destructor public beEquipement ( ):
        /*------------------------------------------------------------------------------
        Purpose:
        Notes  :
        ------------------------------------------------------------------------------*/
        outilHandle:deleteHandle().
    end destructor. 
end class.
