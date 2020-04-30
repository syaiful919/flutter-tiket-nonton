import 'package:flutter/material.dart';
import 'package:tiket_nonton/services/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Sign Up'),
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.signUp(
                      'syaiful919@gmail.com',
                      '12345678',
                      'ipul',
                      ['drama', 'horror'],
                      'English');

                  (result.user == null)
                      ? print(result.message)
                      : print(result.user.toString());
                },
              ),
              RaisedButton(
                child: Text('Sign In'),
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.signIn(
                      'syaiful919@gmail.com', '12345678');

                  (result.user == null)
                      ? print(">>> " + result.message)
                      : print(">>> " + result.user.toString());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
