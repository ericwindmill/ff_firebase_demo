import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const AuthGate(),
      },
      initialRoute: '/',
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    final providers = <AuthProvider>[
      GoogleProvider(
        clientId:
            '1007448672439-6d3mlihnvjf0jemmifgccqhtsdj02rk1.apps.googleusercontent.com',
      ),
    ];

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: providers,
          );
        }

        return ProfileScreen(
          providers: [],
          appBar: AppBar(
            backgroundColor: Colors.white10,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child:
                  Image.asset('assets/FlutterForward_Logo_Dark_Gradient.png'),
            ),
          ),
          actions: [
            SignedOutAction((context) {
              Navigator.pushReplacementNamed(context, '/');
            }),
          ],
        );
      },
    );
  }
}
