//
// import 'package:flutter/material.dart';
// import '../model/quiz_remote_data_model.dart';
// import '../service.dart';
//
// class QuizScreen extends StatefulWidget {
//   const QuizScreen({Key? key}) : super(key: key);
//
//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }
//
// class _QuizScreenState extends State<QuizScreen> {
//   final PageController _controller = PageController();
//   late Future<List<QuizModel>> _quizFuture;
//
//   final List<Color> answerColors = [
//     Color(0xffFFE8C9),
//     Color(0xffDFECDB),
//     Color(0xffEBDDEC),
//     Color(0xffEAEBDD),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _quizFuture = QuizService().getQuizzes();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Quiz App"),
//         backgroundColor: Colors.purpleAccent,
//       ),
//       body: FutureBuilder<List<QuizModel>>(
//         future: _quizFuture,
//         builder: (context, snapshot) {
//
//           final quizzes = snapshot.data!;
//           if(snapshot.hasData){
//             return PageView.builder(
//               controller: _controller,
//               itemCount: quizzes.length,
//               itemBuilder: (context, index) {
//                 final quiz = quizzes[index];
//                 return Column(
//                   children: [
//                     ListTile(
//                       title: Text(
//                         quiz.questionText,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 400,
//                       child: GridView.builder(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisExtent: 100,
//                         ),
//                         itemCount: quiz.options.length,
//                         itemBuilder: (context, inx) => Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: answerColors[inx % answerColors.length],
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: InkWell(
//                               onTap: () {
//                                 if(quiz.options[inx].isCorrcet){
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                       content: Text("your answer is correct "),
//                                       backgroundColor: Colors.green,
//                                     ),
//                                   );
//
//                                 }else{
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(
//                                         content: Text("your answer is un correct "),
//                                         backgroundColor: Colors.red),
//                                   );
//                                 }
//                                 _controller.nextPage(
//                                   duration: Duration(seconds: 1),
//                                   curve: Curves.easeIn,
//                                 );
//                               },
//                               child: Center(
//                                 child: Text(
//                                   quiz.options[inx].answerText,
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             );
//           }else{
//             return Center(child: CircularProgressIndicator());
//           }
//
//
//         },
//       ),
//     );
//   }
// }
