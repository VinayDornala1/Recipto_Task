part of 'ratnadeep_bloc.dart';

sealed class RatnadeepState extends Equatable {
  const RatnadeepState();
}

final class RatnadeepInitial extends RatnadeepState {
  @override
  List<Object> get props => [];
}
