import 'package:dio/dio.dart';
import 'package:dio_app/data/network/api/user/user_api.dart';
import 'package:dio_app/data/network/dio_client.dart';
import 'package:dio_app/data/repository/user_repository.dart';
import 'package:dio_app/ui/home/controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));

  getIt.registerSingleton(HomeController());
}
