import 'package:flutter/material.dart';
import 'package:double_s/ui/utils/context_extensions.dart';

/// A unified custom exception.
///
/// - Used to get the (translated) message of a thrown exception.
enum AppException {
  // Missing data
  roleNotFound,
  // Connection & Internet
  noInternetConnectionFound,
  cannotConnectToServer,
  // Authorization
  userUnauthorized,
  unauthorizedToRegister,
  // Authentication
  loginIsRequired,
  emailAlreadyRegistered,
  invalidEmailCredential,
  invalidPasswordCredential,
  failedToRefreshTokens,
  // API & HTTP requests
  invalidApiRequest,
  // Misc
  decodingJsonFailed,

  /// indicates that an unknown error has occurred or an un expected exception
  /// was thrown.
  ///
  /// - This applies for unregistered\unknown API exceptions,
  /// an exception from external packages, etc.
  /// - This error should be found in the logs to.
  undefined;

  const AppException();

  String getMessage(BuildContext context) {
    return switch (this) {
      AppException.noInternetConnectionFound =>
        context.localizations.cannotConnectToServer,
      _ => context.localizations.unknownErrorMessage,
    };
  }
}
