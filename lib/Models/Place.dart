class Place {
  String? placeName;
  String? imageUrl;
  double? parkingRating;
  double? pavementRating;
  double? servicesRating;
  double? toiletsRating;

  Place({
    this.placeName,
    this.imageUrl,
    this.parkingRating,
    this.pavementRating,
    this.servicesRating,
    this.toiletsRating,
  });

  Map<String, dynamic> toMap() {
    return {
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
      placeName: map['placeName'],
      imageUrl: map['imageUrl'],
      parkingRating: map['parkingRating'],
      pavementRating: map['pavementRating'],
      servicesRating: map['servicesRating'],
      toiletsRating: map['toiletsRating'],
    );
  }
}
