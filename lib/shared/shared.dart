import 'package:flutter/material.dart';

SnackBar getSnackbar(String textContent, {SnackBarAction? snackBarAction}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(textContent),
    action: snackBarAction,
  );
}
