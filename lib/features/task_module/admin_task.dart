import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:phone_tech_london/features/task_module/task_model.dart';


class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskAssignmentScreen(),
    );
  }
}

class TaskAssignmentScreen extends StatefulWidget {
  const TaskAssignmentScreen({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}
Future<dynamic>assignTask(Map<String,dynamic> body)async{
  print(body);
  http.Response _response=await http.post(
      Uri.parse('https://www.keepconnected.duckdns.org/task/tasks/tasklist.php'),
  body:body);
  var value= jsonDecode(_response.body);
  print(value);
  return value;
}
class _MyAppState extends State<TaskAssignmentScreen> {
  TextEditingController titleController=TextEditingController();
  TextEditingController textEditingController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  DateTime date=DateTime(2022,06,29);
  String? dateX;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -10,
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text('Raman'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () { },),),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
              child: NewWidget(text: 'Title', height: 35, maxLines: 1, controller: titleController,),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Due date',style:TextStyle(color: Colors.white,fontSize: 12)),
                    SizedBox(height: 10,),
                    Container(height: 40,
                        color: Colors.white,
                        child:TextFormField(
                          controller: textEditingController,
                          decoration:  InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero
                              ),
                              suffixIcon: IconButton(
                                icon:Icon(Icons.date_range),
                                onPressed: () async{ DateTime? chosenDate= await showDatePicker(
                                    context: context, initialDate: date,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2023));
                                 dateX=DateFormat().add_yMMMEd().format(chosenDate!);
                                textEditingController.text=dateX!;
                                setState(() {
                                  textEditingController.text=dateX!;
                                });
                                },)
                          ),
                        )),
                  ],
                )
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                child: NewWidget(text: 'Description', height: 145, maxLines: 7, controller: descriptionController,)
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 30),
              child: Container(
                height: 40,width: 80,
                color: Colors.white,
                padding: EdgeInsets.zero,
                child: TextButton(child: Text('Assign',style: TextStyle(fontSize: 20,color: Colors.black),),
                  onPressed: ()async{
                  final String title=titleController.text;
                  final String? duedate=dateX;
                  final String description=descriptionController.text;
                  final String assignedTo ='User';
                  final String userId='11';
                  final body=await TaskModel(
                      userId: userId, duedate: duedate,title: title,assignTo: assignedTo,description: description).toServer();
                 var status= await assignTask({
                    'title':titleController.text,
                    'description' : descriptionController.text,
                    'duedate':'2022-05-05',
                  'userId':'11',
                  'assignTo':'11'
                  });
                },),
              ),
            )
          ],

        ),
      ),
    )
    ;
  }
}

class NewWidget extends StatelessWidget {
  String text;
  double height;
  int maxLines;
  TextEditingController controller;
  NewWidget({required this.height,required this.text,required this.maxLines,required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style:TextStyle(color: Colors.white,fontSize: 12)),
        SizedBox(height: 10,),
        Container(width: double.infinity,height: height,color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none
              ),
              controller: controller,
              maxLines: maxLines,
            ),
          ),
        )
      ],
    );
  }
}
