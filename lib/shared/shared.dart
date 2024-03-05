import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final DateFormat dateFormat = DateFormat("dd/MM/yyyy");
SnackBar getSnackbar(String textContent, {SnackBarAction? snackBarAction}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(textContent),
    action: snackBarAction,
  );
}
