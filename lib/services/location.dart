import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/permission.dart';

class Location {
  static bool _isLocationOn;
  static LocationPermission _locationPermission;
  static Position _position;

  static Future<void> _getPermission() async {
    _isLocationOn = await Geolocator.isLocationServiceEnabled();
    if (!_isLocationOn) {
      await Geolocator.openLocationSettings();
      Fluttertoast.showToast(msg: 'Please make Location on', webPosition: 1);
      await Location._initPosition(
          message: 'Your device location is off. Please make Location on');
    } else {
      _locationPermission = await Geolocator.checkPermission();
      if (_locationPermission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(
            msg: 'Check app setting. Can\'t access location.', webPosition: 1);
        await Geolocator.openAppSettings();
        await Location._initPosition(
            message: 'You did\'t allow the app to access location.');
      } else {
        if (_locationPermission == LocationPermission.denied) {
          _locationPermission = await Geolocator.requestPermission();
          if (_locationPermission != LocationPermission.whileInUse &&
              _locationPermission != LocationPermission.always) {
            return Permission.CurrentlyDenied;
          } else {
            await Location._initPosition(message: 'Location denied');
          }
        } else {
          await Location._initPosition(
              message: 'something wrong. please retry.');
        }
      }
    }

    return Permission.Allowed;
  }

  static Future<void> _initPosition({String message}) async {
    try {
      Location._position = await Geolocator.getCurrentPosition();
    } catch (e) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: message, webPosition: 1, toastLength: Toast.LENGTH_LONG);
    }
  }

  static Future<Position> getCurrentLocation() async {
    await Location._getPermission();
    return Location._position;
  }
}
