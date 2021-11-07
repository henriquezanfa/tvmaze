import 'package:tvmaze/commons/model/episode_model.dart';
import 'package:tvmaze/commons/model/serie_model.dart';
import 'package:tvmaze/core/client/tvmaze_client.dart';
import 'package:tvmaze/feature/series/domain/client/series_client.dart';

class SeriesClientImpl implements SeriesClient {
  final TVMazeClient _client;

  SeriesClientImpl(this._client);

  @override
  Future<List<EpisodeModel>> getEpisodes(int id) async {
    final response = await _client.get(uri: 'shows/$id/episodes');

    return List<EpisodeModel>.from(
      response.map((episode) => EpisodeModel.fromJson(episode)),
    );
  }

  @override
  Future<SerieModel> getSerieDetails(int id) async {
    final response = await _client.get(uri: 'shows/$id');

    return SerieModel.fromJson(response);
  }
}
