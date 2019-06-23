/*------------------------------------------------------------------------
File        : cantsru.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttCantsru
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field ann-num  as character  initial ? 
    field code-lig as character  initial ? 
    field date-ant as date       initial ? 
    field etab-cd  as integer    initial ? 
    field lib      as character  initial ? 
    field mt       as decimal    initial ?  decimals 2
    field soc-cd   as integer    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
