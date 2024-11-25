CLASS lhc_z_r_2805flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~validatePrice,
      validateCurrencyCode FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~validateCurrencyCode.
ENDCLASS.

CLASS lhc_z_r_2805flight IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD validatePrice.
    DATA failed_record LIKE LINE OF failed-flight.
    DATA reported_record LIKE LINE OF reported-flight.

    READ ENTITIES OF z_r_2805flight IN LOCAL MODE
        ENTITY Flight FIELDS ( price ) WITH CORRESPONDING #(  keys )
        RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).
      IF flight-price <= 0.
        failed_record-%tky = flight-%tky.
        INSERT failed_record INTO TABLE failed-flight.
        reported_record-%tky = flight-%tky.

        reported_record-%msg = new_message(
                                 id       = 'Z2805_RAP'
                                 number   = '004'
                                 severity = if_abap_behv_message=>severity-error
                                 v1       = flight-price
*                                     v2       =
*                                     v3       =
*                                     v4       =
                               ).

        INSERT reported_record INTO TABLE reported-flight.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateCurrencyCode.
    DATA failed_record LIKE LINE OF failed-flight.
    DATA reported_record LIKE LINE OF reported-flight.
    DATA exists TYPE abap_bool.

    READ ENTITIES OF z_r_2805flight IN LOCAL MODE
        ENTITY Flight FIELDS ( price ) WITH CORRESPONDING #(  keys )
        RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).
      exists = abap_false.

      SELECT SINGLE FROM i_currency FIELDS @abap_true WHERE currency = @flight-CurrencyCode INTO @exists.
      IF exists = abap_false.
        failed_record-%tky = flight-%tky.
        INSERT failed_record INTO TABLE failed-flight.
        reported_record-%tky = flight-%tky.

        reported_record-%msg = new_message(
                                 id       = 'Z2805_RAP'
                                 number   = '005'
                                 severity = if_abap_behv_message=>severity-error
                                 v1       = flight-CurrencyCode
*                                     v2       =
*                                     v3       =
*                                     v4       =
                               ).

        INSERT reported_record INTO TABLE reported-flight.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
