import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haysters_laundromat/card1.dart';
import 'package:haysters_laundromat/help.dart';
import 'package:haysters_laundromat/order/order.dart';
import 'package:haysters_laundromat/screens/login_page_account.dart';
import 'package:haysters_laundromat/screens/prices.dart';

class HomePage extends StatefulWidget {
  final User? user;

  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const Home(),
    const DashboardScreen(
      title: 'order',
    ),
    const Login(),
    const Prices(),
    const Help(
      title: 'help',
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.black,
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_rounded),
            label: 'prices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'help',
          ),
        ],
      ),
    );
  }
}
