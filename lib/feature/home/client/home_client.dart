import 'package:tvmaze/commons/model/serie_model.dart';

abstract class HomeClient {
  Future<List<SerieModel>> getSeries({int? page});
}
