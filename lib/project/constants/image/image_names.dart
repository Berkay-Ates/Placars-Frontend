import 'package:placars/core/extension/image_extension.dart';

class ImagePaths {
  static ImagePaths? _instance;
  static ImagePaths get instance {
    _instance ??= ImagePaths._init();
    return _instance!;
  }

  ImagePaths._init();
  final backgroundImage = 'img_authbg'.toPNG;
}
