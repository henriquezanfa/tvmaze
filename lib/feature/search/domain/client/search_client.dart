import 'package:tvmaze/commons/model/serie_model.dart';

abstract class SearchClient {
  Future<List<SerieModel>> getSeriesBySearch(String? search);
}
