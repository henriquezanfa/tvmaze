import 'package:flutter/material.dart';
import 'package:tvmaze/commons/model/serie_model.dart';

class SerieGenresWidget extends StatelessWidget {
  const SerieGenresWidget({
    Key? key,
    required this.serie,
  }) : super(key: key);

  final SerieModel serie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Wrap(
        runSpacing: 8,
        spacing: 4,
        children:
            serie.genres?.map((e) => Chip(label: Text('${e}'))).toList() ??
                [Offstage()],
      ),
    );
  }
}
