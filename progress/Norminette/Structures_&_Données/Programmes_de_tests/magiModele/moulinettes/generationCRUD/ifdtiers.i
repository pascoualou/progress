/*------------------------------------------------------------------------
File        : ifdtiers.i
Purpose     : Table des correspondances comptes Cabinet / comptes ADB
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttIfdtiers
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cptg-cd     as character  initial ? 
    field cptg-dest   as character  initial ? 
    field etab-cd     as integer    initial ? 
    field soc-cd      as integer    initial ? 
    field soc-dest    as integer    initial ? 
    field sscpt-cd    as character  initial ? 
    field sscpt-dest  as character  initial ? 
    field typefac-cle as character  initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
