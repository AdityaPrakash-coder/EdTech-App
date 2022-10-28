import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iitpal_acharya_ui/constants/theme_colors.dart';
import 'package:iitpal_acharya_ui/screens/login_screen/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      title: "EKAL ACHARYA",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: MaterialThemeColors.primaryColor,
        primaryColorLight: MaterialThemeColors.primaryColorLight,
        primaryColorDark: MaterialThemeColors.primaryColorDark,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: MaterialThemeColors.primaryColor,
          actionTextColor: MaterialThemeColors.textColor,
        ),
      ),
      home: LoginPage(),
    );
  }
}
