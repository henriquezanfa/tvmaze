import 'package:mobx/mobx.dart';
import 'package:tvmaze/feature/home/domain/client/home_client.dart';
import 'package:tvmaze/feature/home/domain/model/serie_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final HomeClient _client;

  _HomeStore(this._client);

  @observable
  ObservableFuture? seriesObservableFuture;

  @observable

  /// [filterList] is the list which elements are shown on the screen.
  /// [_completeList] is the list list with all elements already loaded.
  ///
  /// The [filterList] is filled with the next [seriesCount] elements from
  /// [_completeList] each time the user reaches the end of the screen.
  ///
  /// It is like that because if we try to show all the [_completeList] at once
  /// the network can have some problems loading all its images (250 elements).
  /// So it is acting like an pagination with infinite scroll but without
  /// making a new request.
  ObservableList<SerieModel> filterList = ObservableList(),
      _completeList = ObservableList();

  @observable
  String? errorMessage;

  @observable
  int currentPage = 0;

  @observable
  bool noMoreSeries = false;

  /// Amount of series to show each time the user reaches the end of the screen
  int seriesCount = 30;

  @action
  void getSeries() {
    if (filterList.length == _completeList.length) {
      seriesObservableFuture =
          ObservableFuture(_client.getSeries(page: currentPage).then((value) {
        noMoreSeries = value.isEmpty;
        currentPage++;
        _completeList.addAll(value);
        filterList.addAll(
          _completeList.sublist(
              filterList.length, filterList.length + seriesCount),
        );
      }).catchError((error) {
        errorMessage = error.error;
        noMoreSeries = true;
      }));
    } else {
      if (_completeList.length > filterList.length + seriesCount)
        filterList.addAll(
          _completeList.sublist(
              filterList.length, filterList.length + seriesCount),
        );
      else
        filterList.addAll(
          _completeList.sublist(filterList.length, _completeList.length),
        );
    }
  }
}
