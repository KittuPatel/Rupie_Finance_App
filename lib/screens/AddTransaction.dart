import 'dart:convert';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'SuccessfulTransaction.dart';

class AddNewTransaction extends StatefulWidget {
  final String phoneNumber, personName;
  AddNewTransaction(this.phoneNumber, this.personName);
  @override
  _AddNewTransactionState createState() => _AddNewTransactionState();
}

String typedropdownValue = 'Hand Loan';
String reminddropdownValue = 'Monthly';

class _AddNewTransactionState extends State<AddNewTransaction> {
  String phoneNumber, personName;
  String myPhone, myuid;
  List otherUserInfo = [];
  var _dateTime;
  String reason, errorText; 
  double amount;
  bool send, receive;
  double intpercent;
  // void initState() {
  //   FirebaseAuth.instance.currentUser().then((val) {
  //     this.myuid = val.uid;
  //     this.phoneNumber = val.phoneNumber;
  //   }).catchError((error) {
  //     print(error);
  //   });
  //   super.initState();
  //   setState(() {
  //     this.send = false;
  //     this.receive = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //double intamount = amount * intpercent;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Transaction",
           style: Theme.of(context).textTheme.headline2.copyWith(
             fontWeight: FontWeight.w500,
             color: Colors.white
           ),
        ),
        elevation: 0,
        //backgroundColor: Colors.transparent,
        leading: FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )
            ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: ListView(children: <Widget>[
          //SizedBox(height: 20.0),
          Text("CONTACT",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w800
                  )),
           SizedBox(height: 5.0),        
          Row(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                  Text("${widget.personName}",
                  style: Theme.of(context).textTheme.headline2.copyWith(
                    //fontWeight: FontWeight.w500
                  ),
                  ),
                  Text("+91 ${widget.phoneNumber}",
                  style: Theme.of(context).textTheme.bodyText1
                  )
                ]),
              ),
              IconButton(
                color: Theme.of(context).primaryColor,
                onPressed: (){},
                icon: Icon(Icons.edit),
                //child: Text('Edit Contact',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                  onTap: () {
                    setState(() {
                      this.send = true;
                      this.receive = false;
                    });
                  },
                  child: Container(
                    width: 140.0,
                    height: 90.0,
                    decoration: new BoxDecoration(
                        color: (send == true) ? Colors.red[200] : Colors.white,
                        border: new Border.all(
                          color: (send == true)
                              ? Colors.red[200]
                              : Colors.black12,
                          width: 3.0,
                        ),
                        borderRadius: new BorderRadius.circular(10.0)
                        ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              width: 50.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (receive == true) ? Colors.grey[300] : Colors.red[200],
                                  ),
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.red,
                                size: 40.0,
                              )),
                          Text("You Sent ₹",
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.w600
                              ))
                        ]),
                  )
                ),
                Text('Or'),
              InkWell(
                  onTap: () {
                    setState(() {
                      this.send = false;
                      this.receive = true;
                    });
                  },
                  child: Container(
                    width: 140.0,
                    height: 90.0,
                    decoration: new BoxDecoration(
                        color: (receive == true) ? Colors.green[200] : Colors.white,
                        border: new Border.all(
                          color: (receive == true)
                              ? Colors.green[200]
                              : Colors.black12,
                          width: 3.0,
                        ),
                        borderRadius: new BorderRadius.circular(10.0)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              width: 50.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:(receive == true)
                              ? Colors.green[200]
                              : Colors.grey[300],
                                  ),
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.green,
                                size: 40.0,
                              )),
                          Text("You Received ₹",
                              style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontWeight: FontWeight.w600
                              ))
                        ]),
                  )),
            ],
          ),
          SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("TRANSACTION TYPE",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w800
                  )),
              Container(
                //padding:EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<String>(
                      value: typedropdownValue,
                      onChanged: (String newValue) {
                        setState(() {
                          typedropdownValue = newValue;
                        });
                      },
                      items: <String>['Hand Loan', 'Interest', 'Repeating']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                        .toList(),
                    ),
                  )
            ],
          ),
          SizedBox(height: 10.0),
          Text("AMOUNT",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w800
                  )),
          SizedBox(height: 10.0),
          TextField(
              style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
              onChanged: (value) {
                setState(() {
                  this.amount = double.parse(value);
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Padding(
                              padding: const EdgeInsets.only(top:8.0,left:20),
                              child: Text('₹',style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),),
                            ),
                hintText: 'Enter Amount',
                hintStyle: TextStyle(fontWeight: FontWeight.normal),
                //prefix: Text("₹ ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                contentPadding: const EdgeInsets.all(10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.circular(5),
                ),
              )
            ),
            SizedBox(height: 20),
            Visibility(
                visible: typedropdownValue == 'Interest',
                child: Column(
                  children: <Widget>[
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("INTEREST % MONTH", style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w800
                          )),
                          SizedBox(height: 10,),
                          Container(
                            width: 100,
                            child: TextField(
                                style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
                                onChanged: (value) {
                                  setState(() {
                                    this.intpercent = double.parse(value);
                                  });
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(2),
                                ],
                                //maxLength: 2,
                                //maxLengthEnforced: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(top:8.0,left:15),
                                    child: Text('%',style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),),
                                  ),
                                  hintText: '0',
                                  //hintStyle: TextStyle(fontWeight: FontWeight.normal),
                                  //prefix: Text("% ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                                  contentPadding: const EdgeInsets.all(10),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black38),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )
                              ),
                          ),
                        ],
                      ),
                      Column(
                          children: <Widget>[
                          Text("INTEREST AMOUNT", style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w800
                          )),
                          SizedBox(height: 10,),
                          Container(
                            width: 100,
                            child: TextField(
                                enabled: false,
                                style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
                                // onChanged: (value) {
                                //   setState(() {
                                //     this.amount = value;
                                //   });
                                // },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '5000',
                                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                                 // prefix: Text("₹ ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                                  contentPadding: const EdgeInsets.all(10),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black38),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )
                              ),
                          ),
                        ],
                      )
                    ],
              ),
                          SizedBox(height: 20,),
                  ],
                  
                ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("DATE", style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w800
                  )),
                  FlatButton(
                      onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate:
                                        _dateTime == null ? DateTime.now() : _dateTime,
                                    firstDate: DateTime(
                                      2010,
                                    ),
                                    lastDate: DateTime.now())
                                .then((date) {
                              setState(() {
                                _dateTime = date;
                              });
                            });
                          },
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                            _dateTime == null
                                ? 'Select date'
                                : DateFormat('dd MMM, yyyy')
                                    .format(_dateTime)
                                    .toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500)
                          ),
                          Icon(Icons.arrow_drop_down),
                          
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("REMIND", style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w800
                  )),
                  Container(
                //padding:EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton<String>(
                          value: reminddropdownValue,
                          onChanged: (String newValue) {
                            setState(() {
                              reminddropdownValue = newValue;
                            });
                          },
                          items: <String>['Never','Daily', 'Weekly', 'FortNightly','Monthly','Every 3 Months']
                            .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            })
                            .toList(),
                        ),
                      )
                ],
              )
            ],
          ),
          //SizedBox(height: 10.0),
          Text("NOTE", style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.w800
                  )),
          SizedBox(height: 10.0),
          TextField(
            style: TextStyle(fontSize: 16, color: Colors.black54),
            onChanged: (value) {
              setState(() {
                this.reason = value;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0x33E0E7FF),
              hintText: "What's this for?(Optional)",
              contentPadding: const EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 20.0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'ADD TRANSACTION',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  var transId = uniqueRandomNumber();
                  var myData = {
                    'transId': transId,
                    'myid': myuid,
                    'my_number': this.myPhone,
                    'other_name': widget.personName,
                    'other_number': widget.phoneNumber,
                    'amount': amount,
                    'isSending': send,
                    'date': _dateTime,
                    'reason': reason,
                  };
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> TransactionSuccessful()));
                  // if (myData['other_name'] != null &&
                  //     myData['other_number'] != null &&
                  //     myData['amount'] != null &&
                  //     myData['amount'] != null) {
                  //   databaseReference
                  //       .collection("my_transactions")
                  //       .add(myData)
                  //       .then((value) => Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (BuildContext context) =>
                  //                   TransactionSuccessful())));
                  // } else {
                  //   setState(() {
                  //     errorText = "Please fill All fields";
                  //   });
                  // }
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }

  String uniqueRandomNumber() {
    var now = new DateTime.now();
    String year = now.year.toString();
    String month = now.month.toString();
    String date = now.day.toString();
    String hour = now.hour.toString();
    String minute = now.minute.toString();
    String sec = now.second.toString();
    String msec = now.millisecond.toString();
    String usec = now.microsecond.toString();
    String randInt = year + month + date + hour + minute + sec + msec + usec;
    var bytes = utf8.encode(randInt);
    var base64Str = base64.encode(bytes);
    base64Str = base64Str.replaceAll(RegExp('[\\[\\](){} -=]'), '');
    return base64Str;
  }
}