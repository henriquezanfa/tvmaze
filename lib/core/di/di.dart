import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tvmaze/core/client/tvmaze_client.dart';
import 'package:tvmaze/core/constants.dart';

final getIt = GetIt.instance;

void setup() {
  // Client
  getIt.registerLazySingleton(() => TVMazeClient(getIt()));
  getIt.registerLazySingleton(() => Dio(BaseOptions(baseUrl: API_URL)));
}
