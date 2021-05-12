import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomerShoppingCartScreen extends StatefulWidget {

  const CustomerShoppingCartScreen({Key key,}) : super(key: key);

  @override
  _CustomerShoppingCartScreenState createState() =>
      _CustomerShoppingCartScreenState();
}

class _CustomerShoppingCartScreenState
    extends State<CustomerShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: getBody(),
        ));
  }

  Widget getBody() {
    return SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(bottom: 60), child: Column(children: [
        ],
        )));
  }
}
