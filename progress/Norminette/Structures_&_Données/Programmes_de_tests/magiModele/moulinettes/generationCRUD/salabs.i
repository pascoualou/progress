/*------------------------------------------------------------------------
File        : salabs.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttSalabs
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdcsy      as character  initial ? 
    field cdmotif    as character  initial ? 
    field cdmsy      as character  initial ? 
    field dtcsy      as date       initial ? 
    field dtdeb      as date       initial ? 
    field dtfin      as date       initial ? 
    field dtmsy      as date       initial ? 
    field fglong     as logical    initial ? 
    field hecsy      as integer    initial ? 
    field hemsy      as integer    initial ? 
    field lbdiv      as character  initial ? 
    field lbdiv2     as character  initial ? 
    field lbdiv3     as character  initial ? 
    field lbmotif    as character  initial ? 
    field mspai      as integer    initial ? 
    field noord      as integer    initial ? 
    field norol      as int64      initial ? 
    field refcontrat as character  initial ? 
    field tprol      as character  initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
