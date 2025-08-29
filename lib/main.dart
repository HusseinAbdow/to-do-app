import 'package:flutter/material.dart';
import 'package:flutter_to_do_application/pages/home_page.dart';

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
        scaffoldBackgroundColor: Color.fromRGBO(243, 246, 245, 1),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.from(
            alpha: 1,
            red: 0.004,
            green: 0.31,
            blue: 0.051,
          ), // 🌟 AppBar (#005F73)
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),

      home: HomePage(),
    );
  }
}
