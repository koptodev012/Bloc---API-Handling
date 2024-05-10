import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

int count = 0;

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial()) {}

  // Functions

  void increment() {
    count++;
    emit(IncrementState(val: count));
  }

  void decrement() {
    if (count > 0) {
      count--;
      emit(DecrementState(val: count));
    }
  }
}
