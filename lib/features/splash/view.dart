import 'package:flutter/material.dart';
import 'package:weather_app/core/location_services/location_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    await LocationServices.getCurrentLocation();
    Navigator.of(context).pushNamed('home');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Icon(
          Icons.stream,
          size: 50,
        ),
      ),
    );
  }
}
