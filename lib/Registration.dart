import 'package:flutter/material.dart';
import 'package:data_pass_and_show/LogIn.dart';
import 'package:data_pass_and_show/BackColor.dart';
import 'package:http/http.dart' as http;
import 'package:data_pass_and_show/api.dart';
import 'dart:convert';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController SecondnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController StudentidController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  TextEditingController createdByController = TextEditingController();

  String? password;

  insertApi() async {
    if (password1Controller.text != password2Controller.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    password = password1Controller.text;

    final response = await http.post(
      Uri.parse('http://${Api_name().api}/data_pass_and_show/insert.php'),
      body: jsonEncode(<String, dynamic>{
        "FirstName": firstnameController.text,
        "SecondName": SecondnameController.text,
        "Email": emailController.text,
        "Studentid": StudentidController.text,
        "password": password,
        "created_by": createdByController.text,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LogIn()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackColor(), // Background gradient
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  const SizedBox(height: 60),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          maxLength: 50,
                          controller: firstnameController,
                          decoration: const InputDecoration(
                            labelText: 'Enter your First Name',
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
                        const SizedBox(height: 10),
                        TextFormField(
                          maxLength: 50,
                          controller: SecondnameController,
                          decoration: const InputDecoration(
                            labelText: 'Enter your Secont Name',
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
                        const SizedBox(height: 10),
                        TextFormField(
                          maxLength: 50,
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Enter your Email',
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
                        const SizedBox(height: 10),
                        TextFormField(
                          maxLength: 50,
                          controller: StudentidController,
                          decoration: const InputDecoration(
                            labelText: 'Enter Student Id',
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
                        const SizedBox(height: 10),
                        TextFormField(
                          maxLength: 50,
                          controller: createdByController,
                          decoration: const InputDecoration(
                            labelText: 'Created By',
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
                        const SizedBox(height: 10),
                        TextFormField(
                          maxLength: 50,
                          controller: password1Controller,
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
                        const SizedBox(height: 10),
                        TextFormField(
                          maxLength: 50,
                          controller: password2Controller,
                          decoration: const InputDecoration(
                            labelText: 'Confirm your Password',
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
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                      builder: (context) => LogIn()),
                                );
                              },
                              child: const Text('Back'),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                insertApi();
                              },
                              child: const Text('Register'),
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
