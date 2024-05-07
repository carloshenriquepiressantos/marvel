import 'package:micro_app_login/_exports.dart';
import 'package:micro_core/_exports.dart';

class MicroAppLogin implements MicroApp {
  @override
  String get microAppName => 'micro_app_login';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/login': (context, args) => const LoginPage(),
      };
}
