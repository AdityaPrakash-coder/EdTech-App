import 'dart:core';
import 'package:iitpal_acharya_ui/screens/review_screen/attendance_review.dart';
import 'package:iitpal_acharya_ui/screens/review_screen/quiz_result_review.dart';
import 'package:iitpal_acharya_ui/screens/review_screen/video_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/constants.dart' as Constants;

import '../../constants/theme_colors.dart';
import '../../services/lang_selection.dart';

class ReviewView extends StatefulWidget {
  final String lang;
  const ReviewView({Key? key, required this.lang}) : super(key: key);

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  // Variable
  int _selectedIndex = 0;
  String _selectedDrawerItem = "Attendance Review";
  List<String> drawerItems = [
    "Attendance Review",
    "Quiz Review",
    "Video Progress"
  ];
  Map<String, Widget> _selectedDrawerItemMap = {
    // "Attendance Review": AttendanceReview(lang: widget.lang),
    // "Quiz Review": QuizReview(lang: widget.lang),
    // "Video Progress": VideoReview(lang: widget.lang),
  };

  @override
  void initState() {
    super.initState();
    _selectedDrawerItemMap = {
      "Attendance Review": AttendanceReview(lang: widget.lang),
      "Quiz Review": QuizReview(lang: widget.lang),
      "Video Progress": VideoReview(lang: widget.lang),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        title: Text(LangSelect(widget.lang, "review", "review")),
        centerTitle: true,
      ),
      body: _selectedDrawerItemMap[_selectedDrawerItem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            _selectedDrawerItem = drawerItems[index];
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: LangSelect(widget.lang, "review", "attendancereview"),
            icon: Icon(
              Icons.add,
            ),
          ),
          BottomNavigationBarItem(
            label: LangSelect(widget.lang, "review", "quizreview"),
            icon: Icon(
              Icons.access_time_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: LangSelect(widget.lang, "review", "videoprog"),
            icon: Icon(
              Icons.content_copy,
            ),
          ),
        ],
      ),
    );
  }
}
