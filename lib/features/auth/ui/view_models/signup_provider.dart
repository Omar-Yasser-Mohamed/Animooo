import 'package:animoo/core/shared/models/user_model.dart';
import 'package:animoo/core/shared/services/image_picker_service.dart';
import 'package:animoo/core/shared/states/ui_state.dart';
import 'package:animoo/features/auth/data/models/signup_request.dart';
import 'package:animoo/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupProvider extends ChangeNotifier {
  final AuthRepo _authRepo;
  final ImagePickerService _imagePickerService;

  SignupProvider(this._authRepo, this._imagePickerService);

  UiState<UserModel> _signupState = Initial();
  UiState<UserModel> get signupState => _signupState;

  XFile? _image;
  XFile? get image => _image;

  bool validateImage() {
    return _image != null;
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await _imagePickerService.pickImage(source: source);
    if (pickedImage != null) {
      _image = pickedImage;
      notifyListeners();
    }
  }

  void removeImage() {
    _image = null;
    notifyListeners();
  }

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    _signupState = Loading();
    notifyListeners();

    final result = await _authRepo.signup(
      SignupRequest(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        password: password,
        image: _image?.path ?? "",
      ),
    );

    result.fold(
      (failure) {
        _signupState = Error(failure);
      },
      (user) {
        _signupState = Success(user);
      },
    );
    notifyListeners();
  }
}

