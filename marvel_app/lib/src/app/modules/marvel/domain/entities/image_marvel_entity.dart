import 'package:equatable/equatable.dart';

class ImageMarvelEntity extends Equatable {
  final String imageLink;
  final String imageExtension;

  const ImageMarvelEntity({
    required this.imageLink,
    required this.imageExtension,
  });

  @override
  List<Object?> get props => [imageLink, imageExtension];
}
