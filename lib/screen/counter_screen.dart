import 'package:bloc_api_handling/logic/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Counter App",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xff2D2E40), Color(0xff6274FD)])),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                icon: Icon(
                  Icons.remove_circle_outline,
                  size: 30,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state is IncrementState) {
                    return Text(
                      state.val.toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  }

                     if (state is DecrementState) {
                    return Text(
                      state.val.toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  }

                  return  Text(
                      "0",
                      style: TextStyle(fontSize: 30),
                    );
                },
              ),
            ),
            IconButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
