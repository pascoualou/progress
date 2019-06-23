/*------------------------------------------------------------------------
File        : aecha.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttAecha
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field affair-num  as integer    initial ? 
    field cpt-cd      as character  initial ? 
    field daech       as date       initial ? 
    field date        as date       initial ? 
    field etab-cd     as integer    initial ? 
    field fg-compta   as logical    initial ? 
    field fg-statut   as logical    initial ? 
    field Heure       as character  initial ? 
    field mode-gest   as character  initial ? 
    field mode-paie   as character  initial ? 
    field mois-cpt    as integer    initial ? 
    field mt          as decimal    initial ?  decimals 2
    field mt-EURO     as decimal    initial ?  decimals 2
    field mtdev       as decimal    initial ?  decimals 2
    field num-ref     as character  initial ? 
    field pourcentage as integer    initial ? 
    field soc-cd      as integer    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
