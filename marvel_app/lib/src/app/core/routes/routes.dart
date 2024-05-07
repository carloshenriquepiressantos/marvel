import 'package:get/get.dart';
// import 'package:flutter/foundation.dart';
import 'package:marvel_app/src/app/modules/marvel/_exports.dart';

class Routes {
  static const String home = '/home';
  static const String splash = '/splash';
  static appRoutes() => [
        GetPage(
          name: home,
          // middlewares: [MarvelMiddelware()],
          bindings: [MarvelBindings()],
          page: () => const HomeMarvelPage(),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}

// class MarvelMiddelware extends GetMiddleware {
//   @override
//   GetPage? onPageCalled(GetPage? page) {
//     debugPrint(page?.name);
//     return super.onPageCalled(page);
//   }
// }
