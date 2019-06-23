/*------------------------------------------------------------------------
File        : idetail.i
Purpose     : Table de d�tail des infos d'une paire Code-Num
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttIdetail
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdcsy as character  initial ? 
    field cddet as character  initial ? 
    field cdmsy as character  initial ? 
    field dtcsy as date       initial ? 
    field dtmsy as date       initial ? 
    field hecsy as integer    initial ? 
    field hemsy as integer    initial ? 
    field iddet as integer    initial ? 
    field ixd01 as character  initial ? 
    field ixd02 as character  initial ? 
    field ixd03 as character  initial ? 
    field nodet as integer    initial ? 
    field tbchr as character  initial ? 
    field tbdat as date       initial ? 
    field tbdec as decimal    initial ?  decimals 2
    field tbint as integer    initial ? 
    field tblog as logical    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
