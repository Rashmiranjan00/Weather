import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/src/screens/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'MohrRounded',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
