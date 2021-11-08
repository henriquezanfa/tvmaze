import 'package:flutter/material.dart';
import 'package:tvmaze/commons/model/serie_model.dart';

class SerieScheduleWidget extends StatelessWidget {
  const SerieScheduleWidget({
    Key? key,
    required this.serie,
  }) : super(key: key);

  final SerieModel serie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Schedule: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                'Day(s): ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return Container(
                      child: Text('${serie.schedule?.days?[index]}'),
                    );
                  },
                  itemCount: serie.schedule?.days?.length,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Hour: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                child: Text('${serie.schedule?.time}'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
