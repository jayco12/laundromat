import 'package:flutter/material.dart';
import '../Datamodel/ladiesitemmodel.dart';

class Ladies extends StatelessWidget {
  final Ladiesitemmodel ladiesItemModel;

  const Ladies({Key? key, required this.ladiesItemModel}) : super(key: key);

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

              Text(ladiesItemModel.item),

              Text(ladiesItemModel.price),
            ],
          ),
        ),
      ),
    );
  }
}
