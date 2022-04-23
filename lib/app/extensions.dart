// extension on String

import 'package:cma_admin/data/mapper/mapper.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

// extension on Integer

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZeroD() {
    if (this == null) {
      return ZEROD;
    } else {
      return this!;
    }
  }
}

extension NonNullBolean on bool? {
  bool orFalse() {
    if (this == null) {
      return FALSE;
    } else {
      return this!;
    }
  }
}
