/*------------------------------------------------------------------------
File        : parametrageSEPA.cls
Description : 
Author(s)   : kantena  -  2017/12/05
Notes       : 
------------------------------------------------------------------------*/

block-level on error undo, throw.

class parametre.pclie.parametrageSEPA inherits parametre.pclie.pclie:
    /*------------------------------------------------------------------------------
    Purpose:
    Notes:
    ------------------------------------------------------------------------------*/
    constructor public parametrageSEPA():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        super("SEPA").
    end constructor.

   method public logical isPrelevementSEPA():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
       return (zon01 = "00001").
   end method.

end class.
