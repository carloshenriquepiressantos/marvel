import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/app/core/bindings/bindings.dart';
import 'src/app/core/routes/routes.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // InitialBindings().dependencies();
  runApp(const MarvelApp());
}

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Marvel App',
      initialRoute: '/home',
      getPages: Routes.appRoutes(),
    );

    //  return  MaterialApp.router(
    //     title: 'Marvel App',

    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
    //       useMaterial3: true,
    //     ),
    //     routes: Routes.routes,
    //     // initialRoute: Routes.home,
    //     // routerConfig: Routes.routes,
    //   );
  }
}
