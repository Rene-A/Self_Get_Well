import 'dart:io';

import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:self_get_well/database/mood_tracker_database.dart';
import 'package:self_get_well/models/mood_entry.dart';

import '../constants/constants.dart';

class MoodTracker extends StatefulWidget {
  @override
  _MoodTrackerState createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<MoodTracker> {

  Future< List<MoodEntry> > moodEntries;
  MoodTrackerDatabase db;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  void _initializeDatabase() async {

    db = await MoodTrackerDatabase.getInstance();
    moodEntries = db.getAllMoodEntries();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    // https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(Constants.moodTrackerName),
            bottom: TabBar(
              tabs: [Text('Mood Over Time'), Text('More Info')],
            ),
          ),
          body: TabBarView(children:[buildGraph(), buildInfoPage()])
          
        ),
      ),
    );
  }

  Widget buildGraph() {

    return FutureBuilder< List<MoodEntry> > (
      future: moodEntries,
      builder: (BuildContext context, AsyncSnapshot< List<MoodEntry> > snapshot) {
        Widget child;

        if (snapshot.hasData) {
          child = _SimpleTimeSeriesChart.buildFromList(
            moodEntries: snapshot.data,
            shouldAnimate: true,
          );
        }
        else if (snapshot.hasError) {
          child = Text('Error: ${snapshot.error}');
        }
        else {
          child = SizedBox(
            child: CircularProgressIndicator(),
            width: 100,
            height: 100,
          );
        }

        return Center(
          child: child,
        );
      },
    );
  }

  Widget buildInfoPage() {

    return FutureBuilder< List<MoodEntry> > (
      future: moodEntries,
      builder: (BuildContext context, AsyncSnapshot< List<MoodEntry> > snapshot) {
        Widget child;

        if (snapshot.hasData) {
          child = infoBody(snapshot.data.last);
        }
        else if (snapshot.hasError) {
          child = Text('Error: ${snapshot.error}');
        }
        else {
          child = SizedBox(
            child: CircularProgressIndicator(),
            width: 100,
            height: 100,
          );
        }

        return Center(
          child: child,
        );
      },
    );
  }

  Widget infoBody(MoodEntry moodEntry) {

    int score = moodEntry.sum;

    EdgeInsets padding = EdgeInsets.all(10);

    List<Widget> rows = [
      Flexible(
        child: Container(
          padding: padding,
          child: Text('Your most recent score was was $score.')
        )
      ),
      Flexible(
        child: Container(
          padding: padding,
          child: Text('The score ranges between 0 to 27.  A lower score is often associated' +
          ' with depression like symptoms.'),
        ),
      ),
      Flexible(
        child: Container(
          padding: padding,
          child: Text('If you regularly score below 23, please consider speaking with your' +
          ' Primary Care Provider about signs of depression.'),
        ),
      ),
      Flexible(
        child: Container(
          padding: padding,
          child: Text('If your score is consistently below 7, please know there are help lines available' +
          ' on the help page, and resources are listed in the resources page.' +
          ' Please consider seeking professional assistance.'),
        ),
      ),
      Flexible(
        child: Container(
          padding: padding,
          child: Text('Please note that this is only a tool meant to track your mood.\n' +
          'This app is not intended to provide a diagnosis.'),
        ),
      ),
    ];

    return Column(
      children: rows,
    );
  }

}


// Directly from the documentation
// https://google.github.io/charts/flutter/example/time_series_charts/simple
// https://google.github.io/charts/flutter/example/behaviors/selection_callback_example
class _SimpleTimeSeriesChart extends StatelessWidget {

  final List<charts.Series> seriesList;
  final bool animate;

  _SimpleTimeSeriesChart({Key key, this.seriesList, this.animate}) : super(key: key);

  factory _SimpleTimeSeriesChart.buildFromList({List<MoodEntry> moodEntries, bool shouldAnimate}) {

    List< charts.Series<MoodEntry, DateTime> > tempList = [
      charts.Series<MoodEntry, DateTime>(
        id: 'Scores',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (MoodEntry entry, _) => entry.date,
        measureFn: (MoodEntry entry, _) => entry.sum,
        data: moodEntries,
      )
    ];

    return _SimpleTimeSeriesChart(
      seriesList: tempList,
      animate: shouldAnimate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      behaviors: [
        charts.ChartTitle(
          'Mood Scores Over Time',
          behaviorPosition: charts.BehaviorPosition.top,
          innerPadding: 15
        ),
        charts.ChartTitle(
          'Scores',
          behaviorPosition: charts.BehaviorPosition.start,
          titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
        ),
        charts.ChartTitle(
          'Date',
          behaviorPosition: charts.BehaviorPosition.bottom,
          titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
        ),
      ],
    );
  }
}
