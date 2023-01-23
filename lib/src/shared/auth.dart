import 'package:flutter/material.dart';

import '../features/home/home.dart';
import 'auth_gate_highlight.dart';
import 'router.dart';
import 'views/views.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
                  child: Container(),
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
