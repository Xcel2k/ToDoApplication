import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/task_data.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// ignore: camel_case_types
class Add_Task_screen extends StatefulWidget {

  @override
  State<Add_Task_screen> createState() => _Add_Task_screenState();
}

class _Add_Task_screenState extends State<Add_Task_screen> {
  String selectedValue;

  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding:
            EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add a new task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            CupertinoTextField(
              textCapitalization: TextCapitalization.sentences,
              scrollPhysics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskTitle = value;
              },
              onSubmitted: (newTaskTitle) {
                if (newTaskTitle != "") {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  BotToast.showSimpleNotification(
                    title: 'To Do List 📝',
                    subTitle: 'Task added successfully',
                    borderRadius: 15.0,
                  );
                  Navigator.pop(context);
                  print(newTaskTitle);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.transparent,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              width: double.infinity,
              child: TextButton(

                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.black12,
                  textStyle: const TextStyle(fontSize: 20),
                ),

                onPressed: () {
                  if (newTaskTitle == null) {
                    BotToast.showSimpleNotification(
                      title: 'To Do List 📝',
                      subTitle: 'No changes made!',
                      borderRadius: 15.0,
                    );
                    Navigator.pop(context);
                  } else {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                    BotToast.showSimpleNotification(
                      title: 'To Do List 📝',
                      subTitle: 'Task has been added successfully!',
                      borderRadius: 15.0,
                    );
                    Navigator.pop(context);
                    print(newTaskTitle);
                  }
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.transparent,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0,2),
              ),
             ],
            ),
              width: double.infinity,
              child: TextButton(
              style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.black12,
              textStyle: const TextStyle(fontSize: 20),
              ),

              onPressed: () {

              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.transparent,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0,2),
                    ),
                  ],
                ),
                child: DropdownButton2 (
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme
                          .of(context)
                          .hintColor,
                    ),
                  ),
                  items: items
                      .map((item) =>
                      DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  buttonHeight: 40,
                  buttonWidth: 140,
                  itemHeight: 40,
                ),
              );


              BotToast.showSimpleNotification(
                title: 'To Do List 📝',
                subTitle: 'Priority has been set',
                duration: Duration(seconds: 5),
                borderRadius: 15.0,
              );

              },
                child: Text(
                  'Priority',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
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
