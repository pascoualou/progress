/*------------------------------------------------------------------------
File        : parametrageUniteOeuvre.cls
Description : Param�tres li�s aux relev�s d'eau, �lectricit�, gaz etc...
Author(s)   : SPo  -  2018/02/08
Notes       : 
------------------------------------------------------------------------*/

block-level on error undo, throw.

class parametre.pclie.parametrageUniteOeuvre inherits parametre.pclie.pclie:
	/*------------------------------------------------------------------------------
	Purpose:
	Notes:
    ------------------------------------------------------------------------------*/
    constructor public parametrageUniteOeuvre():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes: 
        ------------------------------------------------------------------------------*/
        super("ANACP").
    end constructor.

    method public logical isUniteOeuvre():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        return this-object:isDbParameter and this-object:zon01 = "00001".
    end method.
end class.
