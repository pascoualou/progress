/*------------------------------------------------------------------------
File        : parametrageChargeLocative.cls
Description : 
Author(s)   : gga  -  2017/12/21
Notes       : 
------------------------------------------------------------------------*/

block-level on error undo, throw.

class parametre.pclie.parametrageChargeLocative inherits parametre.pclie.pclie:
	/*------------------------------------------------------------------------------
	Purpose:
	Notes:
    ------------------------------------------------------------------------------*/
    constructor public parametrageChargeLocative():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes: 
        ------------------------------------------------------------------------------*/
        super("TRCHL").
    end constructor.
    method public character getCodeCritereExtractionPeriodeChargeLocative():
        /*------------------------------------------------------------------------------
        Purpose: Crit�res d'extraction des p�riodes de charges locatives en demande de tirage
        Notes  : code associ� au param�tre sys_pr TRCHL
        ------------------------------------------------------------------------------*/
        return if this-object:zon01 > "" then trim(this-object:zon01) else "00001".     // par d�faut limit�e aux p�riodes compl�tement termin�es
    end method.        
    method public character getCodeCritereExtractionRubriqueChargeLocative():
        /*------------------------------------------------------------------------------
        Purpose: Crit�res d'extraction des rubriques de provisions/consommations quittanc�es
        Notes  : code associ� au param�tre sys_pr TRCH2
        ------------------------------------------------------------------------------*/
        return if this-object:zon02 > "" then trim(this-object:zon02) else "00001".     // par d�faut Quittances dont les dates sont incluses dans la p�riode de charges (Standard)
    end method.    
    method public character getPresentationChargeLocative ():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        return zon03.
    end method.
    method public logical IsChargeLocativeSurULVacante():
        /*------------------------------------------------------------------------------
        Purpose: Gestion des charges locatives sur UL vacantes (= bail de rang 00 nature "03094")
        Notes  : 
        ------------------------------------------------------------------------------*/
        return this-object:zon07 = "00001".
    end method.    
    method public character getPresentationEtatDepense ():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        return zon08.
    end method.

end class.
