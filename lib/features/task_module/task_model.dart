class TaskModel{
  String title;
  String description;
  String?  duedate;
  String userId;
  String assignTo;
  TaskModel({required this.assignTo,required this.description,required this.duedate,required this.title,required this.userId});
  factory TaskModel.jsonFromServer(Map<String,dynamic> json){
    return TaskModel(
        assignTo: json['assignTo'],
        description: json['description'],
        duedate: json['duedate'],
        title: json['title'], userId: json['userId']);
  }

  Map<String, dynamic> toServer()=>{
    'title':title,
    'description':description,
    'duedate':duedate,
    'userId':userId,
    'assignTo':assignTo
  };
}

