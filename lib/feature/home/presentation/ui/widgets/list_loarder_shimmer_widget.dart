import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tvmaze/core/di/di.dart';
import 'package:tvmaze/feature/home/presentation/store/home_store.dart';

class ListLoarderShimmerWidget extends StatefulWidget {
  ListLoarderShimmerWidget({Key? key}) : super(key: key);

  @override
  State<ListLoarderShimmerWidget> createState() =>
      _ListLoaderShimmerWidgetState();
}

class _ListLoaderShimmerWidgetState extends State<ListLoarderShimmerWidget> {
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
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        buildSeries(),
      ],
    );
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
      itemCount: 20,
      itemBuilder: (_, index) => Shimmer.fromColors(
        highlightColor: Colors.black.withOpacity(0.2),
        baseColor: Colors.black.withOpacity(0.3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            color: Colors.black,
            child: SizedBox(
              height: 100,
              width: double.infinity,
            ),
            constraints: BoxConstraints.expand(),
          ),
        ),
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
