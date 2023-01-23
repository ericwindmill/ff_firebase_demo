import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:myartist/src/shared/auth_highlight.dart';

import '../features/home/home.dart';
import 'router.dart';
import 'views/views.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              toolbarHeight: kToolbarHeight * 2,
              actions: const [BrightnessToggle()],
              title: Text('Good Morning'),
            ),
            body: Column(
              children: [
                AuthGuardHighlight(),
                Flexible(
                  child: SignInScreen(
                    providers: [
                      GoogleProvider(
                        clientId: googleOAuthKey,
                      )
                    ],
                  ),
                ),
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
