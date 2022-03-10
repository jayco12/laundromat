import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_demo/Card1.dart';
import 'package:flutterfire_demo/screens/Profile_page.dart';
import 'package:flutterfire_demo/screens/prices.dart';
import 'package:flutterfire_demo/utils/authentication_client.dart';

class homePage extends StatefulWidget {
  final User user;

  const homePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final _authClient = AuthenticationClient();

  bool _isProgress = false;
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    home(
      user: user,
    ),
    Container(color: Colors.amber),
    ProfilePage(
      user: user,
    ),
    Container(color: Colors.amber),
    prices(title: 'prices'),
    Container(color: Colors.amber),
  ];

  static get user => null;

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
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.black,
            label: 'Card',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Card2',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Card3',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.money_rounded),
            label: 'Card4',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.wallet_travel_rounded),
            label: 'Card5',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Card6',
          ),
        ],
      ),
    );
  }
}
