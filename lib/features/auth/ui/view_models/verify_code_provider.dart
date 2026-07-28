import 'package:animoo/core/shared/states/ui_state.dart';
import 'package:animoo/features/auth/data/models/auth_response.dart';
import 'package:animoo/features/auth/data/models/verification_code_request.dart';
import 'package:animoo/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyCodeProvider extends ChangeNotifier {
  VerifyCodeProvider(this._authRepo);
  final AuthRepo _authRepo;

  UiState<AuthResponse> _uiState = Initial();
  UiState<AuthResponse> get uiState => _uiState;

  Future<void> verifyCode(VerificationCodeRequest request) async {
    _uiState = Loading();
    notifyListeners();
    final result = await _authRepo.verifyCode(request);
    result.fold(
      (failure) {
        _uiState = Error(failure);
      },
      (response) {
        _uiState = Success(response);
      },
    );
    notifyListeners();
  }
}