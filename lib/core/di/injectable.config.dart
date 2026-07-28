// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:animoo/core/di/di_module.dart' as _i793;
import 'package:animoo/core/network/api_service.dart' as _i991;
import 'package:animoo/core/network/dio_service.dart' as _i675;
import 'package:animoo/core/network/network_connectivity.dart' as _i377;
import 'package:animoo/core/shared/services/image_picker_service.dart' as _i498;
import 'package:animoo/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i584;
import 'package:animoo/features/auth/data/data_sources/auth_remote_data_source_impl.dart'
    as _i107;
import 'package:animoo/features/auth/data/repos/auth_repo.dart' as _i102;
import 'package:animoo/features/auth/data/repos/auth_repo_impl.dart' as _i617;
import 'package:animoo/features/auth/ui/view_models/login_provider.dart'
    as _i624;
import 'package:animoo/features/auth/ui/view_models/signup_provider.dart'
    as _i323;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
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
    gh.lazySingleton<_i895.Connectivity>(() => appModule.connectivity);
    gh.lazySingleton<_i675.DioService>(() => _i675.DioService());
    gh.lazySingleton<_i377.NetworkConnectivity>(
      () => _i377.NetworkConnectivity(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i498.ImagePickerService>(
      () => _i498.ImagePickerService(
        gh<_i183.ImagePicker>(),
        gh<_i184.ImageCropper>(),
      ),
    );
    gh.lazySingleton<_i991.ApiService>(
      () => _i991.ApiService(
        gh<_i675.DioService>(),
        gh<_i377.NetworkConnectivity>(),
      ),
    );
    gh.lazySingleton<_i584.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(gh<_i991.ApiService>()),
    );
    gh.lazySingleton<_i102.AuthRepo>(
      () => _i617.AuthRepoImpl(gh<_i584.AuthRemoteDataSource>()),
    );
    gh.factory<_i624.LoginProvider>(
      () => _i624.LoginProvider(gh<_i102.AuthRepo>()),
    );
    gh.factory<_i323.SignupProvider>(
      () => _i323.SignupProvider(
        gh<_i102.AuthRepo>(),
        gh<_i498.ImagePickerService>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i793.AppModule {}
