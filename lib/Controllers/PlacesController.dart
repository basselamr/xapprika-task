import 'package:get/get.dart';
import '../Utils/DatabaseHelper.dart';
import '../Models/Place.dart';

class PlacesController extends GetxController {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  var places = <Place>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPlaces();
  }

  void loadPlaces() async {
    places.value = await databaseHelper.getPlaces();
  }

  Future<void> addPlace(Place place) async {
    await databaseHelper.addPlace(place);
    loadPlaces();
  }

  Future<void> removePlace(int placeId) async {
    await databaseHelper.removePlace(placeId);
    loadPlaces();
  }
}
