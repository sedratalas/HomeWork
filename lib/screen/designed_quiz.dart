
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/lose_page.dart';
import '../model/quiz_remote_data_model.dart';
import '../service.dart';
import 'add_quiz.dart';

class QuizScreen extends StatelessWidget {
   QuizScreen({Key? key}) : super(key: key);

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8D376F),
      body: FutureBuilder(
        future: QuizService().getAllQuiz(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QuizModel> quizes = snapshot.data!;
            return PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              itemCount: quizes.length,
              itemBuilder:
                  (context, index) =>
                      Container(
                        decoration: BoxDecoration(
                          gradient:  RadialGradient(
                              center: Alignment.center, colors: [Color(0xffF3BD6B),Color(0xff8D376F),]),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/Ellipse 12.png',),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset('assets/images/Ellipse 16.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Icon(Icons.arrow_back_outlined,color: Color(0XFFF3BD6B),size: 30,),
                              ),

                            ],
                          ),
                          Stack(
                          children: [
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient:LinearGradient(colors: [Color(0xfff3bd6b).withOpacity(0.9),Color(0xffda8bd9).withOpacity(0.9),],
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                  )
                              ),
                              width: 350,
                              height: 210,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("05",
                                          style: TextStyle(
                                            color: Color(0xff1F8435),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color:  Color(0xff1F8435),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      Expanded(child: SizedBox(width: 20,)),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text("07",
                                          style: TextStyle(
                                            color: Color(0xffD05A04),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Container(
                                          width: 36,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color:  Color(0xffD05A04),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text('Question ' + (index+1).toString()+"/" + '${quizes.length-1}',
                                      style: TextStyle(
                                        color:  Color(0xffA42FC1),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(quizes[index].questionText,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Align(
                            alignment: const AlignmentDirectional(0, -1.6),
                            child: Stack(
                              children: [
                                 Container(
                                  width: 75,
                                  height:75 ,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient:LinearGradient(colors: [Color(0xfff3bd6b),Color(0xffda8bd9)],
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                      )
                                  ),
                                   child: Center(child: Text('${(index + 1)}',
                                     style: TextStyle(
                                       fontSize: 20,
                                       fontWeight: FontWeight.w700,
                                       color: Color(0xff8D376F),
                                     ),
                                   ),
                                   ),

                                 ),
                            Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: CircularProgressIndicator(
                                    strokeAlign: 6,
                                    value: (index+1)/6,
                                    color:  Color(0xff8D376F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                                            ),
                          SizedBox(
                            height: 500,
                            child: GridView.builder(
                              itemCount: quizes[index].options.length,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                 mainAxisSpacing: 20,
                                mainAxisExtent: 60,
                                // crossAxisSpacing: 10,
                              ),
                              itemBuilder:
                                  (context, ind) => InkWell(
                                    onTap: () {
                                      if (index == snapshot.data!.length - 1) {
                                   // showModalBottomSheet(
                                   //     context: context,
                                   //     shape: RoundedRectangleBorder(
                                   //         borderRadius: BorderRadius.vertical(
                                   //           top: Radius.circular(15),
                                   //         ),
                                   //     ),
                                   //     builder: (context){
                                   //       return Container(
                                   //         width: 300,
                                   //         height: 300,
                                   //         color: Colors.red,
                                   //         child: Column(
                                   //           children: [
                                   //             Text("hey")
                                   //           ],
                                   //         ),
                                   //       );
                                   //     }
                                   // );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddQuiz(),
                                          ),
                                        );
                                       }
                                      if (quizes[index].options[ind].isCorrcet) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(content: Text("Correct")),
                                        );
                                          controller.nextPage(
                                            duration: Duration(milliseconds: 300),
                                            curve: Curves.easeIn,
                                          );
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(content: Text("Incorrect")),
                                        );
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 70.0, right: 70),
                                      child: Container(
                                        width: 200,
                                        height: 100,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 30.0),
                                              child: Text(
                                                textAlign: TextAlign.left,
                                                quizes[index].options[ind].answerText,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                          ],
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
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
