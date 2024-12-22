import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ratnadeep_event.dart';
part 'ratnadeep_state.dart';

class RatnadeepBloc extends Bloc<RatnadeepEvent, RatnadeepState> {
  RatnadeepBloc() : super(RatnadeepInitial()) {
    on<RatnadeepEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
