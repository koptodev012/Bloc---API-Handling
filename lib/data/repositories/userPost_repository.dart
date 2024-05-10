import 'dart:math';

import 'package:bloc_api_handling/data/Models/userPost_model.dart';
import 'package:bloc_api_handling/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class UserPostRepository {
  API api = API();

  // Fetch Data
  Future<List<UserPostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((e) => UserPostModel.fromJson(e)).toList();
    }  catch (e) {
      throw e;
    }
  }
}
