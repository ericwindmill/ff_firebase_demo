import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

import '../features/home/home.dart';
import 'router.dart';
import 'views/views.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: const Text('Good morning'),
              actions: const [BrightnessToggle()],
            ),
            body: SignInScreen(
              headerBuilder: (context, constraints, shrinkOffset) {
                return Center(
                  child: Text(
                    'To see your favorite artists, please sign in.',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              },
              providers: [
                GoogleProvider(
                    clientId:
                        '1007448672439-6d3mlihnvjf0jemmifgccqhtsdj02rk1.apps.googleusercontent.com'),
              ],
            ),
          );
        }

        return RootLayout(
          key: scaffoldKey,
          currentIndex: 0,
          child: HomeScreen(),
        );
      },
    );
  }
}
