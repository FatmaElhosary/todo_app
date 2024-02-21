import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
      textAlign: TextAlign.center,
    );
  }
}