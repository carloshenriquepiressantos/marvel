import 'package:shared_interfaces/shared_interfaces.dart';

class EnvironmentServiceImpl implements IEnvironmentService {
  final Environment _env;

  EnvironmentServiceImpl(this._env);

  @override
  Environment get env => _env;
}

Environment getEnv() {
  var env = getFromDartEnv;
  if (env == 'prod') {
    return Environment.prod;
  }
  return Environment.dev;
}

String get getFromDartEnv =>
    const String.fromEnvironment('env', defaultValue: 'prod');
