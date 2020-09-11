import 'package:flutter/material.dart';

import '../constants/constants.dart';

class moodTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.moodTrackerName),
      ),
      body: Center(),
    );
  }
}
