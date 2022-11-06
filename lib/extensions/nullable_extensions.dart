extension ObjectExt<T> on T {
  /// equivalent to Kotlin's val?.let { it -> someLogic }
  ///
  /// usage:
  ///
  /// int? x = null; x?.let((it) => someLogic)
  R let<R>(R Function(T it) op) => op(this);
}

extension ListUtils<T> on List<T?>? {
  List<T> orEmpty() {
    return filterNotNull();
  }

  List<T> filterNotNull() {
    final List<T> list = [];
    this?.forEach((element) {
      if (element != null) list.add(element);
    });
    return list;
  }
}
