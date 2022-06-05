import 'package:gherkin/gherkin.dart';

import '../worlds/adder.world.dart';

final thenIExpectTheResultToBe = then1<num, AdderWorld>(
  'I expect the result to be {num}',
  (outcome, context) async {
    context.expectMatch(context.world.addBloc.state.number, outcome.toInt());
  },
);
