class MosqueV2{

  final String name;
  final String detail;
  final String lat;
  final String lng;
  final String fq;

  MosqueV2({
    required this.name,
    required this.detail,
    required this.lat,
    required this.lng,
    required this.fq
  });

  // factory MosqueV2.fromJson(Map<String, dynamic> json){
  //   return MosqueV2(
  //       name: json['features.text'],
  //       detail: json['features.place_name'],
  //       lat: json['features.geometry.coordinates[1]'],
  //       lng: json['features.geometry.coordinates[0]'],
  //       fq: json['features.foursquare'],
  //   );

  factory MosqueV2.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> feature = json['features']; // Assuming you want the first mosque
    return MosqueV2(
      name: feature['text'],
      detail: feature['place_name'],
      lat: feature['geometry']['coordinates'][1],
      lng: feature['geometry']['coordinates'][0],
      fq: feature['properties']['foursquare'],
    );
  }
}