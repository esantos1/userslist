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

class DataViewWidget extends StatelessWidget {
  final String label;
  final Widget? icon;
  final String value;

  const DataViewWidget({
    Key? key,
    required this.label,
    this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.5),
            ),
            child: ListTile(
              leading: icon,
              title: Text(value, style: TextStyle(fontSize: 14.0)),
            ),
          ),
        ],
      );
}
