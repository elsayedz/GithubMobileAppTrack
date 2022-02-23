import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_mobile_app/screens/home_screen.dart';
import 'package:github_mobile_app/screens/signup_screen.dart';
import 'package:github_mobile_app/utils/auth_handler.dart';
import 'package:github_mobile_app/widgets/big_button.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
      routes: {
        SignUpScreen.screenName: (context) => SignUpScreen(),
        HomeScreen.screenName: (context) => HomeScreen(),
      },
    );
  }
}

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigButton(
              title: 'Sign Up',
              textColor: Colors.white,
              colour: Colors.orange,
              borderColor: Colors.orange,
              onPressed: () {
                print('Hello');
                Navigator.pushNamed(context, SignUpScreen.screenName);
              },
            ),
            BigButton(
              title: 'Sign in with Google',
              textColor: Colors.white,
              colour: Colors.blue.shade800,
              onPressed: () async {
                print('Hello');
                User? user = await AuthHandler.signInWithGoogle();
                if (user != null) {
                  Navigator.pushReplacementNamed(
                      context, HomeScreen.screenName);
                }
              },
            ),
            BigButton(
              title: 'Tutorial Screens',
              textColor: Colors.white,
              colour: Colors.blue.shade800,
              onPressed: () async {},
            ),
          ],
        ),
      ),
    );
  }
}
