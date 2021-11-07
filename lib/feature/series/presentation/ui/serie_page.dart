import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tvmaze/core/di/di.dart';
import 'package:tvmaze/feature/series/presentation/store/series_store.dart';

class SeriePage extends StatelessWidget {
  final int id;
  final store = getIt<SeriesStore>();

  SeriePage({Key? key, required this.id}) : super(key: key) {
    store.getSerieDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.loading)
          return Center(
            child: CircularProgressIndicator(),
          );

        return Container(
          child: Text('${store.serie?.name}'),
        );
      },
    );
  }
}
