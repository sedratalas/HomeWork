import 'package:flutter/material.dart';
import 'package:intro_to_state_managment/service/comment_sercice.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffCFAFB0),
        title: Text("Comments"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: CommentService().getComment(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xffCFAFB0),
                           child: Text(snapshot.data![index].id.toString()),
                          ),
                          title: Text(snapshot.data![index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(snapshot.data![index].body),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                }
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}
