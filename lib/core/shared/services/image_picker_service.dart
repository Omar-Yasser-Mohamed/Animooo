import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:image_cropper/image_cropper.dart';

@lazySingleton
class ImagePickerService {
  final ImagePicker _picker;
  final ImageCropper _cropper;

  ImagePickerService(this._picker, this._cropper);

  Future<XFile?> pickImage({
    int imageQuality = 85,
    double? maxWidth = 1080,
    double? maxHeight = 1080,
    CropAspectRatio? aspectRatio,
    ImageSource source = ImageSource.gallery,
  }) async {
    try {
      final picked = await _picker.pickImage(
        source: source,
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );

      if (picked == null) return null;

      final cropped = await _cropper.cropImage(
        sourcePath: picked.path,
        aspectRatio: aspectRatio,
      );

      if (cropped == null) return null;

      return XFile(cropped.path);
    } catch (_) {
      return null;
    }
  }

  Future<List<XFile>> pickMultipleImages({
    int imageQuality = 85,
    double? maxWidth,
    double? maxHeight,
    int? limit,
  }) async {
    try {
      final images = await _picker.pickMultiImage(
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        limit: limit,
      );

      return images;
    } catch (_) {
      return [];
    }
  }
}