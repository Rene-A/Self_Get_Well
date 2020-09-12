import 'package:flutter/material.dart';
import 'package:self_get_well/constants/constants.dart';

class CheckInPage extends StatefulWidget {
  @override
  CheckInPageState createState() => CheckInPageState();
}

class CheckInPageState extends State<CheckInPage> {
  final formKey = GlobalKey<FormState>();
  var dropdownValues = [
    'Not at all',
    'Not at all',
    'Not at all',
    'Not at all',
    'Not at all',
    'Not at all',
    'Not at all',
    'Not at all',
    'Not at all',
  ];
  final dropdownOptions = <String>['Not at all',
      'Several days',
      'More than half the days',
      'Nearly every day',
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.checkInName),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How often have you been bothered by the following over the past 2 weeks?',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      'Little interest or pleasure in doing things?',
                    ),
                    DropdownButton<String>(
                      value: dropdownValues[0],
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValues[0] = newValue;
                        });
                      },
                      items: dropdownOptions,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Feeling down, depressed, or helpless?',
                    ),
                    DropdownButton<String>(
                      value: dropdownValues[1],
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValues[1] = newValue;
                        });
                      },
                      items: dropdownOptions,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Trouble falling or staying asleep, or sleeping too much?',
                    ),
                    DropdownButton<String>(
                      value: dropdownValues[2],
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValues[2] = newValue;
                        });
                      },
                      items: dropdownOptions,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Feeling tired or having little energy?',
                    ),
                    DropdownButton<String>(
                      value: dropdownValues[3],
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValues[3] = newValue;
                        });
                      },
                      items: dropdownOptions,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Poor appetite or overeating?',
                    ),
                    DropdownButton<String>(
                      value: dropdownValues[4],
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValues[4] = newValue;
                        });
                      },
                      items: dropdownOptions,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Feeling bad about yourself - or that you are a failutre or have let yourself or your family down?',
                    ),
                    DropdownButton<String>(
                      value: dropdownValues[5],
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValues[5] = newValue;
                        });
                      },
                      items: dropdownOptions,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Trouble concentrting on things, such as reading the newspaper or watching television?',
                    ),
                    DropdownButton<String>(
                      value: dropdownValues[6],
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValues[6] = newValue;
                        });
                      },
                      items: dropdownOptions,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Moving or speaking so slowly that other people could have noticed? Or so fidgety or restless that you have been moving a lot more than usual?',
                    ),
                    DropdownButton<String>(
                      value: dropdownValues[7],
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValues[7] = newValue;
                        });
                      },
                      items: dropdownOptions,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Thoughts that you would be better off dead, or thoughts of hurting yourself in some way?',
                    ),
                    DropdownButton<String>(
                      value: dropdownValues[8],
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.blue),
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValues[8] = newValue;
                        });
                      },
                      items: dropdownOptions,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}