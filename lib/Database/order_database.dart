import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haysters_laundromat/Database/order_adress.dart';

class Order {
  final String? id;
  final String name;
  final int age;
  final int salary;
  final Address address;
  final List<String>? orderTraits;
  Order(
      {this.id,
      required this.name,
      required this.age,
      required this.salary,
      required this.address,
      this.orderTraits});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'salary': salary,
      'address': address.toMap(),
      'orderTraits': orderTraits
    };
  }

  Order.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        name = doc.data()!["name"],
        age = doc.data()!["age"],
        salary = doc.data()!["salary"],
        address = Address.fromMap(doc.data()!["address"]),
        orderTraits = doc
            .data()?["orderTraits"]
            ?.doc
            .data()?["orderTraits"]
            .cast<String>();
}
