import 'package:animoo/core/errors/failure.dart';

sealed class UiState<T> {}

class Initial<T> extends UiState<T> {}

class Loading<T> extends UiState<T> {}

class Success<T> extends UiState<T> {
  final T data;
  Success(this.data);
}

class Error<T> extends UiState<T> {
  final Failure failure;
  Error(this.failure);
}