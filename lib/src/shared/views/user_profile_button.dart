import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserProfileButton extends StatelessWidget {
  const UserProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        GoRouter.of(context).go('/profile');
      },
      icon: Icon(Icons.person),
    );
  }
}
