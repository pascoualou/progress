/*------------------------------------------------------------------------
File        : cpaiechq.i
Purpose     : Pied des cheques
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttCpaiechq
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field bqjou-cd    as character  initial ? 
    field chrono      as integer    initial ? 
    field coll-cle    as character  initial ? 
    field cours       as decimal    initial ?  decimals 8
    field cpt-cd      as character  initial ? 
    field daech       as date       initial ? 
    field dapaie      as date       initial ? 
    field dev-cd      as character  initial ? 
    field edi         as logical    initial ? 
    field etab-cd     as integer    initial ? 
    field gest-cle    as character  initial ? 
    field mandat-cd   as integer    initial ? 
    field mt          as decimal    initial ?  decimals 2
    field mt-EURO     as decimal    initial ?  decimals 2
    field num-chq     as integer    initial ? 
    field num-chq-new as integer    initial ? 
    field num-int     as integer    initial ? 
    field soc-cd      as integer    initial ? 
    field statut      as character  initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
