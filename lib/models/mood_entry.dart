// Meant to capture the information provided by the daily check in form
// Using this model requires that the questions be in a consistent order in the
// array.  The idea is to match every answer with ever question in the daily
// check in form by placing the answers into the array in the same order.

class MoodEntry {
  List<int> answers;
  DateTime date;

  MoodEntry({this.answers, this.date}) {

    if (answers == null) {

      answers = [];
    }
  }

  int sumOfAnswers() {

    int sum = 0;

    answers.forEach((element) {
      sum += element;
    });

    return sum;
  }

  void add(int answer) {

    answers.add(answer);
  }

  String toString() {

    return  'answers: $answers\n' + 
            'date: ${date.toString()}\n';
  }
}
