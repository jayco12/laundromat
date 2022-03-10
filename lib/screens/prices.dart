import 'package:flutter/material.dart';

class prices extends StatefulWidget {
  const prices({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<prices> createState() => _pricesState();
}

class _pricesState extends State<prices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('prices'),
      ),
      body: Column(children: [
        Text('POPULAR '
            'Shirts (without hanger) N300'
            'Shirts (with hanger) N400 '
            'Trousers/Skirts N300 '
            'Polo/T-shirts N250 '
            'Dress N300 '
            ' Bed Sheets N500 '
            'GENTS '
            'Shirts N300 '
            'Trousers N250 '
            'Complete Suit N1,000 '
            'Jean Trousers N300 '
            'Shorts N300'
            'Native Attire (2 pieces) N1,000 '
            'Native Attire (3 pieces) N1,500 '
            'LADIES '
            'Shirt N300 '
            'Trousers/Skirt N250 ')
      ]),
    );
  }
}
