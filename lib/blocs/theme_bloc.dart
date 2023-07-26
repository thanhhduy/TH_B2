import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/events/theme_event.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/states/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState>{
  //initial state
  ThemeBloc():
        super(const ThemeState(
          backgroundColor: Colors.lightBlue,
          textColor: Colors.white
      ));
  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    ThemeState newThemeState;
    if(event is ThemeEventWeatherChanged) {
      final weatherCondition = event.weatherCondition;
      if(weatherCondition == WeatherCondition.clear ||
          weatherCondition == WeatherCondition.lightCloud) {
        newThemeState = const ThemeState(
            backgroundColor: Colors.yellow,
            textColor: Colors.black
        );
      } else if(weatherCondition == WeatherCondition.hail ||
          weatherCondition == WeatherCondition.snow ||
          weatherCondition == WeatherCondition.sleet) {
        newThemeState = const ThemeState(
            backgroundColor: Colors.lightBlue,
            textColor: Colors.white
        );
      }  else if(weatherCondition == WeatherCondition.heavyCloud) {
        newThemeState = const ThemeState(
            backgroundColor: Colors.grey,
            textColor: Colors.black
        );
      } else if(weatherCondition == WeatherCondition.heavyRain ||
          weatherCondition == WeatherCondition.lightRain ||
          weatherCondition == WeatherCondition.showers) {
        newThemeState = const ThemeState(
            backgroundColor: Colors.indigo,
            textColor: Colors.white
        );
      }else if(weatherCondition == WeatherCondition.thunderstorm) {
        newThemeState = const ThemeState(
            backgroundColor: Colors.deepPurple,
            textColor: Colors.white
        );
      } else {
        newThemeState = const ThemeState(
            backgroundColor:  Colors.lightBlue,
            textColor: Colors.white
        );
      }
      yield newThemeState;
    }
  }
}