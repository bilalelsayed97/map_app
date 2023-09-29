import 'package:flutter/material.dart';
import 'package:mapapp/providers/great_places.dart';
import 'package:provider/provider.dart';
import './screens/place_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.indigo,
              onPrimary: Colors.white,
              secondary: Colors.indigo,
              onSecondary: Colors.white,
              error: Colors.indigo,
              onError: Colors.white,
              background: Colors.indigo,
              onBackground: Colors.white,
              surface: Colors.indigo,
              onSurface: Colors.white),
        ),
        home: PlaceListScreen(),
      ),
    );
  }
}
