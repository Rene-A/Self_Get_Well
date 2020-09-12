import 'package:flutter/material.dart';
import 'package:self_get_well/app.dart';
import 'package:self_get_well/database/mood_tracker_database.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  // The first call to getInstance creates the table if it doesnt exist.
  // Any future calls will still technically be asynchronous, but will 
  // simply return the previously created instance without any extra work.
  MoodTrackerDatabase.getInstance();
  runApp(App());
}
