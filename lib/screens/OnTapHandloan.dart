import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

const String rupee = "₹";

class OnTapHandloan extends StatelessWidget {

  final List<String> litems = ["Bebop Rao","Gran Tesaro","Chandu Reddy","John Cena","Bebop Rao","Gran Tesaro","Chandu Reddy","John Cena"];
  final now = DateTime.now();
  final person;
  OnTapHandloan({Key key, @required this.person}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    List names = person.split(' ');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              person,
              style: Theme.of(context).textTheme.button.copyWith(
                color: Colors.white,
              )
            ),
            SizedBox(height: 2),
            Text(
              "+91 9640897033",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Colors.white,
              ),
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.call),
              onPressed: () {
                //
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                //
              },
            ),
        ],
      ),
      backgroundColor: Colors.white,
      
      body:  SafeArea(
              child: Container(
          child: Column(
                children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:15.0,left:15.0,right:15.0),
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.green[100],
                border: Border.all(
                color: Colors.green[100],
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Total Balance",
              style: Theme.of(context).textTheme.bodyText1
            ),
            Text(
              names[0] + " will pay you",
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyText2
            )
          ],
                ),
                Row(
          children: <Widget>[
            Transform.rotate(
              angle: 320 * 3.14 / 180,
                child: Icon(
                Icons.arrow_downward,
                color: Colors.green,
                size: 25,
              ),
            ),
            Text(
              rupee + '56,23,000',
              style: Theme.of(context).textTheme.headline1,
            )
          ],
                )
              ],
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:16,right:16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
          'Remind you on',
          style: Theme.of(context).textTheme.bodyText1
                ),
                MaterialButton(
            child: Text(
            'Set Date',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Theme.of(context).primaryColor
            ),
          ),
          onPressed: () {
           Future<DateTime> selectedDate = Platform.isIOS ?    
           showModalBottomSheet(
              context: context,
              builder: (BuildContext builder) {
                return Container(
                    height: MediaQuery.of(context).copyWith().size.height / 3,
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime newdate) {
                        print(newdate);
                      },
                      //use24hFormat: true,
                      minimumDate: DateTime(now.year, now.month, now.day),
                      //minimumYear: DateTime.now().year,
                      maximumYear: 2025,
                     // minuteInterval: 1,
                      mode: CupertinoDatePickerMode.date,
                    ),
                   );
              })
              :  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    builder: (BuildContext context, Widget child) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: child,
                      );
                    },
                  );
                  print(selectedDate);
            }
                )
              ],
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(left:15,right:15),
              child: SizedBox(
                width: double.infinity,
                child: FlatButton(
                onPressed: (){

                },
                padding: EdgeInsets.all(15),
                color: Theme.of(context).primaryColor,
                child: Text(
          'Add Transaction',
          style: Theme.of(context).textTheme.button.copyWith(
            color: Colors.white,
          ),
                ),
              ),
          ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Text(
            'Transaction History',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontWeight: FontWeight.w600
            )
            ),
          Icon(
            Icons.history,
          )
                ],
              ),
            ),
            Expanded(
                      child: Container(
                //height: size.height / 2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.separated(
                      //scrollDirection: Axis.horizontal,

                      //shrinkWrap: true,
                      separatorBuilder: (context, index) => Divider(
                      color: Colors.grey[400],
                      ),

                      itemCount: litems.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                  return ListTile(
                    //contentPadding: EdgeInsets.all(15),
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.red[400],
                      child: Icon(Icons.arrow_upward,size: 25,),),
                    title: Text(
                      'You Paid',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                     subtitle: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                       Text('22 Feb 2020',
                       style: Theme.of(context).textTheme.bodyText2,
                       ),
                       //Text('Biryani')
                       ],
                     ),
                     
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Text(
                      rupee + '2000',
                      style: Theme.of(context).textTheme.bodyText1,
                      ),
                      // Icon(
                      //   Icons.arrow_upward,
                      //   size: 18,
                      //   color: Colors.red,
                      // )
                      ],
                    ),
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => OnTapHandloan(person : litems[index])
                    //     )
                    //   );
                    //       },
                    );
                      }
                      ),
                ),
              ),
            )
                ],
              ),
        ),
      )
    );
    
   
  }
}