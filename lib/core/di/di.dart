import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tvmaze/core/client/tvmaze_client.dart';
import 'package:tvmaze/core/constants.dart';
import 'package:tvmaze/feature/home/data/home_client_impl.dart';
import 'package:tvmaze/feature/home/domain/client/home_client.dart';

final getIt = GetIt.instance;

void setup() {
  // Client
  getIt.registerLazySingleton<HomeClient>(() => HomeClientImpl(getIt()));

  // Base client
  getIt.registerLazySingleton(() => TVMazeClient(getIt()));
  getIt.registerLazySingleton(() => Dio(BaseOptions(baseUrl: API_URL)));
}
