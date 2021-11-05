// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$seriesObservableFutureAtom =
      Atom(name: '_HomeStore.seriesObservableFuture');

  @override
  ObservableFuture<dynamic>? get seriesObservableFuture {
    _$seriesObservableFutureAtom.reportRead();
    return super.seriesObservableFuture;
  }

  @override
  set seriesObservableFuture(ObservableFuture<dynamic>? value) {
    _$seriesObservableFutureAtom
        .reportWrite(value, super.seriesObservableFuture, () {
      super.seriesObservableFuture = value;
    });
  }

  final _$filterListAtom = Atom(name: '_HomeStore.filterList');

  @override
  ObservableList<SerieModel> get filterList {
    _$filterListAtom.reportRead();
    return super.filterList;
  }

  @override
  set filterList(ObservableList<SerieModel> value) {
    _$filterListAtom.reportWrite(value, super.filterList, () {
      super.filterList = value;
    });
  }

  final _$_completeListAtom = Atom(name: '_HomeStore._completeList');

  @override
  ObservableList<SerieModel> get _completeList {
    _$_completeListAtom.reportRead();
    return super._completeList;
  }

  @override
  set _completeList(ObservableList<SerieModel> value) {
    _$_completeListAtom.reportWrite(value, super._completeList, () {
      super._completeList = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_HomeStore.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$currentPageAtom = Atom(name: '_HomeStore.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$noMoreSeriesAtom = Atom(name: '_HomeStore.noMoreSeries');

  @override
  bool get noMoreSeries {
    _$noMoreSeriesAtom.reportRead();
    return super.noMoreSeries;
  }

  @override
  set noMoreSeries(bool value) {
    _$noMoreSeriesAtom.reportWrite(value, super.noMoreSeries, () {
      super.noMoreSeries = value;
    });
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void getSeries() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.getSeries');
    try {
      return super.getSeries();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
seriesObservableFuture: ${seriesObservableFuture},
filterList: ${filterList},
errorMessage: ${errorMessage},
currentPage: ${currentPage},
noMoreSeries: ${noMoreSeries}
    ''';
  }
}
