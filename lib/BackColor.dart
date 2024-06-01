import 'package:flutter/material.dart';

class BackColor extends StatefulWidget {
  const BackColor({super.key});

  @override
  State<BackColor> createState() => _BackColorState();
}

class _BackColorState extends State<BackColor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(98, 236, 236, 194),
            Color.fromARGB(199, 188, 239, 239),
            Color.fromARGB(255, 143, 102, 199),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
