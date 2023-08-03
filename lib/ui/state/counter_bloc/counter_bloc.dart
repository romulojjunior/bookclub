import 'package:bookclub/ui/state/counter_bloc/counter_event.dart';
import 'package:bookclub/ui/state/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(value: 0)) {
    on<IncrementCounterEvent>((event, emit) {
      int newValue = state.value + event.qty;
      emit(state.copyWith(value: newValue));
    });

    on<DecrementCounterEvent>((event, emit) {
      int newValue = state.value - event.qty;
      emit(state.copyWith(value: newValue));
    });
  }
}
