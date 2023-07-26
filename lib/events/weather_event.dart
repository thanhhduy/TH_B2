import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}
class WeatherEventRequested extends WeatherEvent {
  final String city;
  const WeatherEventRequested({required this.city}); //: assert(city != null) remove comparison
  @override
  // TODO: implement props
  List<Object> get props => [city];
}
class WeatherEventRefresh extends WeatherEvent {
  final String city;
  const WeatherEventRefresh({required this.city});//: assert(city != null) remove comparison
  @override
  List<Object> get props => [city];
}