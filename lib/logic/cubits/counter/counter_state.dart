part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {

}

class IncrementState extends CounterState {
  int val;
  IncrementState({required this.val});
}

class DecrementState extends CounterState {
  int val;
  DecrementState({required this.val});
}
