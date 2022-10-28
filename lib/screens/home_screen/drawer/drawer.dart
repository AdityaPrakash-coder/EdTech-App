import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/screens/home_screen/drawer/monthly_quiz.dart';

import '../../../constants/theme_colors.dart';
import 'creat_video.dart';
class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MaterialThemeColors.primaryColor,
        child: ListView(
// Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
        DrawerHeader(
        decoration: BoxDecoration(

          color: MaterialThemeColors.primaryColor,
    ),
    child: Center(child:Text('Events',style: TextStyle(fontSize: 30),)),
    ),
    ListTile(
    title: const Text('Youtube Page',style: TextStyle(fontSize: 25),),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => UploadVideoPage()));
// Update the state of the app.
// ...
    },
    ),
          ListTile(
            title: const Text('Monthly Quiz',style: TextStyle(fontSize: 25),),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MonthlyQuizPage()));
// Update the state of the app.
// ...
            },
          ),
    ListTile(
    title: const Text('Back',style: TextStyle(fontSize: 20),),
    onTap: () {
    Navigator.of(context).pop();
// Update the state of the app.
// ...
    },
    ),
    ],
    ),
    );
  }
}

