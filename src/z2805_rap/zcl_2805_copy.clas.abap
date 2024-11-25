CLASS zcl_2805_copy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_2805_COPY IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS table_name TYPE tabname VALUE 'Z2805FLIGHT'.

    TRY.
        DATA(copier) = NEW lcl_copy_data( table_name ).
        copier->copy_data( ).

        out->write( |{ table_name } was filled with data| ).

      CATCH cx_abap_not_a_table.

        out->write( |{ table_name } is not a table of the right type.| ).

    ENDTRY.
  ENDMETHOD.
ENDCLASS.
