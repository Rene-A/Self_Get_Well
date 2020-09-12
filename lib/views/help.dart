import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.getHelpName),
      ),
      body: Column(
          children: [
            Text("Help is available",
                style: TextStyle(fontSize: 28, color: Colors.black),
                textAlign: TextAlign.center,
                ),
            Text("Speak to a counselor today",
                style: TextStyle(fontSize: 28, color: Colors.black),
                textAlign: TextAlign.center,
                ),
          RaisedButton(
                child: Text("Call for Help",
                style: TextStyle(fontSize: 18, color: Colors.black),
                textAlign: TextAlign.center
                ),
                onPressed: callNumber,
                ),
              ],
          ),
       );
    }
}

// function used to call number when raised button is pressed
callNumber() async{
  const number = '8002738255'; // number to suicide hotline
  bool res = await FlutterPhoneDirectCaller.callNumber(number);
}

