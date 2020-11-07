CLASS zcl_rap_eml_3ltech DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_3ltech IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    " Step 1 - READ
*    READ ENTITIES OF ZI_RAP_Travel_3LT
*      ENTITY Travel
*        FROM VALUE #( ( TravelUuid = 'C9E705504B348A5717000802DD0F8158' ) )
*      RESULT DATA(travels).
*
*      out->write( travels ).

*    " Step 2 - READ with Fields
*    READ ENTITIES OF ZI_RAP_Travel_3LT
*      ENTITY Travel
*        FIELDS ( AgencyId CustomerId )
*        WITH VALUE #( ( TravelUuid = 'C9E705504B348A5717000802DD0F8158' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).

*    " Step 3 - READ with All Fields
*    READ ENTITIES OF ZI_RAP_Travel_3LT
*      ENTITY Travel
*        ALL FIELDS
*        WITH VALUE #( ( TravelUuid = 'C9E705504B348A5717000802DD0F8158' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).

    " Step 4 - READ by Associations
*    READ ENTITIES OF ZI_RAP_Travel_3LT
*      ENTITY Travel BY \_Booking
*        ALL FIELDS
*        WITH VALUE #( ( TravelUuid = 'C9E705504B348A5717000802DD0F8158' ) )
*      RESULT DATA(bookings).
*
*    out->write( bookings ).

    " Step 5 - Unsuccessful READ
*    READ ENTITIES OF ZI_RAP_Travel_3LT
*      ENTITY Travel
*        ALL FIELDS
*        WITH VALUE #( ( TravelUuid = 'C9E705504B348A5717000802DD0F8150' ) )
*      RESULT DATA(travels)
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
*    out->write( travels ).
*    out->write( failed ).
*    out->write( reported ).

*    " Step 6 - MODIFY update (description value before update was 'Business Trip to USA')
*    MODIFY ENTITIES OF ZI_RAP_Travel_3LT
*      ENTITY travel
*        UPDATE
*          SET FIELDS WITH VALUE
*            #( ( TravelUuid = 'C9E705504B348A5717000802DD0F8158'
*                 Description = 'This RAP openCourse is awesome') )
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*
*    out->write( 'Update done' ).
*    " Step 6b - Commit Entities
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_Travel_3LT
*      FAILED DATA(failed_commit)
*      REPORTED DATA(reported_commit).

    " Step 7 - MODIFY Create
*    MODIFY ENTITIES OF ZI_RAP_Travel_3LT
*      ENTITY Travel
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid           = 'MyContentID_1'
*                 AgencyId       = '70012'
*                 CustomerId     = '14'
*                 BeginDate      = cl_abap_context_info=>get_system_date( )
*                 EndDate        = cl_abap_context_info=>get_system_date( ) + 10
*                 Description    = 'I like 3L') )
*        MAPPED DATA(mapped)
*        FAILED DATA(failed)
*        REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_Travel_3LT
*      FAILED DATA(failed_commit)
*      REPORTED DATA(reported_commit).
*      out->write( 'Create done' ).

    " Step 8 - MODIFY Delete
    MODIFY ENTITIES OF ZI_RAP_Travel_3LT
      ENTITY travel
        DELETE FROM
          VALUE
            #( ( TravelUuid = '02831396D5641EDB88A38DC1B5AE9BE3' ) )
      FAILED DATA(failed)
      REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF ZI_RAP_Travel_3LT
      FAILED DATA(failed_commit)
      REPORTED DATA(reported_commit).

    out->write( 'Delete done' ).


  ENDMETHOD.

ENDCLASS.
