import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/NavBar.dart';
import 'Screens/PlacesScreen.dart';
import 'Widgets/placeContainer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily:'Poppins' ,
          useMaterial3: true,
          colorScheme: const ColorScheme(
          primary: Color(0xFFDA035F), // #DA035F
          primaryContainer: Color(0xFF06B58D), // #06B58D
          secondary: Color(0xFFFCA800), // #FCA800
          secondaryContainer: Color(0xFF3A3E50), // #3A3E50
          surface: Color(0xFF797F96), // #797F96
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home:  NavBar(),
    );
  }
}



