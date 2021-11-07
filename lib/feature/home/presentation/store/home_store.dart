import 'package:mobx/mobx.dart';
import 'package:tvmaze/commons/model/serie_model.dart';
import 'package:tvmaze/feature/home/domain/client/home_client.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final HomeClient _client;

  _HomeStore(this._client);

  @observable
  ObservableFuture? seriesObservableFuture, searchObservableFuture;

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
  String? errorMessage, search;

  @observable
  int currentPage = 0;

  @observable
  bool noMoreSeries = false, hasSearched = false;

  /// Amount of series to show each time the user reaches the end of the screen
  int seriesCount = 30;

  @action
  void getSeries() {
    if (hasSearched) return;
    if (filterList.length == _completeList.length) {
      seriesObservableFuture =
          ObservableFuture(_client.getSeries(page: currentPage).then((value) {
        currentPage++;
        noMoreSeries = value.isEmpty;
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

  @action
  void searchSerie(String? search) {
    if (search != null && search.isNotEmpty && this.search != search) {
      this.search = search;

      // TODO: change when to trigger because it is making multiple requests if the user inputs change before the previous request is completed
      searchObservableFuture = ObservableFuture(
          _client.getSeriesBySearch(search: search).then((value) {
        noMoreSeries = true;
        hasSearched = true;

        _completeList
          ..clear()
          ..addAll(value);
        filterList
          ..clear()
          ..addAll(value);
      }).catchError((error) {
        errorMessage = error.error;
        noMoreSeries = true;
      }));
    }
  }
}
