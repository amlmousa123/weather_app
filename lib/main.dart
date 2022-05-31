import 'package:flutter/material.dart';
import 'package:weather_app/features/home/view.dart';
import 'package:weather_app/features/splash/view.dart';

void main() {
  runApp(MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: SplashView(),
       routes: {
         'splash': (context) => SplashView(),
         'home'  : (context) => HomeView()
       },
     );
   }
 }
