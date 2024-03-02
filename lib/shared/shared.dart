import 'package:flutter/material.dart';

SnackBar getSnackbar(String textContent, {SnackBarAction? snackBarAction}) {
  return SnackBar(
    content: Text(textContent),
    action: snackBarAction,
  );
}
