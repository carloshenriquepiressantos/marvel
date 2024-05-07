import 'package:get/get.dart';
import 'package:marvel_app/src/app/modules/marvel/_exports.dart';

class MarvelController extends GetxController {
  final IGetListMarvelUsecase usecase;

  MarvelController({
    required this.usecase,
  });

  RxList<CharacterMarvelEntity> heros = <CharacterMarvelEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllMarvelCharacters();
  }

  Future<void> getAllMarvelCharacters() async {
    var result = await usecase(page: 100);
    result.fold((failure) {
      return Exception(failure);
    }, (success) {
      heros.value = success.charactersMarvel;
      return success;
    });
  }
}
