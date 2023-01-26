import 'package:flutter/material.dart';
import 'package:lab06/pages/login.dart';
import 'package:lab06/pages/services/auth_service.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({super.key});

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
                    print(_emailController.text);
                    AuthService.registerUser(
                            _emailController.text, _passwordController.text)
                        .then((value) {
                      if (value == 1) {
                        Navigator.pop(context);
                      }
                    });
                  }
                },
                child: const Text("Register")),
          ],
        ),
      )),
    );
  }
}
