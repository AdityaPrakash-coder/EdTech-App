import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/theme_colors.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_allocation_schedule_crud.dart';
import '../../constants/integer_constants.dart';
import '../../database_crud/quiz_details_crud.dart';
import '../../services/lang_selection.dart';

class ListQuizPage extends StatefulWidget {
  final String lang;
  ListQuizPage({required this.lang});
  @override
  ListQuizPageState createState() => ListQuizPageState();
}

class ListQuizPageState extends State<ListQuizPage> {
  // Databases
  /*final quizAllocationCRUD = QuizAllocationScheduleCRUD();
  final quizQuestionsCRUD = QuizQuestionsCRUD();
*/
  final quizDetailsDatabase = QuizAllocationScheduleCRUD.instance;
  final quizQuestionsDatabase = QuizQuestionsCRUD.instance;
  // Variables
  late List<Map<String, dynamic>> _listOfQuizzes;

  @override
  void initState() {
    super.initState();
    getQuizList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: quizDetailsDatabase.getAllRowsList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData)
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
                        LangSelect(widget.lang, "assessment", "listogqzs"),
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 1.3,
                    padding: EdgeInsets.all(30.0),
                    child: _listOfQuizzes.length == 0
                        ? Container(
                            child: Center(
                              child: Text(
                                LangSelect(
                                    widget.lang, "assessment", "noqzsmade"),
                                style: TextStyle(fontSize: 25.0),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _listOfQuizzes.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: MaterialThemeColors.cardBackgroundColor,
                                child: ListTile(
                                  leading: Text(
                                    "${index + 1}",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  title: Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        LangSelect(widget.lang, "assessment",
                                                "gat") +
                                            _listOfQuizzes[index]["gat"],
                                        style: TextStyle(
                                          fontSize: IntegerConstants
                                              .listItemFontSize2,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                10),
                                      ),
                                      Text(
                                        LangSelect(widget.lang, "assessment",
                                                "date") +
                                            _listOfQuizzes[index]["date"],
                                        style: TextStyle(
                                          fontSize: IntegerConstants
                                              .listItemFontSize2,
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () async {
                                      showDeleteAlertDialogBox(context, index);
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// Method to get list of quizzes to give
  void getQuizList() async {
    //_listOfQuizzes = await quizAllocationCRUD.getAllRowsList();
    _listOfQuizzes = await quizDetailsDatabase.getAllRowsList();
  }

  /// Method to delete a quiz from database
  Future<void> showDeleteAlertDialogBox(context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              LangSelect(widget.lang, "assessment", "deleteqzs"),
              style: TextStyle(
                  fontSize: IntegerConstants.alertDialogHeadingFontSize),
            ),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  LangSelect(widget.lang, "assessment", "deleteqzwarning"),
                  style: TextStyle(fontSize: 22.0),
                ),
              );
            }),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
                  //await quizAllocationCRUD.deleteAllocatedQuizById(_listOfQuizzes[index]['id']);
                  //await quizQuestionsCRUD.deleteQuestionByQuizId(_listOfQuizzes[index]['id']);
                  //_listOfQuizzes = await quizAllocationCRUD.getAllRowsList();
                  await quizDetailsDatabase
                      .deleteAllocatedQuizById(_listOfQuizzes[index]['id']);
                  await quizQuestionsDatabase
                      .deleteQuestionByQuizId(_listOfQuizzes[index]['id']);
                  _listOfQuizzes = await quizDetailsDatabase.getAllRowsList();
                  Navigator.of(context).pop();
                  setState(() {});
                },
              ),
            ],
          );
        });
  }
}
