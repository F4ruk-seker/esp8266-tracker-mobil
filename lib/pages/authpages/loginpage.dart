import 'package:flutter/material.dart';

import '/pars_generic/inputBar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  late bool username_vailed = false;
  final password = TextEditingController();
  late bool password_vailed = false;
  final _formKey = GlobalKey<FormState>();
  String errMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        ),
        title: Text('Login | Pars'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: InputBar(
                            hintText: 'username',
                            isPassword: false,
                            isValied: username_vailed,
                            controller: username,
                            mainColor: Colors.white,
                            focusColor: Colors.cyan,
                            textColor: Colors.blue),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: InputBar(
                            hintText: 'password',
                            isPassword: true,
                            isValied: password_vailed,
                            controller: password,
                            mainColor: Colors.white,
                            focusColor: Colors.cyan,
                            textColor: Colors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
