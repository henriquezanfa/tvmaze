import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

typedef WidgetBuilderArgs = Widget Function(BuildContext context, Object? args);

final Map<String, WidgetBuilderArgs?> namedRoutes = {};

/// A way to show a modal bottom sheet using named navigation.
///
/// Eg.: Navigator.of(context).pushNamedModal('/ROUTE_NAME');
extension ModalNavigation on NavigatorState {
  Future<T?> pushNamedModal<T>(String routeName, {Object? arguments}) async {
    final Widget? widget = namedRoutes[routeName]?.call(context, arguments);

    if (widget != null) {
      showCupertinoModalBottomSheet(
        context: context,
        builder: (BuildContext context) => widget,
      );
    } else {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: FlutterError(
            'No route defined for \'$routeName\'',
          ),
          library: 'tvmaze',
          stack: StackTrace.current,
        ),
      );
    }
  }
}
