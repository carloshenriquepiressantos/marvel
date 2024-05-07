import 'package:shared_interfaces/shared_interfaces.dart';

class SecretsImpl implements ISecrets {
  @override
  String apiKey() {
    return const String.fromEnvironment('publicKey',
        defaultValue: '1a27bcb5cb8d932b84a535f991cb0772');
  }

  @override
  String hash() {
    return const String.fromEnvironment('publicKey',
        defaultValue: 'ecec2e8058c4fa1b5aba8be0c205d9db');
  }

  @override
  String ts() {
    return const String.fromEnvironment('publicKey', defaultValue: '1');
  }
}
