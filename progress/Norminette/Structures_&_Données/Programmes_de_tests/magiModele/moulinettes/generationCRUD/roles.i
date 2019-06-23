/*------------------------------------------------------------------------
File        : roles.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttRoles
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdcsy     as character  initial ? 
    field cddev     as character  initial ? 
    field cdext     as character  initial ? 
    field cdmsy     as character  initial ? 
    field dtcsy     as date       initial ? 
    field dtmsy     as date       initial ? 
    field fg-princ  as logical    initial ? 
    field ged1      as character  initial ? 
    field ged2      as character  initial ? 
    field hecsy     as integer    initial ? 
    field hemsy     as integer    initial ? 
    field lbdiv     as character  initial ? 
    field lbdiv2    as character  initial ? 
    field lbdiv3    as character  initial ? 
    field lbrech    as character  initial ? 
    field norol     as int64      initial ? 
    field norol-dec as decimal    initial ?  decimals 0
    field notie     as int64      initial ? 
    field soc-cd    as integer    initial ? 
    field tprol     as character  initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
