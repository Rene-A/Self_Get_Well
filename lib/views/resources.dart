import 'package:flutter/material.dart';

import '../constants/constants.dart';

class resourcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.resourceName),
      ),
      body: Center(),
    );
  }
}
