@EndUserText.label: 'Travel BO projection view'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true //Enable extension like metadata extension
@Search.searchable: true //Allow Search

define root view entity ZC_RAP_Travel_3LT
  as projection on ZI_RAP_Travel_3LT as Travel
{
  key TravelUuid,
      @Search.defaultSearchElement: true //Enable freestyle search for the view column
      TravelId,
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID' } }] //Value Help Definition
      @ObjectModel.text.element: ['AgencyName']   // Textual description
      @Search.defaultSearchElement: true //Enable freestyle search for the view column
      AgencyId,
      _Agency.Name       as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity: {name: '/DMO/I_Customer', element: 'CustomerID'} }] //Value Help Definition
      @ObjectModel.text.element: ['CustomerName']   // Textual description
      @Search.defaultSearchElement: true //Enable freestyle search for the view column
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: {name: 'I_Currency', element: 'Currency'} }] //Value Help Definition
      CurrencyCode,
      Description,
      TravelStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_RAP_Booking_3LT,
      _Currency,
      _Customer
}
