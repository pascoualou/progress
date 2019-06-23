/*------------------------------------------------------------------------
File        : difuti.i
Purpose     : Salari�s : DIF - heures utilisees
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttDifuti
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdcsy   as character  initial ? 
    field cdmsy   as character  initial ? 
    field dtcsy   as date       initial ? 
    field dtmsy   as date       initial ? 
    field fgalloc as logical    initial ? 
    field fgmajo  as logical    initial ? 
    field hecsy   as integer    initial ? 
    field hemsy   as integer    initial ? 
    field lbdiv   as character  initial ? 
    field lbdiv2  as character  initial ? 
    field lbdiv3  as character  initial ? 
    field motif   as character  initial ? 
    field mspai   as integer    initial ? 
    field mtalloc as decimal    initial ?  decimals 2
    field mtmajo  as decimal    initial ?  decimals 2
    field nbheu   as decimal    initial ?  decimals 2
    field noord   as integer    initial ? 
    field norol   as int64      initial ? 
    field tprol   as character  initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
