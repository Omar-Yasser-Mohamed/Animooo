import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  @lazySingleton
  ImageCropper get imageCropper => ImageCropper();

  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();
}
