import 'package:flutter/material.dart';
import 'package:self_get_well/constants/constants.dart';

class checkInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.checkInName),
      ),
      body: Center(),
    );
  }
}
