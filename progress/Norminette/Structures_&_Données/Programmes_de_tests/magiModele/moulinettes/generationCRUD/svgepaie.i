/*------------------------------------------------------------------------
File        : svgepaie.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttSvgepaie
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdcsy  as character  initial ? 
    field cdgen  as character  initial ? 
    field cdmsy  as character  initial ? 
    field cdrub  as integer    initial ? 
    field dtcsy  as date       initial ? 
    field dtdeb  as date       initial ? 
    field dtfin  as date       initial ? 
    field dtmsy  as date       initial ? 
    field dtsvg  as date       initial ? 
    field fgann  as logical    initial ? 
    field hecsy  as integer    initial ? 
    field hemsy  as integer    initial ? 
    field lbdiv  as character  initial ? 
    field lbdiv2 as character  initial ? 
    field lbdiv3 as character  initial ? 
    field Lbrub  as character  initial ? 
    field montr  as decimal    initial ?  decimals 2
    field msann  as integer    initial ? 
    field NbrBa  as decimal    initial ?  decimals 2
    field norol  as decimal    initial ?  decimals 0
    field nosvg  as integer    initial ? 
    field tauxr  as decimal    initial ?  decimals 3
    field tprol  as character  initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
