import 'package:flutter/material.dart';
import 'package:myartist/src/features/home/home.dart';
import 'package:myartist/src/shared/views/clickable.dart';

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
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 275,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/dashatar_guitar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
