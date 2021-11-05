import 'package:tvmaze/commons/model/serie_model.dart';
import 'package:tvmaze/core/client/tvmaze_client.dart';
import 'package:tvmaze/feature/home/client/home_client.dart';

class HomeClientImpl extends HomeClient {
  final TVMazeClient _client;

  HomeClientImpl(this._client);

  @override
  Future<List<SerieModel>> getSeries({int? page}) async {
    final params = {'page': page}..removeWhere((key, value) => value == null);

    final response = await _client.get(uri: 'shows', queryParameters: params);

    return List<SerieModel>.from(
      response.map((serie) => SerieModel.fromJson(serie)),
    );
  }
}
