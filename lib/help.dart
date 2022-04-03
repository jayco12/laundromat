import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('help'),
      ),
      body: Column(children: const [
        Text(
            'If there is any problem, please contact us on the following number.      09041248110 ')
      ]),
    );
  }
}
