import 'package:flutter/material.dart';
import 'package:myartist/src/features/home/home.dart';

class AuthGuardHighlight extends StatelessWidget {
  const AuthGuardHighlight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'myartist',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        HomeHighlight(),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'To see your favorite artists, please sign in',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}
