import 'package:self_get_well/models/mood_entry.dart';
import 'package:test/test.dart';

void main() {

  group('The mood_entry class accepts input and returns the proper sum.', () {

    final DateTime date = DateTime.parse('2020-09-11');
    List<int> answers = [1, 2, 3];

    test('Input is not modified by the model.', () {

      final MoodEntry moodEntry = MoodEntry(answers: answers, date: date);

      expect(moodEntry.sumOfAnswers(), 6);
      expect(moodEntry.answers, [1, 2, 3]);
      expect(moodEntry.date, date);
    });

    test('The mood_entry class returns the correct sum of a given array.', () {

      final MoodEntry moodEntry = MoodEntry(answers: answers);

      expect(moodEntry.sumOfAnswers(), 6);
    });

    test('The sum is properly calculated after a new answer is added to the list.', () {
      
      final MoodEntry moodEntry = MoodEntry(answers: answers);

      expect(moodEntry.sumOfAnswers(), 6);

      moodEntry.add(1);

      expect(moodEntry.sumOfAnswers(), 7);
    });

    test('You can add to the answers list without providing an array at initialization.', () {
      
      final MoodEntry moodEntry = MoodEntry();

      expect(moodEntry.sumOfAnswers(), 0);

      moodEntry.add(1);

      expect(moodEntry.sumOfAnswers(), 1);
    });
  });
}