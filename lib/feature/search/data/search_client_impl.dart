import 'package:tvmaze/commons/model/serie_model.dart';
import 'package:tvmaze/core/client/tvmaze_client.dart';
import 'package:tvmaze/feature/search/domain/client/search_client.dart';

class SearchClientImpl implements SearchClient {
  final TVMazeClient _client;

  SearchClientImpl(this._client);

  @override
  Future<List<SerieModel>> getSeriesBySearch(String? search) async {
    final params = {'q': search}..removeWhere((key, value) => value == null);

    final response = await _client.get(uri: 'shows', queryParameters: params);

    return List<SerieModel>.from(
      response.map((serie) => SerieModel.fromJson(serie)),
    );
  }
}
