import 'package:flutter/material.dart';

import '../features/home/home.dart';
import 'router.dart';
import 'views/views.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              toolbarHeight: kToolbarHeight * 2,
              actions: const [BrightnessToggle()],
              title: Text('Good Morning'),
              bottom: PreferredSize(
                preferredSize: Size(50, 25),
                child: Text(
                  'To see your favorite artists, please sign in.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            body: Container(),
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
