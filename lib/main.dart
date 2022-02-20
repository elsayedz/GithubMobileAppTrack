// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github_mobile_app/screens/signup_screen.dart';
import 'package:github_mobile_app/widgets/big_button.dart';

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
      home: MyHomePage(),
      routes: {
        SignUpScreen.screenName: (context) => SignUpScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              title: 'SIGN IN WITH FACEBOOK',
              textColor: Colors.white,
              colour: Colors.blue.shade800,
              onPressed: () {
                print('Hello');
              },
            ),
          ],
        ),
      ),
    );
    // Here we take the value from the MyHomePage object that was created by
  }
}
