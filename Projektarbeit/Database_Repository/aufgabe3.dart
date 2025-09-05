import '../class.dart';
import 'aufgabe2.dart';

class RideRequestDatabaseRepository implements DatabaseRepository {
  List<RideRequest> rideRequests = [];

  @override
  create(rideRequest) {
    rideRequests.add(rideRequest);
  }

  @override
  List<dynamic> read() {
    return rideRequests;
  }

  @override
  update(rideRequest) {
    int index = rideRequests.indexWhere((e) => e.id == rideRequest.id);
    if (index == -1) return;
    rideRequests[index] = rideRequest;
  }

  @override
  delete(String id) {
    rideRequests.removeWhere((e) => e.id == id);
  }
}