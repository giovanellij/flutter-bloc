import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    log('Transition: $transition');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    log('Error $error $stackTrace');
    super.onError(error, stackTrace);
  }

  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) {
      // handle incoming `CounterIncrementPressed` event
      return emit(state + 1);
    });
    on<CounterDecrementPressed>((event, emit) {
      // handle incoming `CounterIncrementPressed` event
      return emit(state - 1);
    });
  }
}
