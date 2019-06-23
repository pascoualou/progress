/*------------------------------------------------------------------------
File        : ifpsai.i
Purpose     : Table des entetes de factures diverses
Author(s)   : generation automatique le 01/31/18
Notes       :
------------------------------------------------------------------------*/
&if defined(nomTable)   = 0 &then &scoped-define nomTable ttIfpsai
&endif
&if defined(serialName) = 0 &then &scoped-define serialName {&nomTable}
&endif
define temp-table {&nomTable} no-undo serialize-name '{&serialName}'
    field adrfac        as character  initial ? 
    field adrfac-cd     as integer    initial ? 
    field cdenr         as character  initial ? 
    field com-num       as integer    initial ? 
    field cours         as decimal    initial ?  decimals 8
    field cpfac         as character  initial ? 
    field cpt-cd        as character  initial ? 
    field dacpta        as date       initial ? 
    field dacrea        as date       initial ? 
    field daech         as date       initial ? 
    field dafac         as date       initial ? 
    field damod         as date       initial ? 
    field dev-cd        as character  initial ? 
    field emet-cle      as character  initial ? 
    field etab-cd       as integer    initial ? 
    field fac-num       as integer    initial ? 
    field fg-edifac     as logical    initial ? 
    field fg-lock       as logical    initial ? 
    field ihcpta        as integer    initial ? 
    field ihcrea        as integer    initial ? 
    field ihmod         as integer    initial ? 
    field lib           as character  initial ? 
    field libass-cd     as integer    initial ? 
    field libpaysfac-cd as character  initial ? 
    field libraisfac-cd as integer    initial ? 
    field nomfac        as character  initial ? 
    field regl-cd       as integer    initial ? 
    field rep-cle       as character  initial ? 
    field scen-cle      as character  initial ? 
    field soc-cd        as integer    initial ? 
    field sscoll-cle    as character  initial ? 
    field totescpt      as decimal    initial ?  decimals 2
    field totht         as decimal    initial ?  decimals 2
    field tottva        as decimal    initial ?  decimals 2
    field tvaceefac-cle as character  initial ? 
    field txescpt       as integer    initial ? 
    field txremex       as integer    initial ? 
    field typefac-cle   as character  initial ? 
    field typenat-cd    as integer    initial ? 
    field usrid         as character  initial ? 
    field usridmod      as character  initial ? 
    field vilfac        as character  initial ? 
    field dtTimestamp as datetime  initial ?
    field CRUD        as character initial ?
    field rRowid      as rowid
.
