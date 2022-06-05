import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unit_test/adder.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(const AddInitial(number: 0)) {
    on<AddNumber>(_addNumber);
    on<SubtractNumber>(_subtractNumber);

    _number = 0;
  }

  late int _number;

  FutureOr<void> _addNumber(AddNumber event, Emitter<AddState> emit) {
    emit(AddInitial(number: _number));

    final AdderInterface adderInterface = GetIt.I.get<AdderInterface>();
    _number += adderInterface.number;

    emit(AddDone(number: _number));
  }

  FutureOr<void> _subtractNumber(SubtractNumber event, Emitter<AddState> emit) {
    emit(AddInitial(number: _number));

    final AdderInterface adderInterface = GetIt.I.get<AdderInterface>();
    _number -= adderInterface.number;

    emit(AddDone(number: _number));
  }
}
