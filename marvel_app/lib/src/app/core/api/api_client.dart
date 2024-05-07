import 'package:shared_app/shared_app.dart';
import 'package:shared_interfaces/shared_interfaces.dart';

class ApiClientMarvelImpl extends ApiClientHttpImpl {
  final IConfigServer configMarvelServer;

  ApiClientMarvelImpl({
    required this.configMarvelServer,
  }) : super(configServer: configMarvelServer);

  @override
  bool get enableMock => true;
}
