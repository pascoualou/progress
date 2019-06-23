/*------------------------------------------------------------------------
File        : chdad.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttChdad
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field acval  as character  initial ? 
    field cdcsy  as character  initial ? 
    field cdmsy  as character  initial ? 
    field dtcsy  as date       initial ? 
    field dtmsy  as date       initial ? 
    field fgrec  as logical    initial ? 
    field hecsy  as integer    initial ? 
    field hemsy  as integer    initial ? 
    field idchp  as character  initial ? 
    field idtbl  as character  initial ? 
    field lbcom  as character  initial ? 
    field lbdiv1 as character  initial ? 
    field lbdiv2 as character  initial ? 
    field lbdiv3 as character  initial ? 
    field nodec  as integer    initial ? 
    field noent  as integer    initial ? 
    field noexo  as integer    initial ? 
    field noper  as integer    initial ? 
    field norev  as integer    initial ? 
    field notbl  as integer    initial ? 
    field nvval  as character  initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
