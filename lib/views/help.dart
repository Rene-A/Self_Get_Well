import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF80CEF5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.getHelpName),
      ),
      body: CallPanel(),
    );
  }
}

class CallPanel extends StatelessWidget {
  //Add new numbers and names to these lists, in order
  final List<String> callTargets = ['Suicide Lifeline', 'The Samaritans', 'National Teen Dating Violence Hotline', 'Boys Town National Hotline', 'Trevor Project Lifeline',
  'Child Help USA National Hotline', 'Military One Source', 'Ayuda En Espa\u00F1ol'];
  final List<String> numbers = ['8002738255', '8778704673', '8663319474', '8004483000', '8664887386', '8004224453', '8003429647', '8886289454'];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        primary: false,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF007CFF),
              Color(0xFF6ACCC1),
              Color(0xFF7DE39D)
            ])),
            child: ListTile(
              title: Text(
                callTargets[index],
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              trailing: RaisedButton(
                  color: Color(0xFF49BAAD),
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                      child: Text(
                    "Call",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  )),
                  onPressed: () => callNumber(numbers[index])),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: numbers.length);
  }
}

// function used to call number when raised button is pressed
callNumber(number) async {
  // number to suicide hotline
  bool res = await FlutterPhoneDirectCaller.callNumber(number);
}

// This was the original code in the body field, didn't want to delete
// Column(
//         children: [
//           Text(
//             "Help is available",
//             style: TextStyle(fontSize: 28, color: Colors.black),
//             textAlign: TextAlign.center,
//           ),
//           Text(
//             "Speak to a counselor today",
//             style: TextStyle(fontSize: 28, color: Colors.black),
//             textAlign: TextAlign.center,
//           ),
//           RaisedButton(
//             child: Text("Call for Help",
//                 style: TextStyle(fontSize: 18, color: Colors.black),
//                 textAlign: TextAlign.center),
//             onPressed: callNumber,
//           ),
//         ],
//       )
