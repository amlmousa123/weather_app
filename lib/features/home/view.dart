import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/widgets/loading_indicator.dart';

import 'cubit.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> HomeCubit()..getCurrentWeather(),
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          child: BlocBuilder<HomeCubit,HomeStates> (
             builder:(context,state) {
               final cuibt = HomeCubit.of(context);
               final weather = cuibt.weather;
               return state is HomeLoading? LoadingIndicator():
                 Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Text(weather!.main!.temp!.toString(), style: Theme.of(context).textTheme.headline5),
                   Text(weather.weather!.first.main!.toString(), style: Theme.of(context).textTheme.headline5),
                   Text(weather.name!.toString(), style: Theme.of(context).textTheme.headline5),
                   Text(weather.sys! .country!.toString(), style: Theme.of(context).textTheme.headline5),
                 ],
               );

             }
          ),
        ),
      ),
    );
  }
}
