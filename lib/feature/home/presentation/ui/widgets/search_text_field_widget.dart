import 'package:flutter/material.dart';
import 'package:tvmaze/core/di/di.dart';
import 'package:tvmaze/feature/home/presentation/store/home_store.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  final store = getIt<HomeStore>();

  final controller = TextEditingController();
  final focus = FocusNode();

  @override
  void initState() {
    super.initState();

    focus.addListener(() => setState(() {}));
    controller.addListener(() => store.searchSerie(controller.text));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        child: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              focusNode: focus,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(width: 0.5, color: Colors.grey),
                ),
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Type in your text",
                suffixIcon: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: !focus.hasFocus
                      ? Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                          key: UniqueKey(),
                        )
                      : Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColor,
                          key: UniqueKey(),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
