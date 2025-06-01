import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

Future<void> setupLocator() async {


  // Если будут сервисы, например API или LocalStorage
  // getIt.registerLazySingleton<AuthService>(() => AuthServiceImpl());
}
