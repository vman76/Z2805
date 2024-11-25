@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity Z_C_2805FLIGHT
  provider contract transactional_query
  as projection on Z_R_2805FLIGHT
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
  Price,
  @Consumption.valueHelpDefinition: [{ entity.name:    'I_CurrencyStdVH', 
                                     entity.element: 'Currency' }]
  CurrencyCode,
  PlaneTypeId,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
