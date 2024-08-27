class MosqueV2{

  final String name;
  final String detail;
  final double lat;
  final double lng;
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

  factory MosqueV2.fromJson(Map<String ,dynamic> json) {
    // final Map<String, dynamic> feature = json['features'];
    return MosqueV2(
      name: json['text'],
      detail: json['place_name'],
      lat: json['geometry']['coordinates'][1],
      lng: json['geometry']['coordinates'][0],
      fq: json['properties']['foursquare'],
    );
  }
}