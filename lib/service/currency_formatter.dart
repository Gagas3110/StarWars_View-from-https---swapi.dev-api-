import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';

class CurrencyUtil {
  int idrToLong(String val) {
    String newVal = val.replaceAll(".", "");
    return int.parse(newVal);
  }

  String idr(int val) {
    final formater = new NumberFormat("#,###");
    String idrVal = formater.format(val).replaceAll(",", ".");
    return "IDR " + idrVal;
  }

  String toIdr(String val) {
    String finalVal = "";
    // ignore: unnecessary_null_comparison
    if (val != null && val.trim() != "") {
      final formatter = new NumberFormat("#,###");
      String x = val.replaceAll(".", "");
      int intval = int.parse(x);
      finalVal = formatter.format(intval).replaceAll(",", ".");
    }

    return finalVal;
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }

    String finalVal = "";
    // ignore: unnecessary_null_comparison
    if (newValue.text != null && newValue.text.trim() != "") {
      final formatter = new NumberFormat("#,###");
      String x = newValue.text.replaceAll(".", "");
      int intval = int.parse(x);
      finalVal = formatter.format(intval).replaceAll(",", ".");
    }

    return newValue.copyWith(
        text: finalVal,
        selection: new TextSelection.collapsed(offset: finalVal.length));
  }
}

String setUpSeparator(int number) {
  NumberFormat numberFormat = NumberFormat.decimalPattern('id');
  return numberFormat.format(number);
}

String setForrmatNumber(double number) {
  NumberFormat numberFormat = NumberFormat.decimalPattern('id');
  String step2 = number.toStringAsFixed(2);
  double step3 = double.parse(step2);
  return numberFormat.format(step3);
  //return numberFormat(".##").format(number);
}

String setForrmatNumberNonPPN(double number) {
  NumberFormat numberFormat = NumberFormat.decimalPattern('id');
  String step2 = number.toStringAsFixed(0);
  double step3 = double.parse(step2);
  return numberFormat.format(step3);
  //return numberFormat(".##").format(number);
}
