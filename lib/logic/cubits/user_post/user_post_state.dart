part of 'user_post_cubit.dart';

@immutable
sealed class UserPostState {}

class UserPostLoadingState extends UserPostState {}

class UserPostLoadedState extends UserPostState {
  final List<UserPostModel> posts;
  UserPostLoadedState({required this.posts});
}

class UserPostErrorState extends UserPostState {
  final String errorMessage;

  UserPostErrorState({required this.errorMessage});
}
