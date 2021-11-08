import 'package:flutter/material.dart';
import 'package:tvmaze/commons/model/episode_model.dart';
import 'package:tvmaze/core/routes/navigation_utils.dart';

class SerieEpisodesWidget extends StatelessWidget {
  const SerieEpisodesWidget({
    Key? key,
    required this.episodesBySeason,
  }) : super(key: key);

  final Map<int?, List<EpisodeModel>> episodesBySeason;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Episodes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 8),
            shrinkWrap: true,
            itemCount: episodesBySeason.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final epi = episodesBySeason.keys.toList()[index];
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black12,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Season ${episodesBySeason.keys.toList()[index]}'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: episodesBySeason[epi] != null
                            ? episodesBySeason[epi]!
                                .map(
                                  (e) => InkWell(
                                      onTap: () => Navigator.of(context)
                                          .pushNamedModal('/episode-details',
                                              arguments: e),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black38)),
                                          padding: EdgeInsets.all(4),
                                          width: 30,
                                          child: Center(
                                            child: Text('${e.number}'),
                                          ))),
                                )
                                .toList()
                            : [Offstage()],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
