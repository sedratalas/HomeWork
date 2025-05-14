import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intro_to_state_managment/model/comment_model.dart';

class CommentService {
  Dio dio = Dio();
  late Response response;
  String baseUrl = "https://jsonplaceholder.typicode.com/comments";

  Future<List<CommentModel>> getComment() async {
    try {
      response = await dio.get(baseUrl);
      List<CommentModel> comments = await compute<List<dynamic>,List<CommentModel>>(parseComments, response.data);
      return comments;
    } catch (e) {
      print(e);
      return [];
    }
  }
}

List<CommentModel> parseComments(List<dynamic> responseData) {
  return responseData.map((e) => CommentModel.fromMap(e)).toList();
}