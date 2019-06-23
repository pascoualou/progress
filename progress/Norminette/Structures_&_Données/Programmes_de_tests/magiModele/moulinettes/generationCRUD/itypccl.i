/*------------------------------------------------------------------------
File        : itypccl.i
Purpose     : Fichier Type de Commande Client
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttItypccl
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field chrono    as integer    initial ? 
    field flagavo   as logical    initial ? 
    field flagbl    as logical    initial ? 
    field flagfac   as logical    initial ? 
    field flagmvt   as logical    initial ? 
    field fnamelib  as character  initial ? 
    field lib       as character  initial ? 
    field typccl-cd as integer    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
