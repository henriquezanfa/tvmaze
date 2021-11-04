import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      elevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      centerTitle: false,
      title: DefaultTextStyle(
        style: TextStyle(
          fontSize: 14,
          color: theme.primaryColor,
        ),
        child: Row(
          children: const [
            Text("Hey! "),
            Text(
              "Good to see you again!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: [
        MaterialButton(
          minWidth: 30,
          onPressed: () {},
          color: theme.colorScheme.secondary,
          textColor: Colors.white,
          child: const Icon(Icons.person, size: 16),
          padding: const EdgeInsets.all(4),
          shape: const CircleBorder(),
        )
      ],
    );
  }
}
