import 'package:flutter/material.dart';
import '../Datamodel/childrenitemmodel.dart';

class Children extends StatelessWidget {
  final Childrenitemmodel childrenItemModel;

  const Children({Key? key, required this.childrenItemModel}) : super(key: key);

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

              Text(childrenItemModel.item),

              Text(childrenItemModel.price),
            ],
          ),
        ),
      ),
    );
  }
}
