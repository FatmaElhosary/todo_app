import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final String hint;
  final int? maxLines;
  const GlobalTextField({super.key, required this.hint, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 20,
              color: Theme.of(context).colorScheme.onPrimaryContainer)),
    );
  }
}
