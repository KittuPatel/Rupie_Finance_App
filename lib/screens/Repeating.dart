import 'package:flutter/material.dart';

import 'OnTapRepeating.dart';

List<String> litems = ["Bebop Rao","Gran Tesaro"];
const String rupee = "₹";

class Repeating extends StatelessWidget {
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
            //isThreeLine: true,
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
             subtitle: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text('3 days ago',
                  style: Theme.of(context).textTheme.bodyText2
                  ),
                  Text('Every Month',
                    style: Theme.of(context).textTheme.bodyText2
                    )
               ],
             )
             
             
            ,
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
                  builder: (context) => OnTapRepeating(person : litems[index])
                )
              );
          },
          );
        }
      ),
    );
  }
}