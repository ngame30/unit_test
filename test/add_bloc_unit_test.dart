import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test/adder.dart';
import 'package:unit_test/bloc/add_bloc.dart';

class AdderMock4Test extends Mock implements AdderInterface {}

void main() => AddBlocUnitTest.run();

class AddBlocUnitTest {
  AddBlocUnitTest({
    required this.number,
    required this.outcome,
    required this.event,
  });

  final AddEvent event;
  final int number;
  final int outcome;

  static final List<AddBlocUnitTest> _parameterList = [
    AddBlocUnitTest(number: 1, outcome: 1, event: AddNumber()),
    AddBlocUnitTest(number: 2, outcome: 2, event: AddNumber()),
    AddBlocUnitTest(number: 3, outcome: 3, event: AddNumber()),
    AddBlocUnitTest(number: 1, outcome: -1, event: SubtractNumber()),
    AddBlocUnitTest(number: 2, outcome: -2, event: SubtractNumber()),
    AddBlocUnitTest(number: 3, outcome: -3, event: SubtractNumber()),
  ];

  static void _widgetTest(AddBlocUnitTest addBlocUnitTest) =>
      test('bloc test with parameters: $addBlocUnitTest', () async {
        // Given AdderInterface is mocked
        final AdderMock4Test adderMock4Test = AdderMock4Test();
        when(() => adderMock4Test.number).thenReturn(addBlocUnitTest.number);
        GetIt.I.registerSingleton<AdderInterface>(adderMock4Test);

        // And the AddBloc object is created
        final AddBloc addBloc = AddBloc();

        // When the AddNumber event is called
        addBloc.add(addBlocUnitTest.event);

        // And the bloc is done
        await _waitForDone(addBloc);

        // Then I expect the result to be 2
        expect(addBloc.state.number, addBlocUnitTest.outcome);
      });

  static Future<void> _waitForDone(AddBloc addBloc) async {
    for (int x = 0; x < 100; x++) {
      await Future.delayed(const Duration(milliseconds: 10));
      if (addBloc.state is AddDone) {
        break;
      }
    }
  }

  static void run() {
    group(AddBlocUnitTest, () {
      setUp(() {
        GetIt.I.reset();
      });

      for (final item in _parameterList) {
        _widgetTest(item);
      }
    });
  }

  @override
  String toString() {
    String string = '';
    string += 'number: $number ';
    string += 'outcome: $outcome ';
    return string;
  }
}
