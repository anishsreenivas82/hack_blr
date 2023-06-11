import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hack_blr/services/api.dart';
import 'display.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier _loginStatus = ValueNotifier('Not Logged In');
    var api = API();
    // var signIn = api.emailLogin(emailAddress, password)
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        // print('User is signed in!');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Display(fundsAllocated: 80000, fundsLeft: 3000)),
        );
      }
    });
    return Scaffold(
        body: Center(
          child: Column(
              children: [
                SizedBox(height: 250,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    // border: UnderlineInputBorder(),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              child: TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    // border: UnderlineInputBorder(),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  )),
            ),
          ),
          TextButton(
            child: ValueListenableBuilder(
                valueListenable: _loginStatus,
                builder: (context, loading, child) {
                  return _loginStatus.value == 'Loading'
                      ? const CircularProgressIndicator()
                      : const Text('Sign IN');
                }),
            onPressed: () {
              _loginStatus.value = 'Loading';
              _loginStatus.value =
                  api.emailLogin(_emailController.text, _passwordController.text);
            },
          )
              ],
            ),
        ));
  }
}
