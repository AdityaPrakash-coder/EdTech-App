import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_allocation_schedule_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/quiz_allocation_schedule_crud.dart';
import 'package:iitpal_acharya_ui/screens/assessment_screen/select_student_.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import '../../constants/theme_colors.dart';
import '../../services/lang_selection.dart';

class QuizTakePage extends StatefulWidget {
  final String lang;
  QuizTakePage({required this.lang});
  @override
  QuizTakePageState createState() => QuizTakePageState();
}

class QuizTakePageState extends State<QuizTakePage> {
  // Variables
  late DateTime cur;
  late String _dateToday;
  static final tblQuizAllocationScheduleDetails =
      'table_quiz_allocation_schedule';
  List<Map<String, dynamic>> data = [];
  List<Map<String,dynamic>> montlyQuiz=[];

  @override
  void initState() {
    super.initState();
    cur = DateTime.now();
    _dateToday = DateFormat("yyyy-MM-dd").format(cur);
    fetchTodayQuizzes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height -
          AppBar(
            backgroundColor: MaterialThemeColors.primaryColor,
          ).preferredSize.height,
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: (data.length == 0) || (montlyQuiz.length==0)
            ? Container(
                child: Text(
                  LangSelect(widget.lang, "assessment", "noqzs"),
                  style: TextStyle(fontSize: 30.0),
                ),
              )
            : Column(
                children: [
                  Container(
                    child: Text(
                      LangSelect(widget.lang, "assessment", "selectqz"),
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(30.0),
                    child: (montlyQuiz.length==0)?ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return customCard(index + 1, data[index]);
                      },
                    ):ListView.builder(
                      itemCount: montlyQuiz.length,
                      itemBuilder: (context, index) {
                        return customCard(index + 1, montlyQuiz[index]);
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  /// Custom widget for quizzes
  Widget customCard(int serialNumber, Map<String, dynamic> dataValue) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          print(dataValue);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SelectStudent(
                passedID: dataValue["id"],
                passedGat: dataValue["gat"],
                passedTime: dataValue["time"],
            deviceId: dataValue["deviceUniqueId"],),
          ));
        },
        child: Card(
          color: MaterialThemeColors.cardBackgroundColor,
          child: ListTile(
            title: Text(
              serialNumber.toString(),
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            trailing: Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Row(
                children: [
                  Text(
                    "Gat :  " + dataValue["gat"],
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Time :  " +
                        (dataValue["time"] / 60).floor().toString() +
                        " mins",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Method to show quiz allocated for today
  Future<void> fetchTodayQuizzes() async {
    final quizAllocationCRUD = QuizAllocationScheduleFirabase();
    montlyQuiz = await quizAllocationCRUD.getAllocatedQuizByDate(_dateToday,"Special quiz question");
    final database = QuizAllocationScheduleCRUD.instance;
    Database db = await database.database;
    data = await db.rawQuery(
        "SELECT id, gat, time from $tblQuizAllocationScheduleDetails WHERE date='$_dateToday'");
    print(data);
    setState(() {});
  }
}
