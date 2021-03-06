/*------------------------------------------------------------------------
File        : parametrageDossierMandat.cls
Description : 
Author(s)   : kantena  -  2017/09/29
Notes       : 
------------------------------------------------------------------------*/

block-level on error undo, throw.

class parametre.pclie.parametrageDossierMandat inherits parametre.pclie.pclie:
	/*------------------------------------------------------------------------------
	Purpose:
	Notes:
    ------------------------------------------------------------------------------*/

    constructor public parametrageDossierMandat():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        super("DOMDT").

    end constructor.

    method public int64 nombrePiece():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        return this-object:Int01.

    end method.

    method public character pieceObligatoire():
        /*------------------------------------------------------------------------------
        Purpose: renvoie une liste des flags "pi�ce obligatoire" avec s�parateur
        Notes:
        ------------------------------------------------------------------------------*/
        return this-object:zon04.

    end method.

    method public character listePiece():
        /*------------------------------------------------------------------------------
        Purpose: renvoie une liste des num�ros de pi�ces avec s�parateur
        Notes:
        ------------------------------------------------------------------------------*/
        return this-object:zon02.

    end method.

end class.
