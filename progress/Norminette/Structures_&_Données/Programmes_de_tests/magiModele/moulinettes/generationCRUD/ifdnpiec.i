/*------------------------------------------------------------------------
File        : ifdnpiec.i
Purpose     : Table de numerotation des pieces
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttIfdnpiec
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field com-num      as integer    initial ? 
    field dadeb        as date       initial ? 
    field dafin        as date       initial ? 
    field etab-cd      as integer    initial ? 
    field jou-cd       as character  initial ? 
    field piece-compta as integer    initial ? 
    field soc-cd       as integer    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
