import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


///todo tile
// ignore: must_be_immutable
class Todotile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


   Todotile({super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
   required this. deleteFunction
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
            motion:StretchMotion(),
            children: [
              SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
                borderRadius: BorderRadius.circular(12) ,
              )
            ]),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children:[
                 Checkbox(
                     value: taskCompleted,
                     onChanged: onChanged,
                   activeColor: Colors.black,

                 ),
                Text (taskName,
                  style: TextStyle(
                      decoration: taskCompleted? 
                      TextDecoration.lineThrough
                          : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
///button
class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
   MyButton({
     super.key,
     required this. text,
     required this. onPressed
   });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}


///todolist
// import 'package:flutter/material.dart';
// import 'package:todolist/toDotile.dart';

// import 'diialog_box.dart';

class toDolist extends StatefulWidget {
   toDolist({super.key,});
  @override
  State<toDolist> createState() => _toDolistState();
}
class _toDolistState extends State<toDolist> {
  // TextEditingController myController = TextEditingController();
  // String greetMessage = "";
  // void greetUser(){
  //   setState(() {
  //     greetMessage = "hello "+myController.text;
  final _controller = TextEditingController();
  List todolist = [
      ["today's task ", false],
    ["do Exercise",false],
  ];
  void checkBoxChanged(bool? value, int index){
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }
  void saveNewTask(){
    setState(() {
      todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox (
        controller: _controller,
        onSave: saveNewTask,
        onCancel: ()=> Navigator.of(context).pop(),
      );
    });
  }
  void deleteTask(int index){
    print(todolist);
    setState(() {
      todolist.removeAt(index);
    });
    print(todolist);
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(greetMessage),
      //         TextField(
      //           controller: myController,
      //           decoration: InputDecoration(
      //             border: OutlineInputBorder(),
      //             hintText: "type your name..",
      //           ),
      //         ),
      //         ElevatedButton(onPressed: greetUser,
      //             child: Text("tap"),)
      //       ],
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text(" To DO List"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ) ,
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context, index){
          return Todotile(
              taskName: todolist[index][0],
              taskCompleted: todolist[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context)=> deleteTask(index),
          );
        },
      ),
    );
  }
}

///dilogbox


// import 'package:flutter/material.dart';
// import 'package:todolist/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
 DialogBox({super.key,
   required this.controller,
   required this.onSave,
   required this.onCancel,
 });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(height: 128,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(),
                hintText: "add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                SizedBox(width: 10,),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
        ],
      ),
      ),
    );
  }
}
