import 'package:shared_interfaces/shared_interfaces.dart';

abstract class IMarvelRequest {
  ApiRequest apiRequestListMarvel({int? page});
  ApiRequest apiRequestMarvelDetails({required int id});
}
