import 'package:tvmaze/feature/home/domain/model/serie_model.dart';

abstract class HomeClient {
  Future<List<SerieModel>> getSeries({int? page});
}
