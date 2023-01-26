import 'package:flutter/material.dart';
import 'package:lab06/pages/register.dart';
import 'package:lab06/pages/services/auth_service.dart';
import 'package:lab06/pages/successful.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SafeArea(
          child: Form(
        key: _formkey,
        child: ListView(
          children: [
            TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Email Please!";
                  }
                  return null;
                })),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Enter Password Please ";
                }
                return null;
              }),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    print("OK");
                    AuthService.loginUser(
                            _emailController.text, _passwordController.text)
                        .then((value) {
                      if (value == "Successful") {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuccessfulPage(),
                            ));
                      }
                    });
                  }
                },
                child: const Text("Login")),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPages(),
                    ));
              },
              child: const Text("Register"),
            ),
          ],
        ),
      )),
    );
  }
}
