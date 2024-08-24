import 'package:get/get.dart';
import 'package:untitled/Models/Place.dart';
import '../Utils/DatabaseHelper.dart';

class NewPlaceController extends GetxController {
  var placeName = ''.obs;
  var imageUrl = ''.obs;
  var parkingRating = 0.0.obs;
  var pavementRating = 0.0.obs;
  var servicesRating = 0.0.obs;
  var toiletsRating = 0.0.obs;

  void setPlaceName(String name) {
    placeName.value = name;
  }

  void setImageUrl(String url) {
    imageUrl.value = url;
  }

  void setParkingRating(double rating) {
    parkingRating.value = rating;
  }

  void setPavementRating(double rating) {
    pavementRating.value = rating;
  }

  void setServicesRating(double rating) {
    servicesRating.value = rating;
  }

  void setToiletsRating(double rating) {
    toiletsRating.value = rating;
  }

  Future<void> addPlaceToDatabase() async {
    final dbHelper = DatabaseHelper();
    final place = Place(
      placeName: placeName.value,
      imageUrl: imageUrl.value,
      parkingRating: parkingRating.value,
      pavementRating: pavementRating.value,
      servicesRating: servicesRating.value,
      toiletsRating: toiletsRating.value,
    );
    await dbHelper.addPlace(place);
  }
}
