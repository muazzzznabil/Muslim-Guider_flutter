class MosqueLocator {
  final String name;
  final String latitude;
  final String longitude;

  MosqueLocator({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory MosqueLocator.fromJson(Map<String, dynamic> json) {
    return MosqueLocator(
      name: json['name'],
      latitude: json['lat'],
      longitude: json['lon'],
    );
  }
}
