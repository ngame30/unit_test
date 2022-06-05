import 'package:get_it/get_it.dart';
import 'package:gherkin/gherkin.dart';

class HookExample extends Hook {
  /// The priority to assign to this hook.
  /// Higher priority gets run first so a priority of 10 is run before a priority of 2
  @override
  int get priority => 1;

  /// Run before a scenario and it steps are executed
  @override
  Future<void> onBeforeScenario(
    TestConfiguration config,
    String scenario,
    Iterable<Tag> tags,
  ) async {
    GetIt.I.reset();
  }
}
