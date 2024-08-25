import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Screens/NewPlace.dart';
import '../Widgets/placeContainer.dart';
import '../Controllers/PlacesController.dart';

class PlacesScreen extends StatelessWidget {
  PlacesScreen({super.key});

  final PlacesController placesController = Get.put(PlacesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 250, 250),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(NewPlaceScreen());
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(33),
        ),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 22.0),
          child: Image(
            image: AssetImage('assets/imgs/profile-circle.png'),
          ),
        ),
        title: Text(
          "Hi, Guest235",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              onTap: () {},
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/imgs/Ellipse 1.png',
                    width: 45,
                    height: 45,
                  ),
                  Image.asset(
                    'assets/imgs/Path 5.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Obx(() {
        if (placesController.places.isEmpty) {
          return const Center(child: Text('No places available'));
        } else {
          return SingleChildScrollView(
            child: Column(
              children: placesController.places.map((place) => PlaceContainer(place: place)).toList(),
            ),
          );
        }
      }),
    );
  }
}
