import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///Users/adam/order_app/lib/Jsons/dataJson.dart';

class CustomerStoreDetailScreen extends StatefulWidget {
  final List list;
  final int index;

  const CustomerStoreDetailScreen(
      {Key key, this.list, this.index})
      : super(key: key);

  @override
  _CustomerStoreDetailScreenState createState() =>
      _CustomerStoreDetailScreenState();
}

class _CustomerStoreDetailScreenState extends State<CustomerStoreDetailScreen> {
  List store=[storeMenu1,storeMenu2,storeMenu3,storeMenu4];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: getBody(),
        ));
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage(widget.list[widget.index]['img']),
                            fit: BoxFit.cover)),
                  ),
                  SafeArea(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black26, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 20,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.list[widget.index]['name'],
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
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
                              widget.list[widget.index]['time'],
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
                              widget.list[widget.index]['delivery_fee'],
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.teal,
                    ),
                    for (int j=0;j<store[widget.index].length;j++)
                      buildItems(size, store[widget.index], j),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 40,right: 40),
                width: double.infinity,
                child: RaisedButton(
                  elevation: 5.0,
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  color: Colors.teal,
                  onPressed: () => (Navigator.pop(context)),
                  child: Text('加入購物車',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          )),
    );
  }
  List<int> c=[0,0,0,0];
  List<String> id=[];
  Widget buildItems(Size size,List list,int index){

    return Padding(padding: EdgeInsets.all(5),
        child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.white12,
            width: size.width,
            height: 150,
            child: Row(
              children: [
                ClipRRect(
                  child: SizedBox(
                    width: 130,
                    height: 120,
                    child: Image(
                      image: NetworkImage(list[index]['product＿img']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                Expanded(child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(list[index]['product＿name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                    SizedBox(height: 5,),
                    Text(list[index]['product＿price']+" NT\$",style: TextStyle(fontSize: 20,)),
                    SizedBox(height: 5,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon:Icon(Icons.remove,
                            size: 28,
                            color: Colors.teal,
                          ), onPressed: () {
                              setState(() {
                                if(c[index]!=0){
                                  c[index]--;
                                }
                                if(c[index]==0 && id.contains(list[index]['id']))
                                  id.remove(list[index]['id']);
                              });
                          },),
                          Container(
                            color: Colors.black26,
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              c[index].toString(),style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            ),
                          ),
                          IconButton(
                            icon:Icon(Icons.add,
                              size: 28,
                              color: Colors.teal,
                            ), onPressed: () {
                              setState(() {
                                c[index]++;
                                if(c[index]!=0 && !id.contains(list[index]['id']))
                                  id.add(list[index]['id']);
                              });
                          },),
                        ],
                      ),
                  ],
                ),)
              ],
            ))
    );
  }
}
