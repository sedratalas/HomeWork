import 'package:flutter/material.dart';

import '../model/quiz_remote_data_model.dart';
import '../service.dart';


class AddQuiz extends StatelessWidget {
   AddQuiz({Key? key}) : super(key: key);

  TextEditingController question = TextEditingController();

  TextEditingController answer1 = TextEditingController();
  TextEditingController answer2 = TextEditingController();
  TextEditingController answer3 = TextEditingController();
  TextEditingController answer4 = TextEditingController();
  TextEditingController indexOfCorrect = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:LinearGradient(colors: [Color(0xfff3bd6b),Color(0xffda8bd9),],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
Container(
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.5),
    borderRadius: BorderRadius.circular(15),
  ),

  width: 300,
  height: 55,
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text('Add Questions',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),

    ),
  ),
),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 240,
                  height: 48,
                  child: TextField(
                    // enabled: false,
                    controller: question,
                    onChanged: (value) {
                    },

                    decoration: InputDecoration(
                      labelText: "Question text",
                      filled:true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),

                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 240,
                  height: 48,
                  child: TextField(
                    controller: answer1,
                    onChanged: (value) {
                    },

                    decoration: InputDecoration(
                      labelText: "answer 1",
                      filled:true,
                      fillColor: Colors.white,
                      suffixIcon: Checkbox(value: false, onChanged: (value){},activeColor: Color(0xff8D376F),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 240,
                  height: 48,
                  child: TextField(
                    controller: answer2,
                    onChanged: (value) {
                    },

                    decoration: InputDecoration(
                      labelText: "answer 2",
                      filled:true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 240,
                  height: 48,
                  child: TextField(
                    // enabled: false,
                    controller: answer3,
                    onChanged: (value) {
                      // print(value);
                      // print(controller.text);
                    },

                    decoration: InputDecoration(
                      labelText: "answer 3",
                      filled:true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 240,
                  height: 48,
                  child: TextField(
                    // enabled: false,
                    controller: answer4,
                    onChanged: (value) {
                      // print(value);
                      // print(controller.text);
                    },
                    decoration: InputDecoration(
                      labelText: "answer 4",
                      filled:true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      ),
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    controller: indexOfCorrect,
                    onChanged: (value) {
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled:true,
                      fillColor: Colors.white,
                      labelText: "index Of Correct",

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  List<Answer> options = [];
                  if (int.parse(indexOfCorrect.text) >= 0 &&
                      int.parse(indexOfCorrect.text) < 4) {
                    options = [
                      Answer(answerText: answer1.text, isCorrcet: false,),
                      Answer(answerText: answer2.text, isCorrcet: false),
                      Answer(answerText: answer3.text, isCorrcet: false),
                      Answer(answerText: answer4.text, isCorrcet: false),
                    ];
                    for (int i = 0; i < 4; i++) {
                      if (i == int.parse(indexOfCorrect.text)) {
                        options[i].isCorrcet = true;
                      }
                    }
                  }
                  QuizModel quiz = QuizModel(
                    questionText: question.text,
                    options: options,
                  );
                  QuizService().createNewQuiz(quiz);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color:  Color(0xff8D376F),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    width: 300,
                    height: 59,
                    child: Center(child: Text('Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
