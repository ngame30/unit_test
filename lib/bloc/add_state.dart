part of 'add_bloc.dart';

abstract class AddState {
  const AddState({
    required this.number,
  });

  final int number;
}

class AddInitial extends AddState {
  const AddInitial({required super.number});
}

class AddDone extends AddState {
  const AddDone({required super.number});
}
