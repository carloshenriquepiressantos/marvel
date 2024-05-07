import 'package:shared_interfaces/shared_interfaces.dart';

import '../../../../../_exports.dart';
import '../../_exports.dart';

class MarvelServicesImpl implements IMarvelServices {
  final IConfigServices services;
  MarvelServicesImpl({
    required IConfigServices configServices,
  }) : services = configServices;

  @override
  String apiRequestListMarvel({int? page}) {
    final path = services.getConfigByEnv(
            env: ConfigServicesConstants.charactersMarvel) ??
        '/';
    return path;
  }

  @override
  String apiRequestMarvelDetails({required int id}) {
    final path = services.getConfigByEnv(env: 'characters/{id}') ?? '/';
    return path.replaceAll('{id}', id.toString());
  }
}
