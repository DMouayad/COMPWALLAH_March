import 'package:flutter/material.dart';
//
import 'package:double_s/app/app.locator.dart';
import 'package:double_s/common/services/storage/base_key_value_storage_service.dart';
import 'package:stacked/stacked_annotations.dart';

class LocaleService implements InitializableDependency {
  LocaleService();
  static const _localeKey = 'locale_storage';
  static const _useSystemLocaleKey = 'should_use_system_locale';

  /// Used to allow the user to choose if he want to use the system(device)'s language.
  static const systemLocale = Locale('system');

  BaseKeyValueStorageService get _storage => locator.get();

  late final ValueNotifier<LocaleState> notifier;

  LocaleState get localeState => notifier.value;
  Locale? get currentLocale => notifier.value.selectedLocale;

  @override
  Future<void> init() async {
    notifier = ValueNotifier(LocaleState(
      selectedLocale: await _getStoredLocale(),
      useSystemLocale: (await _storage.getBool(_useSystemLocaleKey)) ?? true,
    ));
  }

  Future<Locale?> _getStoredLocale() async {
    return switch (await _storage.getString(_localeKey)) {
      final String langCode => Locale(langCode),
      _ => null
    };
  }

  /// Update selected [Locale].
  /// It also notifies the locale [notifier] listeners.
  Future<void> setLocale(Locale locale) async {
    if (locale == systemLocale) {
      await _storage.set(_useSystemLocaleKey, true);
      notifier.value = localeState.copyWith(useSystemLocale: true);
    } else {
      await _storage.set(_localeKey, locale.languageCode);
      await _storage.set(_useSystemLocaleKey, false);

      notifier.value = localeState.copyWith(
        selectedLocale: locale,
        // we set this to `false` because the user has selected a specific locale
        // which may or may not be the same as the device locale.
        useSystemLocale: false,
      );
    }
  }
}

/// Represents what [Locale] to use for the app.
class LocaleState {
  /// Whether if the user wants to use the device language.
  ///
  /// - If `true`, [selectedLocale] will be ignored and determining the locale will
  /// be done by `MaterialApp.localeResolutionCallback`.
  /// - Default is `true`.
  final bool useSystemLocale;

  /// The language selected by the user.
  ///
  /// - Can be `null` if the user haven't changed the language *yet*.
  final Locale? selectedLocale;

  const LocaleState({this.useSystemLocale = true, this.selectedLocale});

  LocaleState copyWith({bool? useSystemLocale, Locale? selectedLocale}) {
    return LocaleState(
      useSystemLocale: useSystemLocale ?? this.useSystemLocale,
      selectedLocale: selectedLocale ?? this.selectedLocale,
    );
  }
}
