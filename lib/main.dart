import 'package:azkar/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/splash.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized;
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        backgroundColor: Colors.grey.withOpacity(0.6),
        appBarTheme: const AppBarTheme(
            textTheme: TextTheme(
              subtitle1: TextStyle(fontFamily: 'Tajawal', fontSize: 22.0),
            ),
            elevation: 0),
      ),
    );
  }
}
