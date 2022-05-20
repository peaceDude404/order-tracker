import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/order_add.dart';
import 'customer.dart';
import 'component/customer_bar.dart';

Stream<List<Custom>> readcustom() => FirebaseFirestore.instance
    .collection('custom')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Custom.fromJson(doc.data())).toList());

class home_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height / 3.5),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.vertical(
                bottom: new Radius.elliptical(
                    MediaQuery.of(context).size.width, 100.0)),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Track your order!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: '',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit,color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => order_screen(),
            ),
          );
        },
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 7, 0, 5),
        child: StreamBuilder<List<Custom>>(
            stream: readcustom(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong!');
              } else if (snapshot.hasData) {
                final custom = snapshot.data!;
                return ListView(children: custom.map(buildCustom).toList());
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 15,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(""),
        ),
        //notchMargin: 5,
      ),
    );
  }
}