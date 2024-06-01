import 'package:data_pass_and_show/BackColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'login_model.dart';

class secondPage extends StatefulWidget {
  secondPage({required this.loginmodel});
  LoginModel loginmodel;
  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 206, 199),
        title:const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Welcome to Profile",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 59, 206, 199),
      body: Stack(
        children: [
          const BackColor(),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    "Your Full Name",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    //'Select Your secondPage',
                    widget.loginmodel.firstName,
                    style:const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    //'Select Your secondPage',
                    widget.loginmodel.secondName,
                    style:const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    "Your Email Address",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    //'Select Your secondPage',
                    widget.loginmodel.email,
                    style:const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                   Text(
                    "Your Student Id",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    //'Select Your secondPage',
                    widget.loginmodel.studentid,
                    style:const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Color.fromARGB(255, 0, 0, 0),
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
