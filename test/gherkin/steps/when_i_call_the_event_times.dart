import 'package:gherkin/gherkin.dart';
import 'package:unit_test/bloc/add_bloc.dart';

import '../worlds/adder.world.dart';

final whenICallTheEventTimes = when2<String, int, AdderWorld>(
  'I call the {string} {int} times',
  (event, times, context) async {
    for (int x = 0; x < times; x++) {
      if (event == 'AddNumber') {
        context.world.addBloc.add(AddNumber());
      } else if (event == 'SubtractNumber') {
        context.world.addBloc.add(SubtractNumber());
      } else {
        throw Exception('event $event not found');
      }

      await _waitForDone(context.world.addBloc);
    }
  },
);

Future<void> _waitForDone(AddBloc addBloc) async {
  for (int x = 0; x < 100; x++) {
    await Future.delayed(const Duration(milliseconds: 10));
    if (addBloc.state is AddDone) {
      break;
    }
  }
}
