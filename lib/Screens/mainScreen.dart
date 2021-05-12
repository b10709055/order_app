import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/Screens/customerHomeScreen.dart';
import 'package:order_app/Screens/customerSettingScreen.dart';
import 'package:order_app/Screens/customerShoppingCartScreen.dart';

import 'customerOrderScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    CustomerHomeScreen(),
    CustomerShoppingCartScreen(),
    CustomerOrderScreen(),
    CustomerSettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey.shade300,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首頁"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text("購物車"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text("訂單"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("設定"),
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
      body: _widgetOptions.elementAt(_currentIndex)
    );
  }
}
