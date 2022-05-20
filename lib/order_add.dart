import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'customer.dart';

class order_screen extends StatelessWidget {

  TextEditingController name = TextEditingController();
  TextEditingController order = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController phone = TextEditingController();
  Future createCustom({required String name , required String order, required price, required phone}) async {
    final doccustom = FirebaseFirestore.instance.collection('custom').doc();
    final custom = Custom(
      id: doccustom.id,
      name: name,
      phone: phone,
      order: order,
      token: doccustom.id,
      price: price
    );
    final json = custom.toJson();
    await doccustom.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        actions: [
          TextButton(onPressed: () {
            // ref.add({
            //   'name': name.text,
            //   'order': order.text,
            // }).whenComplete(() => Navigator.pop(context));
            createCustom(name: name.text, order: order.text, price: price.text, phone: phone.text).whenComplete(() => Navigator.pop(context));
          },
              child: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Container(
            margin: EdgeInsets.fromLTRB(7, 10, 7, 0),
            padding: EdgeInsets.fromLTRB(0, 25, 5, 0),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                border: Border.all(color: Colors.black12),
                color: Colors.white
            ),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "name",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  //borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 100,),
          Container(
            margin: EdgeInsets.fromLTRB(7, 10, 7, 0),
            padding: EdgeInsets.fromLTRB(0, 25, 5, 0),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                border: Border.all(color: Colors.black12),
                color: Colors.white
            ),
            child: TextField(
              controller: order,
              decoration: InputDecoration(
                hintText: "order",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  //borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 100,),
          Container(
            margin: EdgeInsets.fromLTRB(7, 10, 7, 0),
            padding: EdgeInsets.fromLTRB(0, 25, 5, 0),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                border: Border.all(color: Colors.black12),
                color: Colors.white
            ),
            child: TextField(
              controller: price,
              decoration: InputDecoration(
                hintText: "price",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  //borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 100,),
          Container(
            margin: EdgeInsets.fromLTRB(7, 10, 7, 0),
            padding: EdgeInsets.fromLTRB(0, 25, 5, 0),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                border: Border.all(color: Colors.black12),
                color: Colors.white
            ),
            child: TextField(
              controller: phone,
              decoration: InputDecoration(
                hintText: "phone number",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  //borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      )
    );
    
  }
}