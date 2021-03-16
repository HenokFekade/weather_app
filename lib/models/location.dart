class Location {
  final double latitude;
  final double longitude;
  final String country;
  final String state;
  final String city;
  final String displayName;

  Location({
    this.latitude,
    this.longitude,
    this.country,
    this.state = '',
    this.city = '',
    this.displayName = '',
  });

  static Location fromJson(Map map) {
    return Location(
      latitude: double.parse(map['lat']),
      longitude: double.parse(map['lon']),
      country: map['address']['country'],
      state: map['address']['state'],
      city: map['address']['city'],
      displayName: map['display_name'],
    );
  }
}
