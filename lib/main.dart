import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:haysters_laundromat/screens/onboarding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp defaultApp = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterFire Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Onboarding());
  }
}
