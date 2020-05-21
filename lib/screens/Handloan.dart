import 'package:flutter/material.dart';
//import 'package:getflutter/getflutter.dart';

import 'OnTapHandloan.dart';
//import 'package:auro_avatar/auro_avatar.dart';


List<String> litems = ["Bebop Rao","Gran Tesaro","Chandu Reddy","John Cena","Bebop Rao","Gran Tesaro","Chandu Reddy","John Cena"];
const String rupee = "₹";

class Handloan extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: new ListView.separated(

        separatorBuilder: (context, index) => Divider(
        color: Colors.grey[400],
      ),

        itemCount: litems.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return ListTile(
            //contentPadding: EdgeInsets.all(15),
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.grey[800],
              child: Icon(Icons.person,size: 25,),),
            title: Text(
              litems[index],
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w500
              ),
            ),
             subtitle: Text('3 days ago',
             style: Theme.of(context).textTheme.bodyText2
             ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                '2000',
                style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                'You\'ll give',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Colors.red,
                ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OnTapHandloan(person : litems[index])
                )
              );
          },
          );
        }
      ),
    );
  }
}


// Generate Initials for Name - Circle Avatar
// new InitialNameAvatar(
//     'John Doe',
//     circleAvatar: true,
//     borderColor: Colors.grey,
//     borderSize: 4.0,
//     backgroundColor: Colors.blue,
//     foregroundColor: Colors.white,
//     padding: 20.0,
//     textSize: 30.0,
// ),