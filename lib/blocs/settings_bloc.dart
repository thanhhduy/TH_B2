import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/events/settings_event.dart';
import 'package:weatherapp/states/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  //initial State
  SettingsBloc():super(const SettingsState(temperatureUnit: TemperatureUnit.celsius));
  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if(event is SettingsEventToggleUnit) {
      //state = "settings state"
      final newSettingsState = SettingsState(
          temperatureUnit: state.temperatureUnit == TemperatureUnit.celsius ?
          TemperatureUnit.fahrenheit : TemperatureUnit.celsius
      );
      yield newSettingsState;
    }
  }
}