import 'package:flutter/foundation.dart';

class Audit {
  final String? createBy;
  final String? updateBy;
  final DateTime? updateOn;
  final DateTime? createOn;

  Audit({
    @required this.createBy,
    @required this.updateBy,
    @required this.updateOn,
    @required this.createOn,
  });
}
