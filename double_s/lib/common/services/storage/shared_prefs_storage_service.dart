import 'dart:async';

import 'package:logger/logger.dart';
import 'package:double_s/app/app.dart';
import 'package:double_s/common/helpers.dart';
import 'package:double_s/common/services/storage/base_key_value_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';

final class SharedPrefsStorageService
    implements BaseKeyValueStorageService, InitializableDependency {
  late final SharedPreferences _storage;

  /// A [Logger] instance for this class.
  Logger get _logger => getLogger(runtimeType.toString());

  @override
  Future<void> init() async {
    _storage = await SharedPreferences.getInstance();
  }

  @override
  FutureOr<bool> clear() async {
    return await catchAndLog(
      _logger,
      onError: false,
      fn: () async => await _storage.clear(),
    );
  }

  @override
  FutureOr<bool> delete(String key) async {
    return await catchAndLog(
      _logger,
      onError: false,
      fn: () async => await _storage.remove(key),
    );
  }

  @override
  FutureOr<String?> getString(String key) async {
    return await catchAndLog(
      _logger,
      onError: null,
      fn: () async => _storage.getString(key),
    );
  }

  @override
  FutureOr<int?> getInt(String key) async {
    return await catchAndLog(
      _logger,
      onError: null,
      fn: () => _storage.getInt(key),
    );
  }

  @override
  FutureOr<double?> getDouble(String key) async {
    return await catchAndLog(
      _logger,
      onError: null,
      fn: () => _storage.getDouble(key),
    );
  }

  @override
  FutureOr<bool?> getBool(String key) async {
    return await catchAndLog(
      _logger,
      onError: null,
      fn: () => _storage.getBool(key),
    );
  }

  T? _parseString<T>(String? str) {
    if (str == null) return null;
    return switch (T) {
      const (String) => str as T,
      const (int) => int.tryParse(str) as T?,
      const (double) => double.tryParse(str) as T?,
      const (bool) => bool.tryParse(str) as T?,
      _ => null,
    };
  }

  @override
  FutureOr<bool> set(String key, value) async {
    return await catchAndLog(
      _logger,
      onError: false,
      fn: () async {
        switch (value.runtimeType) {
          case const (String):
            return await _storage.setString(key, value);
          case const (bool):
            return await _storage.setBool(key, value);
          case const (int):
            return await _storage.setInt(key, value);
          case const (double):
            return await _storage.setDouble(key, value);
          case _:
            return await _storage.setString(key, value.toString());
        }
      },
    );
  }
}
