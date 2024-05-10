part of 'counter_cubit.dart';

@immutable
sealed class CounterState {

}

final class CounterInitial extends CounterState {
  int val;
  CounterInitial({required this.val});
}


