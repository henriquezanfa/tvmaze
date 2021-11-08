import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({
    Key? key,
    required this.summary,
  }) : super(key: key);

  final String? summary;

  @override
  Widget build(BuildContext context) {
    return summary != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Summary',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Html(data: summary),
            ],
          )
        : Offstage();
  }
}
