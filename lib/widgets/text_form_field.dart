import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  final String hint;
  final int? maxLines;
  final TextEditingController controller;
  const GlobalTextField({super.key, required this.hint, this.maxLines,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
