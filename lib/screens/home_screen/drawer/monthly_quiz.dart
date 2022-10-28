import 'package:flutter/material.dart';

import '../../../constants/integer_constants.dart';
import '../../../constants/theme_colors.dart';
import '../../../firebase_crud/quiz_allocation_schedule_crud.dart';
import '../../../firebase_crud/quiz_details_crud.dart';
import '../../assessment_screen/select_student_.dart';
import '../../assessment_screen/select_student_.dart';




class MonthlyQuizPage extends StatefulWidget {
  @override
  MonthlyQuizPageState createState() => MonthlyQuizPageState();
}

class MonthlyQuizPageState extends State<MonthlyQuizPage> {
  // Databases
  final quizAllocationCRUD = QuizAllocationScheduleFirabase();
  final quizQuestionsCRUD = QuizQuestionsCRUD();


  // Variables
  late List<Map<String, dynamic>> _listOfQuizzes;

  @override
  void initState() {
    super.initState();
    getQuizList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
        "Youtube Vidoes",
        style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
    ),
    ),
    body:FutureBuilder(
        future: quizAllocationCRUD.getSpecialQuizList("Special quiz question"),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "List Of All Quizzes",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    height: MediaQuery.of(context).size.height / 1.3,
                    padding: EdgeInsets.all(30.0),
                    child: _listOfQuizzes.length == 0
                        ? Container(
                            child: Center(
                              child: Text(
                                "No Quizzes Made Yet",
                                style: TextStyle(fontSize: 25.0),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _listOfQuizzes.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: MaterialThemeColors.cardBackgroundColor,
                                child: InkWell(
                                  onTap: () {
                                    String _today = DateTime.now()
                                        .toString()
                                        .substring(0, 10);
                                    /* if(_today==_listOfQuizzes[index]["date"]){
                                      /*Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SelectStudent(
                                      passedID: _listOfQuizzes[index]["id"],
                                      passedGat: _listOfQuizzes[index]["gat"],
                                      passedTime: _listOfQuizzes[index]["time"],
                                      deviceId: _listOfQuizzes[index]["deviceUniqueId"],)));}*/
                                  },*/},
                                  child:
                                    ListTile(
                                      leading: Text(
                                        "${index + 1}",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      title: Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            "Gat :  " +
                                                _listOfQuizzes[index]["gat"],
                                            style: TextStyle(
                                              fontSize: IntegerConstants
                                                  .listItemFontSize2,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width / 10),
                                          ),
                                          Text(
                                            "Date :  " +
                                                _listOfQuizzes[index]["date"],
                                            style: TextStyle(
                                              fontSize: IntegerConstants
                                                  .listItemFontSize2,
                                            ),
                                          ),
                                          Spacer(),
                                        ],
                                      ),


                                  ),

                                ));
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  /// Method to get list of quizzes to give
  void getQuizList() async {
    _listOfQuizzes = await quizAllocationCRUD.getSpecialQuizList("Special quiz question");

  }

  /// Method to delete a quiz from database
  /*Future<void> showDeleteAlertDialogBox(context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              'Delete a Quiz',
              style: TextStyle(fontSize: IntegerConstants.alertDialogHeadingFontSize),
            ),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Are you sure you want to delete this Allocated Quiz ?',
                  style: TextStyle(fontSize: 22.0),
                ),
              );
            }),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    primary: MaterialThemeColors.buttonColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "No",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  primary: MaterialThemeColors.buttonColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
                onPressed: () async {
                  await quizAllocationCRUD.deleteAllocatedQuizById(_listOfQuizzes[index]['id']);
                  await quizQuestionsCRUD.deleteQuestionByQuizId(_listOfQuizzes[index]['id']);
                  _listOfQuizzes = await quizAllocationCRUD.getSpecialQuizList("Special quiz question");

                 Navigator.of(context).pop();
                  setState(() {});
                },
              ),
            ],
          );
        });
  }*/
}
