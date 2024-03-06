import 'package:flutter/material.dart';

class GlobalTextField extends StatefulWidget {
  final String? hint;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final bool isPassword;
  const GlobalTextField({
    super.key,
    this.hint,
    this.maxLines = 1,
    required this.controller,
    this.validator,
    this.labelText,
    this.isPassword = false,
  });

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  bool isObsucure = false;
  @override
  void initState() {
    isObsucure = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.go,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      maxLines: widget.maxLines,
      obscureText: isObsucure,
      decoration: InputDecoration(
          suffixIconColor: Theme.of(context).colorScheme.primary,
          hintText: widget.hint,
          label: widget.labelText != null ? Text(widget.labelText!) : null,
          hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 20,
              color: Theme.of(context).colorScheme.onPrimaryContainer),
          labelStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 20,
              color: Theme.of(context).colorScheme.onPrimaryContainer),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    isObsucure = !isObsucure;
                    setState(() {});
                  },
                  icon: isObsucure
                      ? const Icon(
                          Icons.visibility_off_outlined,
                        )
                      : const Icon(
                          Icons.visibility_outlined,
                        ))
              : null),
    );
  }
}
