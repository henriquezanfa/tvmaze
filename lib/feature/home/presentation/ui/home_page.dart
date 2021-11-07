import 'package:flutter/material.dart';
import 'package:tvmaze/core/di/di.dart';
import 'package:tvmaze/feature/home/presentation/store/home_store.dart';
import 'package:tvmaze/feature/home/presentation/ui/widgets/home_app_bar_widget.dart';
import 'package:tvmaze/feature/home/presentation/ui/widgets/search_text_field_widget.dart';
import 'package:tvmaze/feature/home/presentation/ui/widgets/series_list_widget.dart';
import 'package:tvmaze/feature/home/presentation/ui/widgets/welcome_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  final HomeStore store = getIt<HomeStore>()..getSeries();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        store.getSeries();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          WelcomeTextWidget(),
          SearchTextFieldWidget(),
          SliverToBoxAdapter(child: SeriesListWidget()),
        ],
      ),
    );
  }
}
