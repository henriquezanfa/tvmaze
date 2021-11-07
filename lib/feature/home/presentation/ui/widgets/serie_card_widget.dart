import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tvmaze/commons/model/serie_model.dart';

class SerieCardWidget extends StatelessWidget {
  const SerieCardWidget({
    Key? key,
    required this.serie,
  }) : super(key: key);

  final SerieModel serie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        '/serie-details',
        arguments: serie.id,
      ),
      child: Stack(
        children: [
          buildSerieImage(),
          buildSerieTitle(),
        ],
      ),
    );
  }

  ClipRRect buildSerieImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        serie.image?.medium ?? "",
        width: double.infinity,
        fit: BoxFit.fitWidth,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Container(
            height: 300,
            child: Icon(
              Icons.image_not_supported_outlined,
              color: Colors.black,
            ),
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0x88000000),
                  const Color(0x44000000),
                  const Color(0x44000000),
                  const Color(0x88000000),
                ],
              ),
            ),
            width: double.infinity,
          );
        },
        frameBuilder: (_, Widget child, int? frame, bool loaded) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: loaded || frame != null
                ? Container(
                    child: child,
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xCC000000),
                          const Color(0x00000000),
                          const Color(0x00000000),
                          const Color(0xCC000000),
                        ],
                      ),
                    ),
                    width: double.infinity,
                  )
                : Shimmer.fromColors(
                    highlightColor: Colors.black.withOpacity(0.2),
                    baseColor: Colors.black.withOpacity(0.3),
                    child: Container(
                      color: Colors.black,
                      child: SizedBox(
                        height: 100,
                        width: double.infinity,
                      ),
                      constraints: BoxConstraints.expand(),
                    ),
                  ),
          );
        },
      ),
    );
  }

  Column buildSerieTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Text(
            '${serie.name?.toUpperCase()}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
