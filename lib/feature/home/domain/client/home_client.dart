import 'package:tvmaze/commons/model/serie_model.dart';

abstract class HomeClient {
  Future<List<SerieModel>> getSeries({int? page});

  Future<List<SerieModel>> getSeriesBySearch({String? search, int? page});
}
