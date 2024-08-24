import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Screens/NewPlace.dart';
import '../Widgets/placeContainer.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 250, 250),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to( NewPlaceScreen());
        },
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
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
          style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Theme
                .of(context)
                .colorScheme
                .secondaryContainer,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              onTap: () {
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/imgs/Ellipse 1.png',  // The border image
                    width: 45,  // Adjusted size for the border image
                    height: 45,
                  ),
                  Image.asset(
                    'assets/imgs/Path 5.png',  // The arrow image
                    width: 24,  // Adjusted size for the arrow image
                    height: 24,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            PlaceContainer(),
            PlaceContainer(),
            PlaceContainer(),
          ],
        ),
      ),
    );
  }
}
