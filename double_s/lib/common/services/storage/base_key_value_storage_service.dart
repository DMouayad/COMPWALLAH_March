import 'dart:async';

/// The interface to be implemented by real Key-Value storage databases.
abstract interface class BaseKeyValueStorageService {
  FutureOr<void> init();

  /// Return the value of the given [key].
  ///
  /// On error, it returns `null`.
  FutureOr<String?> getString(String key);
  FutureOr<int?> getInt(String key);
  FutureOr<bool?> getBool(String key);
  FutureOr<double?> getDouble(String key);

  /// Store/update the value of the given [key].
  ///
  /// On error, it returns `false`.
  FutureOr<bool> set(String key, dynamic value);

  /// Delete the value associated with the given [key].
  ///
  /// On error, it returns `false`.
  FutureOr<bool> delete(String key);

  /// Deletes all stored key-value pairs.
  /// On error, it returns `false`.
  FutureOr<bool> clear();
}
