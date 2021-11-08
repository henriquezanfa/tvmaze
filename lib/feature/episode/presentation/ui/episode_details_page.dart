import 'package:flutter/material.dart';
import 'package:tvmaze/commons/model/episode_model.dart';
import 'package:tvmaze/commons/widgets/detail_header_widget.dart';
import 'package:tvmaze/commons/widgets/summary_widget.dart';

class EpisodeDetailsPage extends StatelessWidget {
  final EpisodeModel episode;

  const EpisodeDetailsPage({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailHeaderWidget(
            image: episode.image?.original,
            title: episode.name,
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.clear),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text('Ep. ${episode.number} - Season ${episode.season}'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SummaryWidget(summary: episode.summary),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
