import 'dart:async';

import 'package:logger/logger.dart';

/// Executes the given function [fn] in a `try-catch` block.
/// On error\exception, it logs the error using the given [logger] and returns
/// the [onError] value.
FutureOr<T> catchAndLog<T>(
  Logger logger, {
  required T onError,
  required FutureOr<T> Function() fn,
}) async {
  try {
    return await fn();
  } catch (e) {
    logger.e(e);
    return onError;
  }
}
