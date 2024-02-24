import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final String hint;
  final int? maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const GlobalTextField(
      {super.key,
      required this.hint,
      this.maxLines,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 20,
              color: Theme.of(context).colorScheme.onPrimaryContainer)),
    );
  }
}
