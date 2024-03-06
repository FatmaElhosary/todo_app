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

bool isValidEmail(String email) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}
