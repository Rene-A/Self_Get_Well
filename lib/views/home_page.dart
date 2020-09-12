import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:self_get_well/constants/constants.dart';
import 'daily_check_in.dart';
import 'help.dart';
import 'mood_tracker.dart';
import 'resources.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF80CEF5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.appName),
      ),
      body: NavButtons(),
    );
  }
}

class NavButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavButton(
            buttonTitle: "Daily Check-in",
            toRoute: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckInPage()))
            },
          ),
          NavButton(
            buttonTitle: "Track Your Mood",
            toRoute: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MoodTracker()))
            },
          ),
          NavButton(
            buttonTitle: "Resources",
            toRoute: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResourcePage()))
            },
          ),
          NavButton(
            buttonTitle: "Get Help",
            toRoute: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HelpPage()))
            },
          )
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String buttonTitle;
  final Function toRoute;

  NavButton({@required this.buttonTitle, @required this.toRoute});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 35,
          ),
          RaisedButton(
            onPressed: () {
              toRoute();
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              width: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF007CFF),
                    Color(0xFF00A6FF),
                    Color(0xFF3FFFFF)
                  ],
                ),
              ),
              padding: const EdgeInsets.all(15.0),
              child: Text(
                buttonTitle,
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
