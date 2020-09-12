
import 'package:self_get_well/models/mood_entry.dart';
import 'package:test/test.dart';

void main() {

  group('The mood_entry class accepts input and returns the proper sum.', () {

    final DateTime date = DateTime.parse('2020-09-11');
    List<int> answers = [1, 2, 3];
    int sum = 5;

    test('Input is not modified by the model.', () {

      final MoodEntry moodEntry = MoodEntry(sum: sum, date: date);

      expect(moodEntry.sum, sum);
      expect(moodEntry.date, date);
    });

    test('setSumFromList function correctly sets the sum of the MoodEntry.', () {

      final MoodEntry moodEntry = MoodEntry();
      moodEntry.setSumFromList(answers);
      expect(moodEntry.sum, 6);
    });

    test('The sum is properly updated by setSumFromList when a new list is used.', () {
      
      List<int> setTwo = [0, 4, 5];

      final MoodEntry moodEntry = MoodEntry();
      moodEntry.setSumFromList(answers);
      expect(moodEntry.sum, 6);

      moodEntry.setSumFromList(setTwo);
      expect(moodEntry.sum, 9);

    });

    test('Default values are provided by the constructor.', () {
      
      final MoodEntry moodEntry = MoodEntry();

      expect(moodEntry.sum, 0);

      assert(moodEntry.date != null);
    });
  });
}