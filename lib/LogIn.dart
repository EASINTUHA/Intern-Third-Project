import 'package:flutter/material.dart';
import 'package:data_pass_and_show/BackColor.dart';
import 'package:data_pass_and_show/Registration.dart';
import 'package:data_pass_and_show/secondPage.dart';
import 'package:http/http.dart' as http;
import 'package:data_pass_and_show/api.dart';
import 'package:data_pass_and_show/login_model.dart';
import 'dart:convert';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController StudentidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  
  late LoginModel loginModel;

  loginApi() async {
    final response = await http.post(
      Uri.parse('http://${Api_name().api}/data_pass_and_show/login.php'),
      body: jsonEncode(<String, dynamic>{
        "Studentid": StudentidController.text,
        "password": passwordController.text,
      }),
    );

    loginModel=loginModelFromJson(response.body);

    if (loginModel.studentid ==StudentidController.text) {
      // Show a dialog if sign in is successful
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sign In Successful"),
            content: Text("You have successfully signed in."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigate to the Homepage after closing the dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => secondPage(loginmodel: loginModel,)),
                  );
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      // Show a dialog if sign in is unsuccessful
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid student id or Password"),
            content: Text("Please enter a valid email and password."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );

  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackColor(), // Gradient background
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),
                  const SizedBox(height: 60),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    height: 250,
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: StudentidController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            labelText: 'Enter your Student Id',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 29, 126, 230),
                                width: 2.0,
                              ),
                            ),
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 29, 126, 230),
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: passwordController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            labelText: 'Enter your Password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 29, 126, 230),
                                width: 2.0,
                              ),
                            ),
                            counterText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 29, 126, 230),
                                width: 2.0,
                              ),
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (context) => const Registration()),
                                );
                              },
                              child: const Text('Register'),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: loginApi,
                              child: const Text('Log In'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
