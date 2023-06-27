import 'package:fakestore_app/controller/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final bool isVisible = false;

  bool isChecked = false;

  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/quick_buy_logo1.png"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Login",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: "Email address",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    // onTap: ,
                    controller: passwordController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off),
                      labelText: "Password",
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Text(
                    "Forgot password",
                    style: TextStyle(color: Color(0xffFEB700)),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                      const Text("Remember me",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  Consumer<ProductsProvider>(
                    builder: (context, value, child) {
                      return ElevatedButton(
                          onPressed: () async {
                            final apiService = Provider.of<ProductsProvider>(
                                context,
                                listen: false);
                            final loginModel = LoginModel(
                              username: usernameController.text,
                              password: passwordController.text,
                            );
                            try {
                              await apiService.login(loginModel).then(
                                    (value) => Navigator.pushReplacementNamed(
                                        context, '/appLayout'),
                                  );
                            } catch (e) {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      title: const Text("Error"),
                                      content: Text(e.toString()),
                                      actions: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Ok")),
                                      ],
                                    );
                                  });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0183AC)),
                          child: const Text("Login",
                              style: TextStyle(color: Colors.white)));
                    },
                  ),
                ],
              ),
              RichText(
                text: const TextSpan(
                    text: "You don’t have an account?",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(color: Color(0xff0183AC)),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
