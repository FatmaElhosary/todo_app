import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const GlobalButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          fixedSize: Size(MediaQuery.of(context).size.width, 50)),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}
