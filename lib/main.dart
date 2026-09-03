import 'package:flutter/material.dart';
import 'package:latifa_day8_homework/screens/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
  
  theme: ThemeData(
    scaffoldBackgroundColor: Color(0xFF0E0E12),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF1A1A2E),
      secondary: Color(0xFF0E0E12),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        color: Colors.white,
      ),
    ),
  ),
  home: HomeScreen(),
);
  }
}