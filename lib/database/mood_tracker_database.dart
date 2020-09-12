import 'dart:async';

import 'package:path/path.dart' as path;
import 'package:self_get_well/models/mood_entry.dart';
import 'package:sqflite/sqflite.dart';

// Handles database creation, storing, and retrieving
// A lot of this logic is based off of lecture material in CS 492 Mobile Development
// and my own project in the class using similar ideas.
// This class is a singleton, meaning that only once instance is available at 
// any given time.  
// https://stackoverflow.com/questions/42975975/what-is-the-best-way-to-store-survey-responses-in-mysql
// The page above suggests a good idea for the basic structure of a sql database
// that wants to store a questionnaire without providing code.
// https://www.sqlitetutorial.net/sqlite-create-table/
class MoodTrackerDatabase {

  static const String _databaseFilename = 'mood.sqlite3.db';
  static const String _schema = 'CREATE TABLE IF NOT EXISTS mood_entries(mood_id INTEGER PRIMARY KEY AUTOINCREMENT, sum INTEGER NOT NULL, date TEXT NOT NULL);';
  static const String _sqlSelectAll = 'SELECT * FROM mood_entries';
  static const String _sqlInsertMoodEntry = 
    'INSERT INTO mood_entries(sum, date) VALUES(?, ?)';

  static MoodTrackerDatabase _instance;

  final Database database;

  MoodTrackerDatabase._({this.database});

  static Future<MoodTrackerDatabase> getInstance() async{

    if (_instance == null) {

      await _initialize();
    }
    return _instance;
  }

  static Future _initialize() async {

    final db = await openDatabase(
      await _getMoodDatabasePath(),
      version: 1,
      onCreate: (Database db, int version) {
        _createTables(db, _schema);
        _addDummyData(db);
      }
    );
    _instance = MoodTrackerDatabase._(database: db);
  }

  static void _createTables(Database db, String sql) async {

    await db.execute(sql);
  }

  void addMoodEntry(MoodEntry entry) async {

    await database.transaction((txn) async {
      await txn.rawInsert(_sqlInsertMoodEntry,
        [entry.sum, entry.date.toIso8601String()]);
    });
  }

  Future< List<MoodEntry> > getAllMoodEntries() async {

    List<Map> moodRecords = await database.transaction((txn) async {
      return await txn.rawQuery(_sqlSelectAll);
    });

    // Convert our records into a list of MoodEntry objects.
    return moodRecords.map( (record) {

      return MoodEntry(
        sum: record['sum'],
        date: DateTime.parse(record['date'])
      );
    }).toList();
  }

  Future< List<MoodEntry> > getLastWeekMoodEntries() async {

    String now = DateTime.now().toIso8601String();
    String oneWeekPast = DateTime.now().subtract(Duration(days: 7)).toIso8601String();

    String _sqlSelectLastWeek = 
    'SELECT * FROM mood_entries WHERE date >= $oneWeekPast AND date <= $now';

    List<Map> moodRecords = await database.transaction((txn) async {
      return await txn.rawQuery(_sqlSelectLastWeek);
    });

    // Convert our records into a list of MoodEntry objects.
    return moodRecords.map( (record) {

      return MoodEntry(
        sum: record['sum'],
        date: DateTime.parse(record['date'])
      );
    });
  }

  // More generic version that lets you specify the timeframe
  

  static Future<String> _getMoodDatabasePath() async {
    // https://pub.dev/packages/sqflite
    // The documentation suggests using getDatabasesPath()
    String databasesPath = await getDatabasesPath();

    //Directory databasesPath = await getApplicationDocumentsDirectory();

    // https://api.flutter.dev/flutter/package-path_path/join.html
    String fullPath = path.join(databasesPath, _databaseFilename); 

    return fullPath;
  }

  static void _addDummyData(Database db) async {

    // Total sum of 45
    // Should see a pattern where the sum is increasing as time goes on in our
    // graph
    for (int i = 0; i < 10; i++) {

      await db.transaction((txn) async {
      await txn.rawInsert(_sqlInsertMoodEntry,
        [i, DateTime.now().subtract(Duration(days: i)).toIso8601String()]);
      });
    }
  }

}

// I'll eventually want to be able to retrieve a list of mood entries in 
// ascending order over a given time frame.
