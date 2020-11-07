@EndUserText.label: 'Booking BO projection view'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true //Enable extension like metadata extension
@Search.searchable: true //Allow Search

define view entity ZC_RAP_Booking_3LT
  as projection on ZI_RAP_Booking_3LT as Booking
{
  key BookingUid,
      TravelUuid,
      @Search.defaultSearchElement: true //Enable freestyle search for the view column
      BookingId,
      BookingDate,
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID' } }] //Value Help Definition
      @ObjectModel.text.element: ['CustomerName']   // Textual description
      @Search.defaultSearchElement: true //Enable freestyle search for the view column
      CustomerId,
      _Customer.LastName as CustomerName,
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Carrier', element: 'AirlineID' } }] //Value Help Definition
      @ObjectModel.text.element: ['CarrierName']   // Textual description
      CarrierId,
      _Carrier.Name as CarrierName,
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Flight', element: 'ConnectionID' },
                                           additionalBinding: [ { localElement: 'CarrierID', element: 'AirlineID' },
                                                                { localElement: 'FlightDate', element: 'FlightDate' },
                                                                { localElement: 'FlightPrice', element: 'Price' },
                                                                { localElement: 'CurrencyCode', element: 'CurrencyCode' }] }] //Value Help Definition
      ConnectionId,
      FlightDate,
      FlightPrice,
      @Consumption.valueHelpDefinition: [{ entity : {name: 'I_currency', element: 'Currency ' } }] //Value Help Definition
      CurrencyCode,
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,
      
      /* Associations */
      _Carrier,
      _Connection,
      _Currency,
      _Customer,
      _Flight,
      _Travel : redirected to parent ZC_RAP_Travel_3LT
}
