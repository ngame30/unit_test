import 'package:get_it/get_it.dart';
import 'package:gherkin/gherkin.dart';
import 'package:mocktail/mocktail.dart' as mocktail;
import 'package:unit_test/adder.dart';

import '../worlds/adder.world.dart';

class AdderMock4Test extends mocktail.Mock implements AdderInterface {}

final givenIMockAdderInterface = given1<int, AdderWorld>(
  'I mock AdderInterface with the number {int}',
  (number, context) async {
    final AdderMock4Test adderMock4Test = AdderMock4Test();
    mocktail.when(() => adderMock4Test.number).thenReturn(number);
    GetIt.I.registerSingleton<AdderInterface>(adderMock4Test);
  },
);
