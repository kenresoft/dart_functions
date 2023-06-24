extension S<R> on R {
  T? let<T>(T? Function(R it) block) {
    if (this == null) {
      return null;
    }
    return block(this);
  }
}

extension SgExt on String? {
  String? get toFirstUpperCase {
    //final first = this!.substring(0, 1).toUpperCase();
    try {
      final first = this![0].toUpperCase();
      final last = this!.substring(1);
      return first + last;
    } catch (e) {
      return e.toString();
    }
    //return this?.let((it) => it[0].toUpperCase() + it.substring(1));
  }
}
