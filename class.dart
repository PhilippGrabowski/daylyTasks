// Fahrtanfrage
class RideRequest {
  String? id; // wird später durch Firebase automatisch generiert
  TransportServiceProvider transportServiceProvider;
  DateTime pickupDate;
  Address pickupAddress;
  List<Address> route;

  RideRequest({
    this.id,
    required this.transportServiceProvider, 
    required this.pickupDate,
    required this.pickupAddress,
    required this.route,
  });
}

// Transportdienstleister
class TransportServiceProvider {
  String? id; // wird später durch Firebase automatisch generiert
  String name;
  Address address;
  String phone;
  double? rating;

  TransportServiceProvider({
    this.id,
    required this.name,
    required this.address,
    required this.phone,
    this.rating
  });
}

// Adresse
class Address {
  String? id; // wird später durch Firebase automatisch generiert
  String streetName;
  String houseNumber;
  String postalCode;
  String city;
  String country;
  double? latitude; // Breitengrad
  double? longitude; // Längengrad

  Address({
    this.id,
    required this.streetName,
    required this.houseNumber,
    required this.postalCode,
    required this.city,
    required this.country,
    this.latitude,
    this.longitude
  });
}