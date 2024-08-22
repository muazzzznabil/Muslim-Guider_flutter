class MosqueLocator {
  final String name;
  final double latitude;
  final double longitude;

  MosqueLocator({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory MosqueLocator.fromJson(Map<String, dynamic> json) {
    return MosqueLocator(
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
