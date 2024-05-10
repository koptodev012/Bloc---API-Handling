import 'package:bloc/bloc.dart';
import 'package:bloc_api_handling/data/Models/userPost_model.dart';
import 'package:bloc_api_handling/data/repositories/userPost_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'user_post_state.dart';

class UserPostCubit extends Cubit<UserPostState> {
  UserPostCubit() : super(UserPostLoadingState()) {
    fetchPosts();
  }

  //------------------ Function ----------------------
  UserPostRepository userPostRepository = UserPostRepository();

  void fetchPosts() async {
    try {
      List<UserPostModel> user_posts = await userPostRepository.fetchPosts();
      emit(UserPostLoadedState(posts: user_posts));
    } on DioException catch (e) {
      emit(UserPostErrorState(errorMessage: e.type.toString()));
    }
  }

//-----------------------------------------------------
}
