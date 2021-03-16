import 'package:weather_app/models/location.dart';

class Converter {
  static Location toLocation(Map map) {
    return Location.fromJson(map);
  }
}
