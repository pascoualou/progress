/*------------------------------------------------------------------------
File        : parametrageReleveGerance.cls
Description : Param�trage indiquant que les relev�s de g�rance sont cr��s par la copropri�t�
Author(s)   : kantena  -  2017/09/29
Notes       :
------------------------------------------------------------------------*/

block-level on error undo, throw.

class parametre.pclie.parametrageReleveGerance inherits parametre.pclie.pclie:
	/*------------------------------------------------------------------------------
	Purpose:
	Notes:
    ------------------------------------------------------------------------------*/

    constructor public parametrageReleveGerance():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        super("RLGER").
    end constructor.

    method public logical isReleveEauGeranceCreeParLaCopropriete():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        return zon01 = "00001".  // oui
    end method.
    method public logical isReleveAppelFondActif():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        return zon02 = "00001".  // oui
    end method.

end class.
