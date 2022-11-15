import 'package:Star_Wars/theme/colors.dart';
import 'package:flutter/material.dart';



successSnackBar(String message) {
  return SnackBar(
    duration: Duration(seconds: 5),
    content: Text(
      message,
      style: TextStyle(color: TrustPostWhite, fontSize: 16),
    ),
    backgroundColor: TrustPostSuccess,
  );
}

failSnackBar(String message) {
  return SnackBar(
    duration: Duration(seconds: 5),
    content: Text(
      message,
      style: TextStyle(color: TrustPostWhite, fontSize: 16),
    ),
    backgroundColor: TrustPostWarning,
  );
}
