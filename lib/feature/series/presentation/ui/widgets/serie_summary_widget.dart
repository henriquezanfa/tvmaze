import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tvmaze/commons/model/serie_model.dart';

class SerieSummaryWidget extends StatelessWidget {
  const SerieSummaryWidget({
    Key? key,
    required this.serie,
  }) : super(key: key);

  final SerieModel serie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Summary',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Html(data: serie.summary),
      ],
    );
  }
}
