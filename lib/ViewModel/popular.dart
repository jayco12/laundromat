import 'package:flutter/material.dart';
import '../Datamodel/popularitemmodel.dart';

class Popular extends StatelessWidget {
  final Popularitemmodel popularItemModel;

  const Popular({Key? key, required this.popularItemModel}) : super(key: key);

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

              Text(popularItemModel.item),

              Text(popularItemModel.price),
            ],
          ),
        ),
      ),
    );
  }
}
