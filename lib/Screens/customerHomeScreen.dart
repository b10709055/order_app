import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///Users/adam/order_app/lib/Jsons/dataJson.dart';

import 'customerStoreDetailScreen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key key}) : super(key: key);

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Colors.black12,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: TextField(
                      style: TextStyle(color: Colors.teal),
                      decoration: InputDecoration(
                        hintText: "外送地址",
                        hintStyle: TextStyle(color: Colors.teal),
                        prefixIcon: Icon(
                          Icons.location_on_outlined,
                          size: 20,
                          color: Colors.teal,
                        ),
                        contentPadding: EdgeInsets.all(8),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.teal)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.teal)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                for (var i = 0; i < homeStore.length; i++)
                  buildStoreItem(size, homeStore, i),
              ],
            ),
          ),
        ));
  }

  buildStoreItem(var size, List list, int i) {
    return Column(children: [
      SizedBox(
        height: 10,
      ),
      Container(
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CustomerStoreDetailScreen(
                                  list: list, index: i)));
                    },
                    child: Container(
                      width: size.width,
                      height: 160,
                      child: Image(
                        image: NetworkImage(list[i]['img']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                list[i]['name'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.hourglass_bottom,
                        color: Color(0xFF00954d),
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        list[i]['time'],
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        list[i]['delivery_fee'],
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        width: size.width,
        height: 10,
        decoration: BoxDecoration(color: Colors.black12),
      ),
    ]);
  }
}
