import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationService extends GetxService {
  static LocationService instance = Get.find();

  Rx<Position> position = Position(
    altitude: 0.0,
    heading: 0.0,
    timestamp: DateTime.now(),
    latitude: 0.0,
    longitude: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
    accuracy: 0.0,
  ).obs;
  late bool serviceEnabled;

  @override
  void onInit() {
    super.onInit();
    _determinePosition();
  }

  //get user location
  void _getLocation() async {
    try {
      position.value = await Geolocator.getCurrentPosition();
      print(
        'lat ${position.value.latitude} , lng ${position.value.longitude} ',
      );
    } catch (error) {
      print(error);
    }
  }

  //check location permission
  void _determinePosition() async {
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    _getLocation();
  }
}
