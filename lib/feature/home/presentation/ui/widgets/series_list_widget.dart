import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tvmaze/core/di/di.dart';
import 'package:tvmaze/feature/home/presentation/store/home_store.dart';
import 'package:tvmaze/feature/home/presentation/ui/widgets/list_loarder_shimmer_widget.dart';
import 'package:tvmaze/feature/home/presentation/ui/widgets/serie_card_widget.dart';

class SeriesListWidget extends StatefulWidget {
  SeriesListWidget({Key? key}) : super(key: key);

  @override
  State<SeriesListWidget> createState() => _SeriesListWidgetState();
}

class _SeriesListWidgetState extends State<SeriesListWidget> {
  final HomeStore store = getIt<HomeStore>()..getSeries();

  @override
  void initState() {
    super.initState();

    reaction<String?>(
      (_) => store.errorMessage,
      (msg) {
        if (msg != null) showErrorSnack(msg);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.searchObservableFuture != null &&
            store.searchObservableFuture!.status == FutureStatus.pending) {
          return ListLoarderShimmerWidget();
        }
        return ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            buildSeries(),
            buildListLoader(),
          ],
        );
      },
    );
  }

  Widget buildListLoader() {
    return store.noMoreSeries
        ? Offstage()
        : Center(child: CircularProgressIndicator());
  }

  Widget buildSeries() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 5 / 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      padding: const EdgeInsets.all(16),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: store.filterList.length,
      itemBuilder: (_, index) => SerieCardWidget(
        serie: store.filterList[index],
      ),
    );
  }

  void showErrorSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(message),
      duration: const Duration(seconds: 5),
    ));
  }
}
