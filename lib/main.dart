import 'package:bloc_api_handling/logic/cubits/counter/counter_cubit.dart';
import 'package:bloc_api_handling/logic/cubits/user_post/user_post_cubit.dart';
import 'package:bloc_api_handling/screen/counter_screen.dart';
import 'package:bloc_api_handling/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserPostCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc - API Handling',
        home: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return CounterScreen();
          },
        ),
      ),
    );
  }
}
