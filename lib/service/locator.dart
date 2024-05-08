import 'package:get_it/get_it.dart';

import 'api/api_services.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton(() => ApiService.init());
}
