
import 'package:dio/dio.dart';

import 'model/quiz_remote_data_model.dart';

class QuizService{
  Dio dio = Dio();
  late Response response;

  Future<QuizModel?> getOneQuiz() async{
    try{
      response = await dio.get("https://676bde06bc36a202bb85fc11.mockapi.io/Quiz/1");
      print(response.data);
      return QuizModel.fromMap(response.data);
    }catch(e){
      print(e);
      return null;
    }
  }

  Future<List<QuizModel>> getAllQuiz() async {
    try {
      final response = await dio.get("https://676bde06bc36a202bb85fc11.mockapi.io/Quiz/");
      List<QuizModel> quizzes = [];
      for(var i=0; i<response.data.length;i++){
        quizzes.add(QuizModel.fromMap(response.data[i]));
      }
      return quizzes;
    } catch (e) {
      print(e);
      return [];
    }
  }

  createNewQuiz(QuizModel quiz) async {
    try {
      print(quiz.toMap());
      response = await dio.post("https://676bde06bc36a202bb85fc11.mockapi.io/Quiz/", data: quiz.toMap());
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
