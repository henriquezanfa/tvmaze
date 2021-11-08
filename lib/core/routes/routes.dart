import 'package:flutter/material.dart';
import 'package:tvmaze/commons/model/episode_model.dart';
import 'package:tvmaze/core/routes/navigation_utils.dart';
import 'package:tvmaze/feature/episode/presentation/ui/episode_details_page.dart';
import 'package:tvmaze/feature/home/presentation/ui/home_page.dart';
import 'package:tvmaze/feature/series/presentation/ui/serie_page.dart';

class AppRouter {
  static Map<String, WidgetBuilderArgs?> get routes => {
        '/': (context, args) => const HomePage(),
        '/serie-details': (context, args) => SeriePage(id: args as int),
        '/episode-details': (context, args) => EpisodeDetailsPage(
              episode: args as EpisodeModel,
            ),
      };

  static void registerRouters() {
    namedRoutes.addAll(routes);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];

    if (navigateTo == null) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: FlutterError(
            'No route defined for \'$routerName\'',
          ),
          library: 'tvmaze',
          stack: StackTrace.current,
        ),
      );
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for $routerName')),
        ),
      );
      ;
    }

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}
