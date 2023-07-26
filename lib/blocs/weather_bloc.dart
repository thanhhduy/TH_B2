import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/events/weather_event.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/repositories/weather_repository.dart';
import 'package:weatherapp/states/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}):
        super(WeatherStateInitial()); //: assert(weatherRepository != null) remove comparison
  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async*{
    if(event is WeatherEventRequested) {
      yield WeatherStateLoading();
      try {
        final Weather weather = await weatherRepository.getWeatherFromCity(event.city);
        yield WeatherStateSuccess(weather: weather);
      }catch(exception) {
        yield WeatherStateFailure();
      }
    } else if(event is WeatherEventRefresh) {
      try {
        final Weather weather = await weatherRepository.getWeatherFromCity(event.city);
        yield WeatherStateSuccess(weather: weather);
      }catch(exception) {
        yield WeatherStateFailure();
      }
    }
  }
}