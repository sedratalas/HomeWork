class CommentModel{
  int postId;
  int id;
  String name;
  String email;
  String body;

  CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
});

  Map<String, dynamic> toMap()=>{
   "postId" : postId,
   "id" : id ,
   "name" : name,
   "email" : email,
    "body":body,
    };

factory CommentModel.fromMap(Map<String, dynamic> map)=>CommentModel(
    postId: map["postId"],
    id: map["id"],
    name: map["name"],
    email: map["email"],
    body: map["body"],
);

  @override
  String toString() {
    return 'CommentModel{postId: $postId, id: $id, name: $name, email: $email, body: $body}';
  }
}
