/*------------------------------------------------------------------------
File        : etxdt.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttEtxdt
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdbat     as character  initial ? 
    field cdcle     as character  initial ? 
    field cdcsy     as character  initial ? 
    field cddev     as character  initial ? 
    field cdmsy     as character  initial ? 
    field dtcsy     as date       initial ? 
    field dtmsy     as date       initial ? 
    field dtmut     as date       initial ? 
    field fgsou     as logical    initial ? 
    field hecsy     as integer    initial ? 
    field hemsy     as integer    initial ? 
    field lbdiv     as character  initial ? 
    field lbdiv2    as character  initial ? 
    field lbdiv3    as character  initial ? 
    field mtlot     as decimal    initial ?  decimals 2
    field mtlot-dev as decimal    initial ?  decimals 2
    field mttva     as decimal    initial ?  decimals 2
    field mttva-dev as decimal    initial ?  decimals 2
    field noapp     as integer    initial ? 
    field nolot     as integer    initial ? 
    field norol     as integer    initial ? 
    field norol-dec as decimal    initial ?  decimals 0
    field notrx     as integer    initial ? 
    field tpapp     as character  initial ? 
    field tpmut     as character  initial ? 
    field ttlot     as decimal    initial ?  decimals 2
    field ttlot-dev as decimal    initial ?  decimals 2
    field txsou     as decimal    initial ?  decimals 2
    field vltan     as integer    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
