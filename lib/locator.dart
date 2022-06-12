import 'package:fixture_info_task/services/api_service.dart';
import 'package:fixture_info_task/services/navigation_service.dart';
import 'package:fixture_info_task/views/base_model.dart';
import 'package:get_it/get_it.dart';


final GetIt locator = GetIt.instance;


Future<void> setUpLocator() async {
  print("Setting Up Locator Service.");

  locator.registerFactory(() => BaseModel());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());





}