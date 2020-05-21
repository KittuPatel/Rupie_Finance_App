import 'dart:async';
import 'package:batterylevel/model/slide.dart';
import 'package:batterylevel/widgets/slide_dots.dart';
import 'package:batterylevel/widgets/slide_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:rupie/screens/verify.dart';
//import 'package:rupie/helpers/PhoneAuthCode.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';


class PhoneLogin extends StatefulWidget {
  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  int _currentPage = 0;
  String phoneNo;
  String smsCode;
  String verificationId;
  final PageController _pageController = PageController(initialPage: 0);
  TextEditingController _phoneNumberController = TextEditingController();
  bool _isTyping = false;
  double _height, _width;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _isTyping = visible;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    List<Widget> widList = [];
    for (int i = 0; i < slideList.length; i++) {
      (i == _currentPage)
          ? widList.add(SlideDots(true))
          : widList.add(SlideDots(false));
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Get Started for Free",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Free forever. No Hidden Charges",
                      style: TextStyle(fontSize: 16.0, color: Colors.black45),
                    )
                  ],
                ),
              ),
              (_isTyping == false)
                  ? Expanded(
                flex: 2,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 25),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widList,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
                  : Text(""),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text("LOGIN", style: TextStyle(fontSize: 20.0)),
              ),
              TextField(
                style: TextStyle(fontSize: 18, color: Colors.black54),
                onChanged: (value) {
                  this.phoneNo = value;
                },
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0x33E0E7FF),
                  hintText: '000 000 0000',
                  labelText: "Phone Number",
                  prefix: Text("+91 "),
                  contentPadding: const EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black26),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'GET OTP',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(15),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      // startPhoneAuth();
                    },
                  ),
                ],
              ),
              Text("By Logging in or Signing up you accept our Terms and conditions"),
            ],
          ),
        ),
      ),
    );
  }
//  startPhoneAuth() {
//    FirebasePhoneAuth.instantiate(
//        phoneNumber: "+91" + _phoneNumberController.text);
//
//    Navigator.of(context).pushReplacement(CupertinoPageRoute(
//        builder: (BuildContext context) => PhoneAuthVerify()));
//  }
}