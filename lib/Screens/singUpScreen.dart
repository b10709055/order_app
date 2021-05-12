import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'mainScreen.dart';

enum SingingCharacter { Customer, Store, Deliveryman }

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key key}) : super(key: key);

  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  SingingCharacter _character = SingingCharacter.Customer;
  static const String _title = '外送頻台 App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
                height: double.infinity,
                child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "註冊",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Text(
                            "註冊身份",
                            style: TextStyle(color: Colors.teal, fontSize: 20),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.teal,
                                  width: 3,
                                )),
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text('顧客'),
                                  leading: Radio<SingingCharacter>(
                                    value: SingingCharacter.Customer,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Text('店家'),
                                  leading: Radio<SingingCharacter>(
                                    value: SingingCharacter.Store,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Text('外送員'),
                                  leading: Radio<SingingCharacter>(
                                    value: SingingCharacter.Deliveryman,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16.0,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: "帳號",
                              prefixIcon: Icon(
                                Icons.account_circle_outlined,
                                size: 18,
                                color: Colors.teal,
                              ),
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.teal)),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16.0,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: "姓名",
                              prefixIcon: Icon(
                                Icons.account_box_outlined,
                                size: 18,
                                color: Colors.teal,
                              ),
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.teal)),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16.0,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: "密碼",
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                size: 18,
                                color: Colors.teal,
                              ),
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.teal)),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextField(
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 16.0,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: "手機號碼",
                              prefixIcon: Icon(
                                Icons.phone,
                                size: 18,
                                color: Colors.teal,
                              ),
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.teal)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 25.0),
                            width: double.infinity,
                            child: RaisedButton(
                              elevation: 5.0,
                              padding: EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              color: Colors.teal,
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MainScreen())),
                              child: Text('註冊',
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.5,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ))),
          )),
    );
  }
}
