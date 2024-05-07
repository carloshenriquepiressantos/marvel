import 'package:get/get.dart';
import 'package:marvel_app/src/app/modules/marvel/_exports.dart';

class MarvelBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IMarvelServices>(
        () => MarvelServicesImpl(configServices: Get.find()));

    Get.lazyPut<IMarvelRequest>(
        () => MarvelRequestImpl(secrets: Get.find(), services: Get.find()));

    Get.lazyPut<IMarvelDatasource>(
        () => MarvelDatasourceImpl(client: Get.find(), request: Get.find()));

    Get.lazyPut<IMarvelRepository>(
        () => MarvelRepositoryImpl(datasource: Get.find()));

    Get.lazyPut<IGetListMarvelUsecase>(
        () => GetListMarvelUsecaseImpl(repository: Get.find()));

    Get.lazyPut(() => MarvelController(usecase: Get.find()), fenix: true);
  }

  void dispose() {
    Get.delete<IMarvelServices>();
    Get.delete<IMarvelRequest>();
    Get.delete<IMarvelDatasource>();
    Get.delete<IMarvelRepository>();
    Get.delete<IGetListMarvelUsecase>();
    Get.delete<MarvelController>();
  }
}
