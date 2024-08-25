import 'package:get/get.dart';
import '../Utils/DatabaseHelper.dart';
import '../Models/Place.dart';
import '../Controllers/PlacesController.dart';

class NewPlaceController extends GetxController {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final PlacesController placesController = Get.find<PlacesController>();

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
    Place newPlace = Place(
      placeName: placeName.value,
      imageUrl: imageUrl.value,
      parkingRating: parkingRating.value,
      pavementRating: pavementRating.value,
      servicesRating: servicesRating.value,
      toiletsRating: toiletsRating.value,
    );

    await databaseHelper.addPlace(newPlace);
    placesController.loadPlaces();
  }
}
