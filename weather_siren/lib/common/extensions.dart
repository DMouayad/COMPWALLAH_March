import 'dart:math';

extension IterableExtensions<T> on Iterable<T> {
  List<String> toStringList() => map((e) => e.toString()).toList();

  bool hasType(Type type) {
    return where((element) => element.runtimeType == type).isNotEmpty;
  }

  (T, int) randomElementWithIndex() {
    final randomIndex = Random().nextInt(length - 1);
    return (elementAt(randomIndex), randomIndex);
  }

  T get randomElement {
    final randomIndex = Random().nextInt(length - 1);
    return elementAt(randomIndex);
  }

  bool containsWhere(bool Function(T element) condition) {
    return firstWhereOrNull(condition) != null;
  }

  T? firstWhereOrNull(bool Function(T element) condition) {
    try {
      return firstWhere((e) => condition(e));
    } on StateError {
      return null;
    }
  }

  List<T> whereIndices(List<int> indices) {
    final result = <T>[];
    for (int i = 0; i < length; i++) {
      if (i > length) continue;
      if (indices.contains(i)) result.add(elementAt(i));
    }
    return result;
  }
}

extension MapKeys<K, V> on Map<K, V> {
  V? whereKey(K? key) {
    if (containsKey(key)) return this[key];
    return null;
  }
}

extension DurationExtension on Duration {
  String get formatInHhMmSs {
    final hh = (inHours).toString().padLeft(2, '0');
    final mm = (inMinutes % 60).toString().padLeft(2, '0');
    final ss = (inSeconds % 60).toString().padLeft(2, '0');

    return '${hh != '00' ? '$hh:' : ''}$mm:$ss';
  }
}

extension DateTimeExtension on DateTime {
  /// returns a new [DateTime] with only the ([year], [month], [day]) properties.
  DateTime get onlyDate => DateTime(year, month, day);
}

extension Validations on String {
  bool get isValidEmail {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool get isValidPhoneNumber {
    final withoutWhiteSpace = replaceAll(" ", "");
    final regex = RegExp(r"^[^+]?\d{10,15}$");
    return regex.hasMatch(withoutWhiteSpace);
    // return RegExp(r'^[^\+]?\d{10,15}$').hasMatch(replaceAll(RegExp(" "), "")) ||
    //     RegExp(r'^\+?\d{12,15}$').hasMatch(replaceAll(RegExp(" "), ""));
  }
}
