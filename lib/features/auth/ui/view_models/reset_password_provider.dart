import 'package:animoo/core/shared/states/ui_state.dart';
import 'package:animoo/features/auth/data/models/auth_response.dart';
import 'package:animoo/features/auth/data/models/reset_password_request.dart';
import 'package:animoo/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordProvider extends ChangeNotifier {
  final AuthRepo _authRepo;
  ResetPasswordProvider(this._authRepo);

  UiState<AuthResponse> _uiState = Initial();
  UiState<AuthResponse> get uiState => _uiState;

  Future<void> resetPassword(ResetPasswordRequest request) async {
    _uiState = Loading();
    notifyListeners();
    final response = await _authRepo.resetPassword(request);
    response.fold(
      (failure) {
        _uiState = Error(failure);
      },
      (authResponse) {
        _uiState = Success(authResponse);
      },
    );
    notifyListeners();
  }
}
