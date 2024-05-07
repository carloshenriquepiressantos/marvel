import 'package:shared_interfaces/shared_interfaces.dart';
import 'package:marvel_app/src/_exports.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IEnvironmentService>(() => EnvironmentServiceImpl(getEnv()));

    Get.lazyPut<IConfigServer>(
        () => ConfigServerImpl(environmentService: Get.find()));

    Get.lazyPut<IConfigServices>(
        () => ConfigServicesImpl(environmentService: Get.find()));

    Get.lazyPut<IApiClient>(
        () => ApiClientMarvelImpl(configMarvelServer: Get.find()));

    Get.lazyPut<ISecrets>(() => SecretsImpl());
  }

  void dispose() {
    Get.delete<IEnvironmentService>();
    Get.delete<IConfigServer>();
    Get.delete<IConfigServices>();
    Get.delete<IApiClient>();
    Get.delete<ISecrets>();
  }
}
