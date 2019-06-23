/*------------------------------------------------------------------------
File        : coloc.i
Purpose     : 
Author(s)   : generation automatique le 01/31/18
Notes       :
derniere revue: 2018/08/07 - phm: 
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttColoc
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field CdBquPrel    as character initial ?
    field dacompta     as date
    field dtent        as date
    field dtsor        as date
    field FgFac        as logical   initial ?
    field fgQtt-Garant as logical   initial ?
    field jrpre        as integer   initial ?
    field lbdiv        as character initial ?
    field lbdiv2       as character initial ?
    field lbdiv3       as character initial ?
    field mdEnv        as character initial ?
    field mdreg        as character initial ?
    field msqtt        as integer   initial ?
    field mstrt-fac    as integer   initial ?
    field mtarr        as decimal   initial ? decimals 2
    field mtColoc      as decimal   initial ? decimals 2
    field mtTotal      as decimal   initial ? decimals 2
    field nocon        as int64     initial ?
    field noidt        as int64     initial ?
    field NoMDtBqu     as integer   initial ?
    field noord        as integer   initial ?
    field noqtt        as integer   initial ?
    field norol-Garant as integer   initial ?
    field num-int-fac  as integer   initial ?
    field qpColoc      as integer   initial ?
    field qpTotal      as integer   initial ?
    field tpcon        as character initial ?
    field tpidt        as character initial ?
    field tprol-Garant as character initial ?
    field type-fac     as character initial ?

    field dtTimestamp as datetime
    field CRUD        as character
    field rRowid      as rowid
.
