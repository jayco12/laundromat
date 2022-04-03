import 'package:flutter/material.dart';
import '../Datamodel/gentitemmodel.dart';

class Gent extends StatelessWidget {
  final Gentitemmodel gentItemModel;

  const Gent({Key? key, required this.gentItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        // height: 120,
        width: 300,

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(height: 12),

              Text(gentItemModel.item),

              Text(gentItemModel.price),
            ],
          ),
        ),
      ),
    );
  }
}
