// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SeriesStore on _SeriesStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_SeriesStore.loading'))
      .value;

  final _$serieDetailsObservableFutureAtom =
      Atom(name: '_SeriesStore.serieDetailsObservableFuture');

  @override
  ObservableFuture<dynamic>? get serieDetailsObservableFuture {
    _$serieDetailsObservableFutureAtom.reportRead();
    return super.serieDetailsObservableFuture;
  }

  @override
  set serieDetailsObservableFuture(ObservableFuture<dynamic>? value) {
    _$serieDetailsObservableFutureAtom
        .reportWrite(value, super.serieDetailsObservableFuture, () {
      super.serieDetailsObservableFuture = value;
    });
  }

  final _$serieAtom = Atom(name: '_SeriesStore.serie');

  @override
  SerieModel? get serie {
    _$serieAtom.reportRead();
    return super.serie;
  }

  @override
  set serie(SerieModel? value) {
    _$serieAtom.reportWrite(value, super.serie, () {
      super.serie = value;
    });
  }

  final _$isFavoriteAtom = Atom(name: '_SeriesStore.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  final _$episodesAtom = Atom(name: '_SeriesStore.episodes');

  @override
  ObservableList<EpisodeModel> get episodes {
    _$episodesAtom.reportRead();
    return super.episodes;
  }

  @override
  set episodes(ObservableList<EpisodeModel> value) {
    _$episodesAtom.reportWrite(value, super.episodes, () {
      super.episodes = value;
    });
  }

  final _$addRemoveToFavoritesAsyncAction =
      AsyncAction('_SeriesStore.addRemoveToFavorites');

  @override
  Future<void> addRemoveToFavorites() {
    return _$addRemoveToFavoritesAsyncAction
        .run(() => super.addRemoveToFavorites());
  }

  final _$_checkIfIsFavoriteAsyncAction =
      AsyncAction('_SeriesStore._checkIfIsFavorite');

  @override
  Future<void> _checkIfIsFavorite() {
    return _$_checkIfIsFavoriteAsyncAction
        .run(() => super._checkIfIsFavorite());
  }

  final _$_SeriesStoreActionController = ActionController(name: '_SeriesStore');

  @override
  void getSerieDetails(int id) {
    final _$actionInfo = _$_SeriesStoreActionController.startAction(
        name: '_SeriesStore.getSerieDetails');
    try {
      return super.getSerieDetails(id);
    } finally {
      _$_SeriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serieDetailsObservableFuture: ${serieDetailsObservableFuture},
serie: ${serie},
isFavorite: ${isFavorite},
episodes: ${episodes},
loading: ${loading}
    ''';
  }
}
