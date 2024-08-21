import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Screens/NewPlace.dart';
import '../Controllers/NavBarController.dart';
import 'PlacesScreen.dart';
import 'package:untitled/Models/CustomIcons.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final NavBarController navController = Get.put(NavBarController());

  final List<Widget> _screens = [
    const Placeholder(),
    const PlacesScreen(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _screens[navController.selectedIndex.value]),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: navController.selectedIndex.value,
          onTap: navController.updateIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(CustomIcons.home2),
              label: 'Home',
            ),

            const BottomNavigationBarItem(
              icon: Icon(Icons.map_sharp),
              label: 'Places',
            ),
            BottomNavigationBarItem(
              icon: Transform.rotate(origin: const Offset(0, 4),
                angle: 10,
                filterQuality: FilterQuality.high,
                alignment: Alignment.center,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.blueAccent.withOpacity(0.1),
                  ),
                  child: Transform.rotate(angle: -10,
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.blue[900], onPressed: () { Get.to(const NewPlaceScreen()); },
                    ),
                  ),
                ),
              ),
              label: '', // No label for the middle button
            ),
            const BottomNavigationBarItem(
              icon: Icon(CustomIcons.heart_empty),
              label: 'Favorites',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
