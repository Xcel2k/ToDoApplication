import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:to_do/models/task_data.dart';
import 'package:to_do/screens/custom_dialog.dart';
import 'package:to_do/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class Tasks_Screen extends StatefulWidget {

  @override
  State<Tasks_Screen> createState() => _Tasks_ScreenState();
}

class _Tasks_ScreenState extends State<Tasks_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              currentAccountPictureSize: Size.fromRadius(35),
              accountName: Text(
                'To Do',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text('Your personal To Do List App'),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Image(
                    image: AssetImage("assets/logo_transparent_signed.png"),
                  )),
            ),
            ListTile(
              leading: Icon(Icons.check_box),
              title: Text('Check All'),
              enabled: true,
              onTap: () {
                checkAll(context);
              },
            ),
            ListTile(
              onTap: () {
                uncheckAll(context);
              },
              leading: Icon(Icons.check_box_outline_blank_rounded),
              title: Text('UnCheck All'),
            ),
            ListTile(
              onTap: () {
                Alert(
                  context: context,
                  type: AlertType.warning,
                  title: 'To Do List 📝',
                  desc:
                      'This is irreversible, you might end up losing all your tasks.\n Are you sure ?',
                  buttons: [
                    DialogButton(
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                    ),
                    DialogButton(
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        dAll(context);
                      },
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(116, 116, 191, 1.0),
                        Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                    )
                  ],
                ).show();
              },
              leading: Icon(Icons.delete),
              title: Text('Delete All'),
            ),
            ListTile(
              onTap: () {
              showDialog (
                context: context,
                builder: (BuildContext context)
                  {
                    return CustomDialogBox2(
                      title: 'This is where we will change our theme',
                      descriptions: 'New Theme',
                      text: 'Change it now!',
                    );
                  }
              );
              },
              leading: Icon(Icons.palette),
              title: Text('Change Theme'),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialogBox(
                        title: 'Features of our Application',
                        descriptions:
                            ' 📝 A simple ad free To Do App\n 📝 Press the add icon to add a new task\n 📝 Swipe left or right on any task to delete\n 📝 Check or Uncheck any task\n 📝 Delete all tasks at once\n 📝 Check all tasks at once \n 📝 Dual Themed Application',
                        text: 'Reach out to us!',
                      );
                    });
              },
              leading: Icon(Icons.analytics),
              title: Text('About'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => Add_Task_screen());
        },
        elevation: 12.0,
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 0.0, left: 30, right: 30.0, bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image(
                        height: 100,
                        width: 100,
                        image: AssetImage(
                          "assets/logo_transparent_signed.png",
                        ),
                      ),
                      Text(
                        'Automated ToDo List',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 30,
                              offset:
                                  Offset(8,3), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        margin: EdgeInsets.all(5),
                        child: Text(
                          '${Provider.of<TaskData>(context).tasks.length}',
                          style: TextStyle(
                              fontSize: 60.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Text(
                        'Tasks left',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'OpenSans-Light',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.0,
                  vertical: 2.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TasksWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void changeTheme(BuildContext context){
  Colors.black;
}
void dAll(BuildContext context) {
  Provider.of<TaskData>(context, listen: false).deleteAll();
  BotToast.showSimpleNotification(
    title: 'To Do List 📝',
    subTitle: 'You have deleted all tasks!',
    borderRadius: 15.0,
  );
  Navigator.pop(context);
}

void checkAll(BuildContext context) {
  Provider.of<TaskData>(context, listen: false).checkAll();
  BotToast.showSimpleNotification(
    title: 'To Do List 📝',
    subTitle: 'You have checked all tasks successfully!',
    borderRadius: 15.0,
  );
  Navigator.pop(context);
}

void uncheckAll(BuildContext context) {
  Provider.of<TaskData>(context, listen: false).uncheckAll();
  BotToast.showSimpleNotification(
    title: 'To Do List 📝',
    subTitle: 'You have unchecked all tasks!',
    borderRadius: 15.0,
  );
  Navigator.pop(context);
}
