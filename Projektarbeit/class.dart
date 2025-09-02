enum RideRequestStatus {
  open,
  rejected,
  confirmed
}

// Fahrtanfrage
class RideRequest {
  String? id; // wird später durch Firebase automatisch generiert
  final TransportServiceProvider transportServiceProvider;
  final DateTime pickupDate;
  final Address pickupAddress;
  final List<Address> route;
  final RideRequestStatus status = RideRequestStatus.open;

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
  final String name;
  final Address address;
  final String phone;
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
  final String streetName;
  final String houseNumber;
  final String postalCode;
  final String city;
  final String country;
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