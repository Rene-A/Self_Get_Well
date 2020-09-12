// Captures the sum of the daily check in answers.
class MoodEntry {
  int sum;
  DateTime date;

  MoodEntry({this.sum = 0, this.date}) {

    if (date == null) {

      date = DateTime.now();
    }
  }

  // Sets this object's sum to the sum of a list of ints.
  void setSumFromList(List<int> answers) {

    sum = 0;

    answers.forEach((element) {
      sum += element;
    });
  }

  String toString() {

    return  'sum: $sum\n' + 
            'date: ${date.toString()}\n';
  }
}
