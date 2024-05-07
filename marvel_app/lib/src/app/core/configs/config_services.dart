import 'package:shared_interfaces/shared_interfaces.dart';

import '../../../_exports.dart';

class ConfigServicesImpl implements IConfigServices {
  final IEnvironmentService environmentService;

  ConfigServicesImpl({required this.environmentService});

  @override
  Map<Environment, Map<String, String>> configs() {
    return {
      Environment.dev: {
        ConfigServicesConstants.charactersMarvel: '/characters',
      },
      Environment.prod: {
        ConfigServicesConstants.charactersMarvel: '/characters',
      },
    };
  }

  @override
  String? getConfigByEnv({required String env}) {
    return (configs()[environmentService.env] ?? <String, String>{})[env];
  }
}
