/*------------------------------------------------------------------------
File        : atva2.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttAtva2
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdcsy     as character  initial ? 
    field cddev     as character  initial ? 
    field cdmsy     as character  initial ? 
    field dtcsy     as date       initial ? 
    field dtmsy     as date       initial ? 
    field hecsy     as integer    initial ? 
    field hemsy     as integer    initial ? 
    field lbdiv     as character  initial ? 
    field lbdiv2    as character  initial ? 
    field lbdiv3    as character  initial ? 
    field mtdl1     as decimal    initial ?  decimals 2
    field mtdl1-dev as decimal    initial ?  decimals 2
    field mtdl2     as decimal    initial ?  decimals 2
    field mtdl2-dev as decimal    initial ?  decimals 2
    field nolig     as integer    initial ? 
    field nomdt     as integer    initial ? 
    field norub     as integer    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
