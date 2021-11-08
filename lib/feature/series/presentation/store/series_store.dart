import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tvmaze/commons/model/episode_model.dart';
import 'package:tvmaze/commons/model/serie_model.dart';
import 'package:tvmaze/feature/series/domain/client/series_client.dart';

part 'series_store.g.dart';

class SeriesStore = _SeriesStore with _$SeriesStore;

abstract class _SeriesStore with Store {
  final SeriesClient _client;

  _SeriesStore(this._client);

  @observable
  ObservableFuture? serieDetailsObservableFuture;

  @observable
  SerieModel? serie;

  @observable
  bool isFavorite = false;

  @observable
  ObservableList<EpisodeModel> episodes = ObservableList();

  @computed
  bool get loading =>
      serieDetailsObservableFuture != null &&
      serieDetailsObservableFuture!.status == FutureStatus.pending;

  @action
  void getSerieDetails(int id) {
    serieDetailsObservableFuture = ObservableFuture(
      _client.getSerieDetails(id).then(
        (value) async {
          final _episodes = await _client.getEpisodes(id);
          episodes
            ..clear()
            ..addAll(_episodes);

          return serie = value;
        },
      ).then((value) async => await _checkIfIsFavorite()),
    );
  }

  @action
  Future<void> addRemoveToFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final favoritesString = prefs.getString('favorites');

    List<SerieModel> favs = [];

    if (favoritesString != null) {
      favs = List.from(
          jsonDecode(favoritesString).map((fav) => SerieModel.fromJson(fav)));

      if (isFavorite)
        favs.removeWhere((fav) => fav.id == serie!.id!);
      else
        favs.add(serie!);
    } else {
      favs = [serie!];
    }

    _saveFavorite(favs.map((e) => e.id).toList());
  }

  @action
  Future<void> _checkIfIsFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final favoritesString = prefs.getString('favorites');

    if (favoritesString != null) {
      jsonDecode(favoritesString).forEach(
        (id) {
          if (id == serie!.id) {
            isFavorite = true;
            return;
          }
        },
      );
    }
    isFavorite = false;
  }

  void _saveFavorite(List<int?> list) async {
    final json = list.map((e) => e.toString()).toList();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('favorites', jsonEncode(json));
  }
}
