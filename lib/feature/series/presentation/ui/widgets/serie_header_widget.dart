import 'package:flutter/material.dart';
import 'package:tvmaze/commons/model/serie_model.dart';

class SerieHeaderWidget extends StatelessWidget {
  const SerieHeaderWidget({
    Key? key,
    required this.serie,
  }) : super(key: key);

  final SerieModel serie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        title: Text('${serie.name}'),
        background: Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0x88000000),
                const Color(0x000000),
                const Color(0x000000),
                const Color(0x88000000),
              ],
            ),
          ),
          child: Image.network(
            '${serie.image?.original}',
            fit: BoxFit.cover,
          ),
        ),
      ),
      pinned: true,
      expandedHeight: 300,
    );
  }
}
