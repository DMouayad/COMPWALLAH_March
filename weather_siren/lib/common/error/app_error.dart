import 'dart:core';

//
import 'package:equatable/equatable.dart';

//
import 'app_exception.dart';
export 'app_exception.dart';

/// App Context Error
class AppError extends Error with EquatableMixin {
  final String? message;
  final AppException? appException;

  /// The exception that caused the error.
  ///
  /// usually not [null] when [appException] is [AppException.external]
  final Exception? exception;
  final String? description;
  late final StackTrace st;

  AppError({
    this.message,
    this.appException,
    this.description,
    this.exception,
  }) : assert(message != null ||
            appException != null ||
            description != null ||
            exception != null) {
    st = StackTrace.current;
  }

  @override
  String toString() {
    return ''' <$runtimeType>
                 message:     $message 
                 appException:   ${appException?.name} 
                 exception:     $exception
                 description: $description ''';
  }

  @override
  List<Object?> get props => [message, description, appException, exception];

  AppError copyWith({
    String? message,
    AppException? appException,
    Exception? exception,
    String? description,
  }) {
    return AppError(
      message: message ?? this.message,
      appException: appException ?? this.appException,
      exception: exception ?? this.exception,
      description: description ?? this.description,
    );
  }
}

extension AppExceptionToError on AppException {
  AppError toError() => AppError(appException: this);
}
