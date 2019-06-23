/*------------------------------------------------------------------------
File        : afamqtord.i
Purpose     : Ordonnancement des familles et des  sous familles
Author(s)   : generation automatique le 01/24/18
Notes       :
derniere revue: 2018/04/27 - phm: OK
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttAfamqtord
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdfam   as integer  initial ?
    field cdsfa   as integer  initial ?
    field etab-cd as integer  initial ?
    field ordnum  as integer  initial ?
    field soc-cd  as integer  initial ?

    field dtTimestamp as datetime
    field CRUD        as character
    field rRowid      as rowid
.
