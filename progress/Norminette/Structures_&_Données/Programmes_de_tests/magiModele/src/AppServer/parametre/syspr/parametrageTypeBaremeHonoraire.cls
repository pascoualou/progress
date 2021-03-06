/*------------------------------------------------------------------------
File        : parametrageTypeBaremeHonoraire.cls
Purpose     : 
Author(s)   : kantena  -  2017/11/08
Notes       : 
------------------------------------------------------------------------*/

using outils.outilTraduction.

block-level on error undo, throw.

class parametre.syspr.parametrageTypeBaremeHonoraire inherits parametre.syspr.syspr:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes:
    ------------------------------------------------------------------------------*/
    {application/include/combo.i}

    constructor public parametrageTypeBaremeHonoraire():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        assign
            this-object:tppar     = "GLTHO"
            this-object:cNomCombo = "CMBTYPEBAREMEHON"
        .
    end constructor.

    method public void getComboTypeBaremeHonoraire(pcReference as character, output table ttCombo):
        /*------------------------------------------------------------------------------
         Purpose:
         Notes  : todo - remplacer pclie par parametrageNaturePiece (� cr�er �ventuellement)
        ------------------------------------------------------------------------------*/
        define buffer sys_pr for sys_pr.
        define variable viNumeroItem as integer no-undo.
        for each sys_pr no-lock
            where sys_pr.tppar = this-object:tppar
              and not (sys_pr.zone2 > "" and pcReference > "" and lookup(pcReference, sys_pr.zone2) = 0):    // item r�serv� � une liste de r�f�rence (ex : BNP REIM sp�cifique DAUCHEZ)
            create ttCombo.
            assign 
                viNumeroItem      = viNumeroItem + 1
                ttcombo.iSeqId    = viNumeroItem            
                ttCombo.cNomCombo = this-object:cNomCombo
                ttCombo.cCode     = sys_pr.cdpar
                ttCombo.cLibelle  = outilTraduction:getLibelle(sys_pr.nome1)
            .
        end.
    end method.
end class.
