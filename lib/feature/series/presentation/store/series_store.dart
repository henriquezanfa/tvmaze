import 'package:mobx/mobx.dart';
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
          episodes.addAll(_episodes);
          return serie = value;
        },
      ),
    );
  }
}
