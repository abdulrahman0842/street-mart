class Coordinates {
  final String latitude;
  final String longitude;
  Coordinates({required this.latitude, required this.longitude});
  Map<String, dynamic> toJson() {
    return {'lat': latitude, 'long': longitude};
  }
}
