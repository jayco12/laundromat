import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haysters_laundromat/Database/order_database.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addOrder(Order orderData) async {
    await _db.collection("Order").add(orderData.toMap());
  }

  updateOrder(Order orderData) async {
    await _db.collection("Order").doc(orderData.id).update(orderData.toMap());
  }

  Future<void> deleteOrder(String documentId) async {
    await _db.collection("Order").doc(documentId).delete();
  }

  Future<List<Order>> retrieveOrder() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Order").get();
    return snapshot.docs
        .map((docSnapshot) => Order.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
