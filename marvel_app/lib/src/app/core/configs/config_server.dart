// coverage:ignore-file

import 'package:shared_interfaces/shared_interfaces.dart';
import '../../../_exports.dart';

class ConfigServerImpl implements IConfigServer {
  final IEnvironmentService environmentService;

  ConfigServerImpl({required this.environmentService});

  @override
  Map<Environment, Map<String, String>> configs() {
    return {
      Environment.dev: {
        ConfigServicesConstants.baseUrl: 'https://gateway.marvel.com/v1/public',
      },
      Environment.prod: {
        ConfigServicesConstants.baseUrl: 'https://gateway.marvel.com/v1/public',
      },
    };
  }

  @override
  String? getConfigByEnv({required String env}) {
    return (configs()[environmentService.env] ?? <String, String>{})[env];
  }
}
