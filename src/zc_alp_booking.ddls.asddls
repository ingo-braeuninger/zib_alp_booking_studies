  @AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Data Definition'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}

@ObjectModel.resultSet.sizeCategory: #XS

@Metadata.allowExtensions: true
define view entity zc_alp_booking
  as select from zi_booking
{

  key travel_id,
  key booking_id,
      booking_date,
      @Consumption.valueHelpDefinition: [
       {
        entity.name: '/DMO/C_Booking_U',
        entity.element: 'CustomerID'
       },
       {
       qualifier: 'VisualFilter1',
       entity.name: 'zc_alp_booking',
       entity.element: 'customer_id',
       additionalBinding: [{ localElement: 'customer_id', element: 'customer_id', usage: #FILTER_AND_RESULT }],       
       presentationVariantQualifier: 'Filter1'
       }
      ]
      @UI.lineItem: [{ label: 'Customer', position: 50 }]
      @UI.selectionField: [{ position: 10 }]
      customer_id,
      
      @Consumption.valueHelpDefinition: [
       {
        entity.name: '/DMO/C_Booking_U',
        entity.element: 'AirlineID'
       },
       {
       qualifier: 'VisualFilter2',
       entity.name: 'zc_alp_booking',
       entity.element: 'carrier_id',
       additionalBinding: [{ localElement: 'carrier_id', element: 'carrier_id', usage: #FILTER_AND_RESULT }],              
       presentationVariantQualifier: 'Filter2'
       }
      ]
      @UI.lineItem: [{ label: 'Carrier', position: 60 }]
      @UI.selectionField: [{ position: 20 }]      
      carrier_id,
      
      @Consumption.valueHelpDefinition: [
       {
        entity.name: '/DMO/C_Booking_U',
        entity.element: 'ConnectionID'
       },
       {
       qualifier: 'VisualFilter3',
       entity.name: 'zc_alp_booking',
       entity.element: 'connection_id',
       additionalBinding: [{ localElement: 'connection_id', element: 'connection_id', usage: #FILTER_AND_RESULT }],              
       presentationVariantQualifier: 'Filter3'
       }
      ]
      @UI.lineItem: [{ label: 'Connection ID', position: 50 }]
      @UI.selectionField: [{ position: 30 }]      
      connection_id,
      flight_date,
      @Semantics.amount.currencyCode: 'currency_code'
      flight_price,
      currency_code,
      booking_status,
      last_changed_at,

      @Aggregation.default: #SUM
      cast(1 as abap.int8) as counter,

      /* Associations */
      _Carrier,
      _Connection,
      _Customer
//      _Travel
}
