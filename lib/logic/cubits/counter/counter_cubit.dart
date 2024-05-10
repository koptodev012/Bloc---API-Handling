import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

int count = 0;

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(val: count)) {}

  // Functions

  void increment() {
    count++;
    emit(CounterInitial(val: count));
  }

  void decrement() {
    if (count > 0) {
      count--;
      emit(CounterInitial(val: count));
    }
  }
}
