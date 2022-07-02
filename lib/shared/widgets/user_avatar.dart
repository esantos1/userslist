import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double? radius;
  final String? avatar;
  final double? iconSize;

  const UserAvatar({
    Key? key,
    this.radius = 24.0,
    this.avatar,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: radius,
        backgroundImage: avatar != null ? NetworkImage(avatar!) : null,
        backgroundColor: Colors.grey.shade500,
        foregroundColor: Colors.white,
        child: avatar == null ? Icon(Icons.person, size: iconSize) : null,
      );
}
