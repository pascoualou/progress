/*------------------------------------------------------------------------
File        : idev.i
Purpose     : Liste des cours des devises
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttIdev
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cours   as decimal    initial ?  decimals 8
    field dec-mt  as logical    initial ? 
    field dev-cd  as character  initial ? 
    field etab-cd as integer    initial ? 
    field euro    as logical    initial ? 
    field fg-euro as logical    initial ? 
    field lib     as character  initial ? 
    field soc-cd  as integer    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
