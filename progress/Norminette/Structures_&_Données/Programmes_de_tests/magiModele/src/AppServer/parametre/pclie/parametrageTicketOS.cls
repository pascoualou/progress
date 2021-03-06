/*------------------------------------------------------------------------
File        : parametrageTicketOS.cls
Description : Ticketing OS
Author(s)   : kantena  -  2018/09/28
Notes       : todo: cr�er le param�trage en base
              
------------------------------------------------------------------------*/
block-level on error undo, throw.

class parametre.pclie.parametrageTicketOS inherits parametre.pclie.pclie:
	/*------------------------------------------------------------------------------
	Purpose:
	Notes:
    ------------------------------------------------------------------------------*/

    constructor public parametrageTicketOS():
        /*------------------------------------------------------------------------------
        Purpose:
        Notes:
        ------------------------------------------------------------------------------*/
        super("TICKET_OS").
    end constructor.

    method public character getReference():
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
        return "06506".
    end method.

    method public character getProtocol():
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
        return "https".
    end method.

    method public character getHost():
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
        return "gi-6.la-gi.fr".
    end method.

    method public character getURI():
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
        return "ws/rest/listTicketOS".
    end method.
    
    method public integer getPort():
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
        return 443.
    end method.

    method public character getApiKey():
    /*------------------------------------------------------------------------------
    Purpose:
    Notes  :
    ------------------------------------------------------------------------------*/
        return "b0fb933b11b0703c58d948a060376fc2".
    end method.

end class.
