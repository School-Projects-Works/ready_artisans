import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:ready_artisans/Components/SmartDialog.dart';
import 'package:location/location.dart' as loc;

import '../GlobalFunctions.dart';


class LocationService extends ChangeNotifier {
  UserLocation? _currentLocation;
  UserLocation? get currentLocation => _currentLocation;
  Future<bool> _handleLocationPermission() async {
    var location = loc.Location();
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        CustomDialog.showError(
            message:
                'Location service is disabled. Please enable location to continue');
        return false;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        CustomDialog.showError(
            message:
                'Location permission is denied. Please allow location to continue');
        return false;
      }
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    try {
      var location = loc.Location();
      location.enableBackgroundMode(enable: true);
      location.onLocationChanged.listen((event) async {
        await geo
            .placemarkFromCoordinates(event.latitude!, event.longitude!)
            .then((List<geo.Placemark> placeMarks) {
          geo.Placemark place = placeMarks[0];
          _currentLocation = UserLocation(
            latitude: event.latitude!,
            longitude: event.longitude!,
            name: place.name,
            street: place.street,
            city: place.locality,
            region: place.administrativeArea,
            country: place.country,
            countryCode: place.isoCountryCode,
            district: place.subAdministrativeArea,
          );
        }).catchError((e) {
          debugPrint(e);
        });
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  String filter= 'Near Me (${getAttached("Near Me")})';
  String get getFilter=>filter;
  void setFilter(String value){
    filter=value;
    notifyListeners();
  }


}

class UserLocation {
  final double latitude;
  final double longitude;
  final String? name;
  final String? street;
  final String? city;
  final String? region;
  final String? country;
  final String? countryCode;
  final String? district;
  UserLocation(
      {this.name,
      this.street,
      this.city,
      this.region,
      this.country,
      this.countryCode,
      this.district,
      required this.latitude,
      required this.longitude});

  Map<String, dynamic> toJson() => {
        'name': name,
        'street': street,
        'city': city,
        'region': region,
        'country': country,
        'countryCode': countryCode,
        'district': district,
        'latitude': latitude,
        'longitude': longitude,
      };
}
