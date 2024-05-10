import 'package:bloc_api_handling/logic/cubits/user_post/user_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2D2E40),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "API Handling",
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
      body: SafeArea(
          child: BlocConsumer<UserPostCubit, UserPostState>(
              listener: ((context, state) {
        if (state is UserPostErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
            backgroundColor: Colors.red,
          ));
        }
      }), builder: ((context, state) {
        if (state is UserPostLoadingState) {
          return Center(
              child: SpinKitFadingFour(
            color: Colors.white,
            size: 50.0,
          ));
        }
        if (state is UserPostLoadedState) {
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                var data = state.posts;
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 5, bottom: 5),
                  child: Card(
                    color: Color(0xff6274FD),
                    child: ListTile(
                      title: Text(
                        data[index].title.toString(),
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      subtitle: Text(
                        data[index].body.toString(),
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                );
              });
        }
        return Center(
          child: Text("An error occured!"),
        );
      }))),
    );
  }
}
