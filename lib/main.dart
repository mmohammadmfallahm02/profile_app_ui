import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Color surfaceColor = Color(0x0dffffff);
    final Color primaryColor = Colors.pink.shade400;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
        dividerColor: surfaceColor,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: surfaceColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primaryColor))),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(
              headline6: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              bodyText2: TextStyle(fontSize: 14),
              bodyText1: TextStyle(
                  fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
              subtitle1: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
        ),
      ),
      home: HomeScreen(key: key),
    );
  }
}
