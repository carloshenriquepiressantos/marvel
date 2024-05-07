import 'package:shared_interfaces/shared_interfaces.dart';

abstract class IConfigServer {
  Map<Environment, Map<String, String>> configs();

  String? getConfigByEnv({required String env});
}
