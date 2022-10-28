import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/integer_constants.dart';
import 'package:iitpal_acharya_ui/screens/assessment_screen/list_quiz_page.dart';
import 'package:iitpal_acharya_ui/screens/assessment_screen/select_quiz.dart';
import '../../constants/theme_colors.dart';
import '../../services/lang_selection.dart';
import 'create_question_page.dart';
import 'create_quiz_page.dart';

class Quiz extends StatefulWidget {
  final String lang;
  Quiz({required this.lang});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Variables
  int _selectedIndex = 2;
  String _selectedDrawerItem = "All Quizzes";
  List<String> drawerItems = [
    "Create Questions",
    "Create Quizzes",
    "All Quizzes",
    "Give Quiz"
  ];
  Map<String, Widget> _selectedDrawerItemMap = {
    // "Create Questions": CreateQuestionPage(),
    // "Create Quizzes": CreateQuizPage(),
    // "All Quizzes": ListQuizPage(),
    // "Give Quiz": QuizTakePage(),
  };

  @override
  void initState() {
    super.initState();
    _selectedDrawerItemMap = {
      "Create Questions": CreateQuestionPage(lang: widget.lang),
      "Create Quizzes": CreateQuizPage(lang: widget.lang),
      "All Quizzes": ListQuizPage(lang: widget.lang),
      "Give Quiz": QuizTakePage(lang: widget.lang),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
          LangSelect(widget.lang, "assessment", "createquiz"),
          style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
        ),
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
            label: LangSelect(widget.lang, "assessment", "createqs"),
            icon: Icon(
              Icons.add,
            ),
          ),
          BottomNavigationBarItem(
            label: LangSelect(widget.lang, "assessment", "createqzs"),
            icon: Icon(
              Icons.account_tree_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: LangSelect(widget.lang, "assessment", "allqzs"),
            icon: Icon(
              Icons.featured_play_list_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: LangSelect(widget.lang, "assessment", "giveqz"),
            icon: Icon(
              Icons.access_time_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
