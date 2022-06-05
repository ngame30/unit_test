import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test/adder.dart';
import 'package:unit_test/main.dart';

class AdderMock4Test extends Mock implements AdderInterface {}

void main() => AdderWidgetTest.run();

class AdderWidgetTest {
  AdderWidgetTest({
    required this.button,
    required this.number,
    required this.times,
    required this.outcome,
  });

  final Finder button;
  final int number;
  final int times;
  final int outcome;

  static final List<AdderWidgetTest> _parameterList = [
    AdderWidgetTest(
      number: 1,
      times: 1,
      outcome: 1,
      button: find.byIcon(Icons.add),
    ),
    AdderWidgetTest(
      number: 1,
      times: 2,
      outcome: 2,
      button: find.byIcon(Icons.add),
    ),
    AdderWidgetTest(
      number: 1,
      times: 3,
      outcome: 3,
      button: find.byIcon(Icons.add),
    ),
    AdderWidgetTest(
      number: 2,
      times: 1,
      outcome: 2,
      button: find.byIcon(Icons.add),
    ),
    AdderWidgetTest(
      number: 2,
      times: 2,
      outcome: 4,
      button: find.byIcon(Icons.add),
    ),
    AdderWidgetTest(
      number: 2,
      times: 3,
      outcome: 6,
      button: find.byIcon(Icons.add),
    ),
    AdderWidgetTest(
      number: 3,
      times: 1,
      outcome: 3,
      button: find.byIcon(Icons.add),
    ),
    AdderWidgetTest(
      number: 3,
      times: 2,
      outcome: 6,
      button: find.byIcon(Icons.add),
    ),
    AdderWidgetTest(
      number: 3,
      times: 3,
      outcome: 9,
      button: find.byIcon(Icons.add),
    ),
    AdderWidgetTest(
      number: 1,
      times: 1,
      outcome: -1,
      button: find.byIcon(Icons.remove),
    ),
    AdderWidgetTest(
      number: 1,
      times: 2,
      outcome: -2,
      button: find.byIcon(Icons.remove),
    ),
    AdderWidgetTest(
      number: 1,
      times: 3,
      outcome: -3,
      button: find.byIcon(Icons.remove),
    ),
    AdderWidgetTest(
      number: 2,
      times: 1,
      outcome: -2,
      button: find.byIcon(Icons.remove),
    ),
    AdderWidgetTest(
      number: 2,
      times: 2,
      outcome: -4,
      button: find.byIcon(Icons.remove),
    ),
    AdderWidgetTest(
      number: 2,
      times: 3,
      outcome: -6,
      button: find.byIcon(Icons.remove),
    ),
    AdderWidgetTest(
      number: 3,
      times: 1,
      outcome: -3,
      button: find.byIcon(Icons.remove),
    ),
    AdderWidgetTest(
      number: 3,
      times: 2,
      outcome: -6,
      button: find.byIcon(Icons.remove),
    ),
    AdderWidgetTest(
      number: 3,
      times: 3,
      outcome: -9,
      button: find.byIcon(Icons.remove),
    ),
  ];

  static void _widgetTest(AdderWidgetTest adderWidgetTest) =>
      testWidgets('Adder mock widget test with parameters: $adderWidgetTest',
          (WidgetTester tester) async {
        // Given the Adders number is set to 2
        final AdderMock4Test adderMock4Test = AdderMock4Test();
        when(() => adderMock4Test.number).thenReturn(adderWidgetTest.number);
        GetIt.I.registerLazySingleton<AdderInterface>(() => adderMock4Test);
        await tester.pumpWidget(
          const MyApp(),
        );

        // When the plus button ts tapped
        for (int x = 0; x < adderWidgetTest.times; x++) {
          await tester.tap(adderWidgetTest.button);
          await tester.pump(
            const Duration(milliseconds: 50),
          );
        }

        // Then I expect the result to be 2
        expect(
          find.text(
            (adderWidgetTest.outcome + 1).toString(),
          ),
          findsNothing,
        );
        expect(
          find.text(
            adderWidgetTest.outcome.toString(),
          ),
          findsOneWidget,
        );
        expect(
          find.text(
            (adderWidgetTest.outcome - 1).toString(),
          ),
          findsNothing,
        );
      });

  static void run() {
    group(AdderWidgetTest, () {
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
    string += 'times: $times ';
    string += 'outcome: $outcome ';
    return string;
  }
}
