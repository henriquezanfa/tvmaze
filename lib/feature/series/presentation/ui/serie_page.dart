import "package:collection/collection.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tvmaze/commons/model/episode_model.dart';
import 'package:tvmaze/commons/widgets/detail_header_widget.dart';
import 'package:tvmaze/commons/widgets/summary_widget.dart';
import 'package:tvmaze/core/di/di.dart';
import 'package:tvmaze/feature/series/presentation/store/series_store.dart';
import 'package:tvmaze/feature/series/presentation/ui/widgets/serie_episodes_widget.dart';
import 'package:tvmaze/feature/series/presentation/ui/widgets/serie_genres_widget.dart';
import 'package:tvmaze/feature/series/presentation/ui/widgets/serie_schedule_widget.dart';

class SeriePage extends StatelessWidget {
  final int id;
  final store = getIt<SeriesStore>();

  SeriePage({Key? key, required this.id}) : super(key: key) {
    store.getSerieDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (store.loading) return Center(child: CircularProgressIndicator());

          final serie = store.serie!;

          final episodesBySeason =
              groupBy(store.episodes, (EpisodeModel obj) => obj.season);

          return CustomScrollView(
            slivers: [
              DetailHeaderWidget(
                title: serie.name,
                image: serie.image?.original,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () => store.addRemoveToFavorites(),
                      child: Icon(Icons.favorite_border_outlined),
                    ),
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SerieGenresWidget(serie: serie),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SerieScheduleWidget(serie: serie),
                        SummaryWidget(summary: serie.summary),
                        SerieEpisodesWidget(episodesBySeason: episodesBySeason),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
