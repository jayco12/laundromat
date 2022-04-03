import 'package:flutter/material.dart';
import '../Datamodel/generalitemmodel.dart';

class General extends StatelessWidget {
  final Generalitemmodel generalItemModel;

  const General({Key? key, required this.generalItemModel}) : super(key: key);

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

              Text(generalItemModel.item),

              Text(generalItemModel.price),
            ],
          ),
        ),
      ),
    );
  }
}
