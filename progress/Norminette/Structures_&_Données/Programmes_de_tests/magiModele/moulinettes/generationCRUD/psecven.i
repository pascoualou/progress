/*------------------------------------------------------------------------
File        : psecven.i
Purpose     : Fichier secteur de vente
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttPsecven
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field etab-cd   as integer    initial ? 
    field lib       as character  initial ? 
    field secven-cd as integer    initial ? 
    field soc-cd    as integer    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
