//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:rupie/screens/TransactionsPage.dart';
// import 'package:flowance_test2/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:rupie/database/dbfile.dart';

const String rupee = "₹";

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List myTransactions = [];
  String uid = "";
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    // myTransactions.sort((a, b) => b['date'].compareTo(a['date']));
    return Scaffold(
      appBar: AppBar(
        title: Text('History',style: TextStyle(color: Colors.black,fontSize: 23)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: myTransactions.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              color: Colors.white,
              margin: EdgeInsets.only(
                  bottom: 10.0, left: 5.0, right: 5.0, top: 2.0),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Text("Transaction page")));
                //  TransactionDetails(myTransactions[index]['_id'])
                },
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(46, 91, 255, 0.1),
                    foregroundColor: Color.fromRGBO(46, 91, 255, 0.1),
                    child: Icon(
                      myTransactions[index]['isSent'] == 1
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: myTransactions[index]['isSent'] == 1
                          ? Color.fromRGBO(232, 74, 80, 1)
                          : Color.fromRGBO(45, 183, 68, 1),
                      size: 24.0,
                      semanticLabel:
                      'Text to announce in accessibility modes',
                    ),
                  ),
                ),
                title: Text(
                  myTransactions[index]['otherName'],
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  DateFormat('EEE, dd MMM yyyy').format(
                      DateTime.parse(myTransactions[index]['date'])),
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Text(
                      "$rupee ${myTransactions[index]['amount']}",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      myTransactions[index]['isSending'] == true
                          ? "You Paid"
                          : "You Received",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}