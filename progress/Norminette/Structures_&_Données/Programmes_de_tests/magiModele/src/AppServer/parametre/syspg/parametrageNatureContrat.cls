/*------------------------------------------------------------------------
File        : parametrageNatureContrat.cls
Purpose     : 
Author(s)   : GGA  -  2017/11/08
Notes       : 
------------------------------------------------------------------------*/

using outils.outilTraduction.

block-level on error undo, throw.

class parametre.syspg.parametrageNatureContrat inherits parametre.syspg.syspg:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes:
    ------------------------------------------------------------------------------*/
    {application/include/combo.i}
    {preprocesseur/nature2contrat.i}

    constructor public parametrageNatureContrat(pcNatureContrat as character):
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        reloadUnique("O_COT", pcNatureContrat).
    end constructor.

    method public logical typeFL ():
        /*------------------------------------------------------------------------------
         Purpose: Retourne si la t�che est de type FL
                  Retourne vrai si la nature du contrat est de type FL (Fournisseur Loyer 
                  = Mandat Location avec ou sans indivision + d�l�gu�) 
                  
                  a partir de adb/comm/isgesflo.i
         Notes  : Pour �viter de modifier 50 programmes � chaque ajout d'une nature de contrat,
                  utilisation de zone7 de sys_pg. */ /* PL 14/06/2012 (0212/0155) 
                  Mais je garde l'ancien test pour le cas ou le param�trage ne serait pas � jour
        ------------------------------------------------------------------------------*/
        
        if this-object:cdpar = {&NATURECONTRAT-mandatLocation} 
        or this-object:cdpar = {&NATURECONTRAT-mandatLocationIndivision} 
        or this-object:cdpar = {&NATURECONTRAT-mandatLocationDelegue} 
        then return true.
 
        if entry(1, this-object:zone7, "@") = "FL"
        then return true.
        
        return false.
    
    end method.

end class.
