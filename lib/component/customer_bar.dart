import 'package:flutter/material.dart';
import 'package:notes/customer.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}


Widget buildCustom(Custom custom) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white54,
        height: 180,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.person),
                  ),
                  Text(
                    custom.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.dining),
                ),
                Text(
                  custom.order,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.currency_rupee),
                ),
                Text(
                  custom.price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: ()  {
                String message = '${custom.name} your token number is ${custom.token} for your order of ${custom.order}';
                List<String> recipents = [custom.phone];
                _sendSMS(message, recipents);
              },
              icon: Icon(Icons.message),
              ),
              IconButton(
              onPressed: ()  {
                final doccustom = FirebaseFirestore.instance.collection('custom').doc(custom.token);
                doccustom.delete();
              },
              icon: Icon(Icons.delete),
              )
          ],
        ),
      ),
    );