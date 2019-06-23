/*------------------------------------------------------------------------
File        : lstcptdps.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttLstcptdps
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cpt-cd       as character  initial ? 
    field denominateur as integer    initial ? 
    field ihtrf        as integer    initial ? 
    field JTRF         as date       initial ? 
    field lib          as character  initial ? 
    field mandat-cd    as integer    initial ? 
    field numerateur   as integer    initial ? 
    field soc-cd       as integer    initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
