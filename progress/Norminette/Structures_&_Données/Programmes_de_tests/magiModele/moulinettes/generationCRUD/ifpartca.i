/*------------------------------------------------------------------------
File        : ifpartca.i
Purpose     : Tables des correspondances comptes analytiques par article
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttIfpartca
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field ana-cd      as character  initial ? 
    field ana1-cd     as character  initial ? 
    field ana2-cd     as character  initial ? 
    field ana3-cd     as character  initial ? 
    field ana4-cd     as character  initial ? 
    field art-cle     as character  initial ? 
    field cptg-cd     as character  initial ? 
    field etab-cd     as integer    initial ? 
    field pos         as integer    initial ? 
    field pourc       as decimal    initial ?  decimals ?
    field soc-cd      as integer    initial ? 
    field sscpt-cd    as character  initial ? 
    field taxe-cd     as integer    initial ? 
    field typefac-cle as character  initial ? 
    field typeventil  as logical    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
