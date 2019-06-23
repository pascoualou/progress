/*------------------------------------------------------------------------
File        : rprub.i
Purpose     : Répatition par code rubrique
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttRprub
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdcsy     as character  initial ? 
    field cddev     as character  initial ? 
    field cdmsy     as character  initial ? 
    field cdrub     as integer    initial ? 
    field cdsru     as integer    initial ? 
    field dtcsy     as date       initial ? 
    field dtmsy     as date       initial ? 
    field hecsy     as integer    initial ? 
    field hemsy     as integer    initial ? 
    field lbdiv     as character  initial ? 
    field lbdiv2    as character  initial ? 
    field lbdiv3    as character  initial ? 
    field nbden     as integer    initial ? 
    field nbnum     as integer    initial ? 
    field nocon     as int64      initial ? 
    field nocon-dec as decimal    initial ?  decimals 0
    field tpcon     as character  initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
