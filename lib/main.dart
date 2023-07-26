import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/blocs/settings_bloc.dart';
import 'package:weatherapp/blocs/theme_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc.dart';
import 'package:weatherapp/blocs/weather_bloc_observer.dart';
import 'package:weatherapp/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/screens/weather_screen.dart';
import 'package:weatherapp/states/theme_state.dart';

void main() {
  Bloc.observer = WeatherBlocObserver();
  final WeatherRepository weatherRepository = WeatherRepository(
      httpClient: http.Client()
  );
  //other blocs ?
  runApp(
      BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
        child: BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(),
          child: MyApp(weatherRepository: weatherRepository, key: null,), // Thay đổi key: null
        ),
      )
  );
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;
  const MyApp({Key? key, required this.weatherRepository}): //Thêm '?' cho phép truyền null cho key khi cần thiết
        super(key:key); //: assert(weatherRepository != null) remove comparison
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
            title: 'Flutter Weather App with Bloc',
            home: BlocProvider(
              create: (context) => WeatherBloc(
                  weatherRepository: weatherRepository
              ),
              child: const WeatherScreen(),
            )
        );
      },
    );
  }
}