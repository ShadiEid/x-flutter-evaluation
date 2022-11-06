import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> appConfig() async {
  registerSingleton<SharedPreferences>((await SharedPreferences.getInstance()));
}

/// create a global class instance
void registerSingleton<T extends Object>(T instance, {String? instanceName}) {
  try {
    GetIt.I.registerSingleton<T>(instance, instanceName: instanceName);
  } catch (_) {
    /// avoid register more than one time.
  }
}

/// get the global instance
T getSingleton<T extends Object>({String? instanceName}) {
  return GetIt.I.get<T>(instanceName: instanceName);
}

/// remove singleton instance
Future<void> unregisterSingleton<T extends Object>({String? instanceName}) async {
  if (isRegistered<T>(instanceName: instanceName)) {
    await GetIt.I.unregister<T>(instanceName: instanceName);
  }
}

/// check if instance is registerd
bool isRegistered<T extends Object>({String? instanceName}) {
  return GetIt.I.isRegistered<T>(instanceName: instanceName);
}
