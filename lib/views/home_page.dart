import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:self_get_well/constants/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.appName),
      ),
      body: navButtons(),
    );
  }
}

class navButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          navButton(buttonTitle: "Daily Check-in"),
          navButton(buttonTitle: "Track Your Mood"),
          navButton(buttonTitle: "Resources"),
          navButton(buttonTitle: "Get Help")
        ],
      ),
    );
  }
}

class navButton extends StatelessWidget {
  final String buttonTitle;

  navButton({@required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 35,
          ),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              width: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF007CFF),
                    Color(0xFF00A6FF),
                    Color(0xFF9DFFFF)
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
