import 'package:flutter/material.dart';

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
