import 'package:animoo/core/shared/states/ui_state.dart';
import 'package:animoo/features/auth/data/models/auth_response.dart';
import 'package:animoo/features/auth/data/models/login_request.dart';
import 'package:animoo/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginProvider extends ChangeNotifier {
  LoginProvider(this._authRepo);
  final AuthRepo _authRepo;

  UiState<AuthResponse> _loginState = Initial();
  UiState<AuthResponse> get loginState => _loginState;

  Future<void> login(LoginRequest request) async {
    _loginState = Loading();
    notifyListeners();

    final result = await _authRepo.login(request);

    result.fold(
      (failure) {
        _loginState = Error(failure);
      },
      (auth) {
        _loginState = Success(auth);
      },
    );
    notifyListeners();
  }
}
