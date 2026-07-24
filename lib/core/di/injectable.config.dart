// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:animoo/core/di/di_module.dart' as _i793;
import 'package:animoo/core/shared/services/image_picker_service.dart' as _i498;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_cropper/image_cropper.dart' as _i184;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i183.ImagePicker>(() => appModule.imagePicker);
    gh.lazySingleton<_i184.ImageCropper>(() => appModule.imageCropper);
    gh.lazySingleton<_i498.ImagePickerService>(
      () => _i498.ImagePickerService(
        gh<_i183.ImagePicker>(),
        gh<_i184.ImageCropper>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i793.AppModule {}
