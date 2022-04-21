import 'package:flutter/material.dart';
import 'user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Secure Storage',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueAccent,
        unselectedWidgetColor: Colors.white12,
        colorScheme:
            const ColorScheme.dark().copyWith(secondary: Colors.white38),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      home: const UserPage(),
    );
  }
}
