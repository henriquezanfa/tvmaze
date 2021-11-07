import 'package:tvmaze/commons/model/episode_model.dart';
import 'package:tvmaze/commons/model/serie_model.dart';

abstract class SeriesClient {
  Future<SerieModel> getSerieDetails(int id);
  Future<List<EpisodeModel>> getEpisodes(int id);
}
