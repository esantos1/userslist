import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double? radius;
  final String? avatar;

  const UserAvatar({
    Key? key,
    this.radius = 24.0,
    this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: radius,
        backgroundImage: avatar != null ? NetworkImage(avatar!) : null,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        child: avatar == null ? Icon(Icons.person) : null,
      );
}
