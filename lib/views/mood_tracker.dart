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
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(Constants.moodTrackerName),
          bottom: TabBar(
            tabs: [Text('Mood Over Time'), Text('More Info')],
          ),
        ),
        body: TabBarView(children:[buildPage(), buildPage()])
        
      ),
    );
  }

  Widget buildPage() {

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
}



// Directly from the documentation
// https://google.github.io/charts/flutter/example/time_series_charts/simple
class _SimpleTimeSeriesChart extends StatelessWidget {

  final List<charts.Series> seriesList;
  final bool animate;

  _SimpleTimeSeriesChart({this.seriesList, this.animate});

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
    );
  }
}