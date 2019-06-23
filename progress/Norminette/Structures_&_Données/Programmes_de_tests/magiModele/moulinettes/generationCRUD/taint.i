/*------------------------------------------------------------------------
File        : taint.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttTaint
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdcsy              as character  initial ? 
    field cddev              as character  initial ? 
    field cdmsy              as character  initial ? 
    field dtcsy              as date       initial ? 
    field dtdeb              as date       initial ? 
    field dtfin              as date       initial ? 
    field dtmsy              as date       initial ? 
    field etqclimat          as character  initial ? 
    field etqenergie         as character  initial ? 
    field hecsy              as integer    initial ? 
    field hemsy              as integer    initial ? 
    field IndEnergiePrimaire as decimal    initial ?  decimals 2
    field IndGazEffetSerre   as decimal    initial ?  decimals 2
    field lbdiv              as character  initial ? 
    field lbdiv2             as character  initial ? 
    field lbdiv3             as character  initial ? 
    field nocon              as int64      initial ? 
    field nocon-dec          as decimal    initial ?  decimals 0
    field noidt              as int64      initial ? 
    field noidt-dec          as decimal    initial ?  decimals 0
    field notac              as integer    initial ? 
    field tpcon              as character  initial ? 
    field tpidt              as character  initial ? 
    field tptac              as character  initial ? 
    field valetqclimat       as integer    initial ? 
    field valetqenergie      as integer    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
