enum FailureCode {
  network,
  timeout,
  unauthorized,
  forbidden,
  sessionExpired,
  badRequest,
  notFound,
  conflict,
  server,
  cache,
  database,
  validation,
  emptyData,
  cancelled,
  emailAlreadyExists,
  accountNotVerified,
  accountNotExists,
  invalidVerficationCode,
  unknown,
}

extension FailureCodeExtension on FailureCode {
  String get message {
    switch (this) {
      case FailureCode.network:
        return 'No internet connection';
      case FailureCode.timeout:
        return 'Connection timed out';
      case FailureCode.unauthorized:
        return 'Authentication required';
      case FailureCode.forbidden:
        return 'Access denied';
      case FailureCode.sessionExpired:
        return 'Session expired. Please sign in again';
      case FailureCode.badRequest:
        return 'Invalid request';
      case FailureCode.notFound:
        return 'Resource not found';
      case FailureCode.conflict:
        return 'Request conflict';
      case FailureCode.server:
        return 'Server error. Please try again';
      case FailureCode.cache:
        return 'Unable to load saved data';
      case FailureCode.database:
        return 'Database operation failed';
      case FailureCode.validation:
        return 'Invalid input details';
      case FailureCode.emptyData:
        return 'No data found';
      case FailureCode.cancelled:
        return 'Request cancelled';
      case FailureCode.emailAlreadyExists:
        return 'Email already exists';
      case FailureCode.accountNotVerified:
        return 'Account not verified';
      case FailureCode.accountNotExists:
        return 'Account not exists';
      case FailureCode.invalidVerficationCode:
        return 'Invalid verfication code';
      case FailureCode.unknown:
        return 'Something went wrong';
    }
  }
}