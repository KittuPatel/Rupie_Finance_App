//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:rupie/screens/TransactionsPage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:intl/intl.dart';
//import 'package:rupie/database/dbfile.dart';
import './Interest.dart';
import './Handloan.dart';
import './Repeating.dart';
import './settings.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with
    SingleTickerProviderStateMixin{

  TabController _tabController;
  //static const String rupee = "₹";
  String uid = "";
  int sending=0, receiving=0;
  List myTransactions = [];
  List uniqueTransactions = [];
  String myPhoneNumber;
  // var _dateTime;
  bool isLoading = true;

  
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  // @override
  // void dispose(){
  //   _tabController.dispose();
  //   super.initState();
  // }



  @override
  Widget build(BuildContext context) {
//    List uniqueNumbers = [];
//    List uniqueTransNumbers = [];
//    Map totalsInTransactions = {};
//    if (uniqueTransactions.length != 0) {
//      sending = 0;
//      receiving = 0;
//      uniqueTransactions.forEach((element) {
//        if (element['totalAmount'] < 0) {
//          setState(() {
//            sending += element['totalAmount'] * -1;
//          });
//        } else {
//          setState(() {
//            receiving += element['totalAmount'];
//          });
//        }
//      });
//    }
//
//    if (totalsInTransactions != null) {
//      setState(() {
//        isLoading = false;
//      });
//    } else {
//      setState(() {
//        isLoading = true;
//      });
//    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rupie',
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Icon(Icons.notifications, color: Colors.black),
          // ),
          Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: IconButton(
              icon: Icon(Icons.account_circle,size: 30,),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Settings()));
              },
            ),
          )
        ],
        bottom: TabBar(
          labelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.black,
          tabs: [
            new Tab(text: "HandLoans"),
            new Tab(text: "Interest",),
            new Tab(text: "Repeating",)
          ],
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Handloan(),
          new Interest(),
          new Repeating()
        ],
      )
    );
  }
}