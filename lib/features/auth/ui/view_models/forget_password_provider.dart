import 'package:animoo/core/shared/states/ui_state.dart';
import 'package:animoo/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordProvider extends ChangeNotifier {
  final AuthRepo _authRepo;
  ForgetPasswordProvider(this._authRepo);

  UiState<void> _forgetPasswordState = Initial();
  UiState<void> get forgetPasswordState => _forgetPasswordState;

  Future<void> forgetPassword(String email) async {
    _forgetPasswordState = Loading();
    notifyListeners();

    final result = await _authRepo.forgetPassword(email);

    result.fold(
      (failure) {
        _forgetPasswordState = Error(failure);
      },
      (_) {
        _forgetPasswordState = Success(null);
      },
    );
    notifyListeners();
  }
}