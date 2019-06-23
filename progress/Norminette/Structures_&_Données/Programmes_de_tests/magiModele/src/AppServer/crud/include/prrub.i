/*------------------------------------------------------------------------
File        : prrub.i
Purpose     : 
Author(s)   : generation automatique le 04/27/18
Notes       : champs techniques utiles pour cette table
derniere revue: 2018/08/08 - phm: 
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttPrrub
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field cdaff     as character  initial ?
    field cdfam     as integer    initial ?
    field cdgen     as character  initial ?
    field cdirf     as character  initial ?
    field cdlib     as integer    initial ?
    field cdlng     as integer    initial ?
    field cdrub     as integer    initial ?
    field cdsfa     as integer    initial ?
    field cdsig     as character  initial ?
    field lbcab     as character  initial ?
    field lbdiv     as character  initial ?
    field lbdiv2    as character  initial ?
    field lbdiv3    as character  initial ?
    field lbrub     as character  initial ?
    field msqtt     as integer    initial ?
    field noloc     as int64      initial ?
    field noloc-dec as decimal    initial ? decimals 0
    field nome1     as integer    initial ?
    field noqtt     as integer    initial ?

    field cdcsy     as character  initial ?
    field cdmsy     as character  initial ?
    field dtcsy     as date
    field dtmsy     as date
    field hecsy     as integer    initial ?
    field hemsy     as integer    initial ?

    field dtTimestamp as datetime
    field CRUD        as character
    field rRowid      as rowid
.
