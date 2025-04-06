import 'package:flutter/material.dart';
import 'package:to_do_app/model/quiz_model.dart';

class Quiz extends StatelessWidget {
   Quiz({Key? key}) : super(key: key);
  PageController controller = PageController();
final List<QuizModel> quizList = [
   QuizModel(
   question: "How old are you?",
   answer: [
   Answer(answer: "10", isCorrect: false),
   Answer(answer: "20", isCorrect: true),
   Answer(answer: "30", isCorrect: false),
   Answer(answer: "40", isCorrect: false),
   ]),
   QuizModel(
   question: "What is your fav color?",
   answer: [
   Answer(answer: "green", isCorrect: false),
   Answer(answer: "red", isCorrect: false),
   Answer(answer: "rose", isCorrect: true),
   Answer(answer: "yellow", isCorrect: false),
   ]),
   QuizModel(
   question: "what is your native language?",
   answer: [
   Answer(answer: "arabic", isCorrect: true),
   Answer(answer: "english", isCorrect: false),
   Answer(answer: "turkish", isCorrect: false),
   Answer(answer: "spanish", isCorrect: false),
   ]),
];

   final List<Color> answerColors = [
     Color(0xffFFE8C9),
     Color(0xffDFECDB),
     Color(0xffEBDDEC),
     Color(0xffEAEBDD),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: PageView.builder(
        controller: controller,
          itemCount: quizList.length,
          itemBuilder: (context,index)=>
              Column(
                children: [
                  ListTile(
                    title: Text(quizList[index].question,
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
                      itemCount: quizList[index].answer.length,
                      itemBuilder: (context,inx)=>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: answerColors[inx % answerColors.length],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: InkWell(
                                onTap: (){
                                  if(quizList[index].answer[inx].isCorrect){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("your answer is correct "),
                                        backgroundColor: Colors.green,
                                      ),
                                    );

                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("your answer is un correct "),
                                          backgroundColor: Colors.red),
                                    );
                                  }
                                  controller.nextPage(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: Center(
                                  child: Text(
                                      quizList[index].answer[inx].answer
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
