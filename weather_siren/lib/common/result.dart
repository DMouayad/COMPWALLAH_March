import 'package:weather_siren/common/error/app_error.dart';
import 'package:option_result/option_result.dart';

/// MyClinicResult, a [Type] alias for [Result] which has an error of type [AppError].
typedef MCResult<T> = Result<T, AppError>;

/// MyClinicResult, a [Type] alias for [FutureResult] which has an error of type [AppError].
typedef FutureMCResult<T> = FutureResult<T, AppError>;

/// MyClinicResult, a [Type] alias for [FutureOrResult] which has an error of type [AppError].
typedef FutureOrMCResult<T> = FutureOrResult<T, AppError>;

typedef VoidResult = Result<(), AppError>;
typedef FutureVoidResult = FutureResult<(), AppError>;
typedef FutureOrVoidResult = FutureOrResult<(), AppError>;

const VoidResult okVoidResult = Ok(());

extension ResultExtension<T, E> on Result<T, E> {
  /// Returns an [Err<U, E>] if this `Result` is [Err<T, E>],
  /// otherwise calls [fn] with the obtained [Ok] value, await for its [Result] then return it.
  ///
  /// This method doesn't exist in the Rust language.
  FutureResult<U, E> andThenAsync<U>(FutureResult<U, E> Function(T) fn) async {
    return switch (this) { Ok(:T v) => await fn(v), Err(:E e) => Err(e) };
  }

  FutureResult<T, E> foldAsync({
    Future<void> Function(T)? onOk,
    Future<void> Function(E)? onErr,
  }) async {
    if (isOk() && onOk != null) await onOk(unwrap());
    if (isErr() && onErr != null) await onErr(unwrapErr());
    return this;
  }
}
