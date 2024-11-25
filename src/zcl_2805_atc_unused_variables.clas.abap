CLASS zcl_2805_atc_unused_variables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interFACES  if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_2805_ATC_UNUSED_VARIABLES IMPLEMENTATION.


method if_oo_adt_classrun~main.
*data connection_list type table of /dmo/connection.
*data carrier_list type table of  /dmo/carrier.

select from /dmo/connection
fiELDS *
into table @DATA(connections).

*connection_list = connection_list.
out->write( connections ).

endMETHOD.
ENDCLASS.
