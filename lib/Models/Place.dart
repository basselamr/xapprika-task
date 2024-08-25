class Place {
  int? id; // Make id nullable because it will be null for new places
  String placeName;
  String imageUrl;
  double parkingRating;
  double pavementRating;
  double servicesRating;
  double toiletsRating;

  Place({
    this.id, // id will be auto-incremented, so it's optional
    required this.placeName,
    required this.imageUrl,
    required this.parkingRating,
    required this.pavementRating,
    required this.servicesRating,
    required this.toiletsRating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'placeName': placeName,
      'imageUrl': imageUrl,
      'parkingRating': parkingRating,
      'pavementRating': pavementRating,
      'servicesRating': servicesRating,
      'toiletsRating': toiletsRating,
    };
  }

  static Place fromMap(Map<String, dynamic> map) {
    return Place(
      id: map['id'],
      placeName: map['placeName'],
      imageUrl: map['imageUrl'],
      parkingRating: map['parkingRating'],
      pavementRating: map['pavementRating'],
      servicesRating: map['servicesRating'],
      toiletsRating: map['toiletsRating'],
    );
  }
}
