import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/dio_helper/dio_helper.dart';
import 'package:weather_app/core/location_services/location_services.dart';
import 'package:weather_app/core/models/weather.dart';
part 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  static HomeCubit of(context) => BlocProvider.of(context);

  Weather? weather;

  Future<void> getCurrentWeather() async {
    emit(HomeLoading());
    try {
      final response = await DioHelper.get(
          "lat={${LocationServices.currentPosition!.latitude}}&lon={${LocationServices.currentPosition!.longitude}}");
      print(response.data);
      weather = Weather.fromJson(response.data);

    } catch (e) {
      print(e);
    }
    emit(HomeInit());
  }
}
