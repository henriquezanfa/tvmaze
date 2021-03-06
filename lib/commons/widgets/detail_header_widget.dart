import 'package:flutter/material.dart';

class DetailHeaderWidget extends StatelessWidget {
  const DetailHeaderWidget({
    Key? key,
    required this.title,
    required this.image,
    this.leading,
    this.actions,
  }) : super(key: key);

  final String? title;
  final String? image;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: actions,
      leading: leading,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('${title}'),
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
            '${image}',
            fit: BoxFit.cover,
          ),
        ),
      ),
      pinned: true,
      expandedHeight: 300,
    );
  }
}
