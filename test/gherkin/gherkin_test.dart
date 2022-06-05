import 'package:flutter_gherkin/flutter_gherkin_with_driver.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_test/flutter_test.dart' as test;
import 'package:glob/glob.dart';

import 'hooks/hook_example.dart';
import 'steps/then_i_expect_the_result_to_be.dart';
import 'steps/data_table_example_step.dart';
import 'steps/when_i_call_the_event_times.dart';
import 'worlds/adder.world.dart';

void main() async {
  test.test('description', () async {
    final List<StepDefinitionGeneric<World>> steps = [
      givenIMockAdderInterface,
      thenIExpectTheResultToBe,
      whenICallTheEventTimes,
    ];
    final config = TestConfiguration.DEFAULT(steps)
      ..features = [
        Glob('test/gherkin/feature/**.feature'),
      ]
      ..defaultTimeout = const Duration(seconds: 10)
      ..tagExpression = 'not @fail'
      ..hooks = [HookExample()]
      ..stopAfterTestFailed = false
      ..createWorld = (_) => Future.value(
            AdderWorld(),
          );

    await GherkinRunner().execute(config);
  });
}
