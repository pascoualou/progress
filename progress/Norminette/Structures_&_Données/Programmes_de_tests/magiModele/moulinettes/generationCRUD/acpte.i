/*------------------------------------------------------------------------
File        : acpte.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttAcpte
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdcal     as character  initial ? 
    field cdcsy     as character  initial ? 
    field cddev     as character  initial ? 
    field cdmsy     as character  initial ? 
    field dtcsy     as date       initial ? 
    field dtmsy     as date       initial ? 
    field hecsy     as integer    initial ? 
    field hemsy     as integer    initial ? 
    field jrech     as integer    initial ? 
    field lbdiv     as character  initial ? 
    field lbdiv2    as character  initial ? 
    field lbdiv3    as character  initial ? 
    field mdreg     as character  initial ? 
    field mtacp     as decimal    initial ?  decimals 2
    field mtacp-dev as decimal    initial ?  decimals 2
    field noacp     as integer    initial ? 
    field nocon     as integer    initial ? 
    field nocon-dec as decimal    initial ?  decimals 0
    field norol     as integer    initial ? 
    field norol-dec as decimal    initial ?  decimals 0
    field tpcon     as character  initial ? 
    field txacp     as decimal    initial ?  decimals 2
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
