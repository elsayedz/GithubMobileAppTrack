import 'package:flutter/material.dart';
import 'package:github_mobile_app/widgets/big_button.dart';
import '../utils/auth_handler.dart';
import '../utils/user_input_validator.dart';

class SignUpScreen extends StatefulWidget {
  static const String screenName = "signup_screen";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userConfirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Text(
                "REGISTER",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: userEmailController,
                      validator: (val) => Validator.validateEmail(email: val),
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Text("Password"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: userPasswordController,
                      obscureText: true,
                      validator: (val) =>
                          Validator.validatePassword(password: val),
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Text("Confirm Password"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: userConfirmPasswordController,
                      validator: (val) => Validator.validateConfirmPass(
                          password: userPasswordController.text,
                          confirmPassword: val),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  BigButton(
                    paddingHorizontal: 0.0,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        print("VALIDDDDD");
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            });

                        bool didCreateAccount = await AuthHandler.createAccount(
                            email: userEmailController.text,
                            pass: userPasswordController.text);
                        if (didCreateAccount) {
                          Navigator.pushReplacementNamed(context, "/");
                        } else {
                          // TODO: Add show dialog box to show error
                          Navigator.pop(context);
                        }
                      }
                    },
                    title: 'Sign Up',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
