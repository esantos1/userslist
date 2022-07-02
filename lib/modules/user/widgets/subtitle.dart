import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String label;
  const Subtitle({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        Divider(color: color.withOpacity(0.4)),
        SizedBox(height: 8),
      ],
    );
  }
}
