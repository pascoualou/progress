/*------------------------------------------------------------------------
File        : evtev.i
Purpose     : Liens �v�nement-�v�nement
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttEvtev
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdcsy  as character  initial ? 
    field cdmsy  as character  initial ? 
    field dtcsy  as date       initial ? 
    field dtmsy  as date       initial ? 
    field hecsy  as integer    initial ? 
    field hemsy  as integer    initial ? 
    field lbdiv  as character  initial ? 
    field lbdiv2 as character  initial ? 
    field lbdiv3 as character  initial ? 
    field noev1  as int64      initial ? 
    field noev2  as int64      initial ? 
    field noord  as int64      initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
