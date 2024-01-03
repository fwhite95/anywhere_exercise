import 'package:anywhere_exercise/src/controller/character_controller.dart';
import 'package:anywhere_exercise/src/model/character_model.dart';
import 'package:anywhere_exercise/src/model/duck_model.dart';
import 'package:anywhere_exercise/src/model/icon_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockCharacterController extends Mock implements CharacterController {}

void main() {
  test('Character Controller should return duck object', () async {
    final controller = MockCharacterController();
    when(() => controller.getDuck()).thenAnswer(
      (_) => Future.value(const Duck(
        abstractSource: '',
        abstractURL: '',
        heading: '',
        relatedTopics: [
          Character(
            firstURL: '',
            icon: IconModel(
              height: '',
              url: '',
              width: '',
            ),
            result: '',
            text: 'Test - This is a test',
            name: 'Test',
          ),
        ],
      )),
    );

    final duck = await controller.getDuck();

    expect(duck.relatedTopics.length, 1);
    expect(duck.relatedTopics[0].text, 'Test - This is a test');
    expect(duck.relatedTopics[0].name, 'Test');
  });
}
