import 'package:flutter/material.dart';
import 'package:to_do_app/model/quiz_model.dart';
import 'package:to_do_app/service.dart';

import '../helper/quiz_check_helper.dart';

class OneQuizRemote extends StatelessWidget {
   OneQuizRemote({Key? key}) : super(key: key);
final QuizService quizService = QuizService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
              future: QuizService().getOneQuiz(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(snapshot.data!.questionText,
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 400,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 100,
                            ),
                            itemCount: snapshot.data!.options.length,
                            itemBuilder: (context,inx)=>
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      //color: answerColors[inx % answerColors.length],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: InkWell(
                                      onTap: (){
        
                                      },
                                      child: Center(
                                        child: Text(
                                          snapshot.data!.options[inx].answerText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                }else{
                  return Center(child: CircularProgressIndicator(),);
                }
              }
        
          ),
        ),
      ),
    );
  }
}
