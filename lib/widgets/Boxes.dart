import 'package:flutter/material.dart';

class Boxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              height: 130.0,
              width: (MediaQuery.of(context).size.width) / 2.4,
              decoration: BoxDecoration(
                color: Color.fromRGBO(45, 183, 68, 0.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 35.0,
                      child: Transform.rotate(
                        angle: 320 * 3.16 / 180,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_downward,
                            size: 35.0,
                            color: Color.fromRGBO(45, 183, 68, 1),
                          ),
                          onPressed: null,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                         // rupee + receiving.toString(),
                          "5000",
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          "You'll Receive",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
        Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              height: 130.0,
              width: (MediaQuery.of(context).size.width) / 2.4,
              decoration: BoxDecoration(
                color: Color.fromRGBO(232, 74, 80, 0.3),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 35.0,
                      child: Transform.rotate(
                        angle: 40 * 3.16 / 180,
                        child: Icon(
                          Icons.arrow_upward,
                          size: 35.0,
                          color: Color.fromRGBO(232, 74, 80, 1),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          //rupee + sending.toString(),
                          "6000",
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          "You'll Pay",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
