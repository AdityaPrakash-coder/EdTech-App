import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/database_crud/question_bank_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_allocation_schedule_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_details_crud.dart';
import 'package:iitpal_acharya_ui/models/quiz_allocation_schedule_model.dart';
import 'package:iitpal_acharya_ui/models/quiz_details_model.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../constants/integer_constants.dart';
import '../../constants/theme_colors.dart';
import '../../constants/topics.dart';
import '../../services/lang_selection.dart';
import '../unique_key_device.dart';

class CreateQuizPage extends StatefulWidget {
  final String lang;
  CreateQuizPage({required this.lang});
  @override
  CreateQuizPageState createState() => CreateQuizPageState();
}

class CreateQuizPageState extends State<CreateQuizPage> {
  // Databases
  /* final questionDetailsCRUD = QuestionDetailsCRUD();
  final quizQuestionsCRUD = QuizQuestionsCRUD();
  final quizAllocationCRUD = QuizAllocationScheduleCRUD();*/
  final questionBankDatabase = QuestionBankCRUD.instance;
  final quizDatabase = QuizQuestionsCRUD.instance;
  final quizAllocationDatabase = QuizAllocationScheduleCRUD.instance;

  // Variables
  DateTime _selectedDate = DateTime.now();
  String _deviceUniqueId = "";
  String date = DateTime.now().toString().substring(0, 10);
  String dropDownValueGat = "शिशु गट", dropDownValueTopic = "Select Topic";
  List<Map<String, dynamic>> listOfSelectedQuestions = [];
  List<String> _items = Topics.items[Gats.shishu];
  List<String> listOfSelectedQuestionsID = [];
  List<int> _selectedTiles = [];
  List<bool> _selectedGat = [true, false, false];
  late List<Map<String, dynamic>> listOfQuestions;

  @override
  void initState() {
    super.initState();
    getAllRowsList(); //get data of all questions
    getid(); //get device unique id
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: questionBankDatabase.getQuestionByGat(dropDownValueGat),
        builder: (context, snapshot) {
          while (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20,
                  vertical: MediaQuery.of(context).size.height / 20),
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    primary: (_selectedGat[0] == false)
                                        ? MaterialThemeColors.buttonColorLight
                                        : MaterialThemeColors.buttonColor,
                                    minimumSize: Size(120.0, 50.0)),
                                child: Text(
                                  "शिशु गट",
                                  style: TextStyle(fontSize: 25.0),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    dropDownValueGat = "शिशु गट";
                                    _items = Topics.items[Gats.shishu];
                                    dropDownValueTopic = "Select Topic";
                                    _selectedGat = [true, false, false];
                                    listOfSelectedQuestions.clear();
                                    _selectedTiles.clear();
                                    editListOfQuestions(dropDownValueGat,
                                        dropDownValueTopic, dropDownValueTopic);
                                  });
                                },
                              ),
                              Padding(padding: EdgeInsets.all(10.0)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    primary: (_selectedGat[1] == false)
                                        ? MaterialThemeColors.buttonColorLight
                                        : MaterialThemeColors.buttonColor,
                                    minimumSize: Size(120.0, 50.0)),
                                child: Text(
                                  "बाल गट-1",
                                  style: TextStyle(fontSize: 25.0),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    dropDownValueGat = "बाल गट-1";
                                    _items = Topics.items[Gats.bal1];
                                    dropDownValueTopic = "Select Topic";
                                    _selectedGat = [false, true, false];
                                    listOfSelectedQuestions.clear();
                                    _selectedTiles.clear();
                                    editListOfQuestions(dropDownValueGat,
                                        dropDownValueTopic, dropDownValueTopic);
                                  });
                                },
                              ),
                              Padding(padding: EdgeInsets.all(10.0)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    primary: (_selectedGat[2] == false)
                                        ? MaterialThemeColors.buttonColorLight
                                        : MaterialThemeColors.buttonColor,
                                    minimumSize: Size(120.0, 50.0)),
                                child: Text(
                                  "बाल गट-2",
                                  style: TextStyle(fontSize: 25.0),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    dropDownValueGat = "बाल गट-2";
                                    _items = Topics.items[Gats.bal2];
                                    dropDownValueTopic = "Select Topic";
                                    _selectedGat = [false, false, true];
                                    listOfSelectedQuestions.clear();
                                    _selectedTiles.clear();
                                    editListOfQuestions(dropDownValueGat,
                                        dropDownValueTopic, dropDownValueTopic);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Row(
                            children: [
                              Text(
                                LangSelect(
                                    widget.lang, "assessment", "selecttopic"),
                                style: TextStyle(fontSize: 24.0),
                              ),
                              //Spacer(),
                              Container(
                                child: DropdownButton(
                                  value: dropDownValueTopic,
                                  style: TextStyle(
                                      fontSize: 22.0, color: Colors.black),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: _items.map<DropdownMenuItem<String>>(
                                      (String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: TextStyle(fontSize: 24.0),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropDownValueTopic = newValue.toString();
                                      _selectedTiles.clear();
                                      listOfSelectedQuestions.clear();
                                      editListOfQuestions(
                                          dropDownValueGat,
                                          dropDownValueTopic,
                                          dropDownValueTopic);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 40.0)),
                      ]),
                      Spacer(),
                      Column(
                        children: [
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0)),
                                color: MaterialThemeColors.buttonColor,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Text(
                                      LangSelect(widget.lang, "assessment",
                                          "selectqs"),
                                      style: TextStyle(
                                          fontSize: 22.1, color: Colors.white),
                                    ),
                                    Spacer(),
                                    (listOfSelectedQuestions.length == 0)
                                        ? SizedBox(
                                            width: 45.0,
                                            height: 45.0,
                                          )
                                        : IconButton(
                                            iconSize: 25.0,
                                            color: Colors.white,
                                            icon: Icon(
                                              Icons.cancel,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                listOfSelectedQuestions.clear();
                                                _selectedTiles.clear();
                                              });
                                            },
                                          ),
                                    (listOfSelectedQuestions.length == 0)
                                        ? SizedBox(
                                            width: 45.0,
                                            height: 45.0,
                                          )
                                        : IconButton(
                                            iconSize: 25.0,
                                            color: Colors.white,
                                            icon: Icon(
                                              Icons.done,
                                            ),
                                            onPressed: () {
                                              if (listOfSelectedQuestions
                                                  .isEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.black38,
                                                  margin: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              5,
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4,
                                                      right:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4),
                                                  content: Text(
                                                    LangSelect(
                                                        widget.lang,
                                                        "assessment",
                                                        "selectatleastoneq"),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: IntegerConstants
                                                            .snackBarMessageFontSize),
                                                  ),
                                                ));
                                              } else {
                                                showAlertDialogBox(context);
                                              }
                                            },
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: MediaQuery.of(context).size.height / 1.8,
                            child: (listOfQuestions.length == 0)
                                ? Container(
                                    child: Center(
                                      child: Text(
                                        LangSelect(
                                            widget.lang, "assessment", "noqs"),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: listOfQuestions.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (listOfSelectedQuestions
                                                      .length !=
                                                  0) {
                                                if (_selectedTiles
                                                    .contains(index)) {
                                                  listOfSelectedQuestions
                                                      .removeWhere((element) {
                                                    if (element['id'] ==
                                                        listOfQuestions[index]
                                                            ['id']) return true;
                                                    return false;
                                                  });
                                                  print(_selectedTiles
                                                      .remove(index));
                                                } else {
                                                  listOfSelectedQuestions.add(
                                                      listOfQuestions[index]);
                                                  _selectedTiles.add(index);
                                                }
                                              }
                                            });
                                          },
                                          onLongPress: () {
                                            setState(() {
                                              if (!_selectedTiles
                                                  .contains(index)) {
                                                listOfSelectedQuestions.add(
                                                    listOfQuestions[index]);
                                                _selectedTiles.add(index);
                                              }
                                            });
                                          },
                                          child: ListTile(
                                            tileColor: (_selectedTiles
                                                    .contains(index))
                                                ? Colors.lightBlueAccent[100]
                                                : Colors.transparent,
                                            title: Text(
                                              listOfQuestions[index]
                                                  ["question"],
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  /// Method to get all the questions in viewed list
  void getAllRowsList() async {
    listOfQuestions =
        await questionBankDatabase.getQuestionByGat(dropDownValueGat);
  }

  /// Method to get empty list
  Future<List<Map<String, dynamic>>> getEmptyList() async {
    return [];
  }

  /// Method to edit list of viewed questions
  void editListOfQuestions(String gat, String subject, String topic) async {
    if (gat == "Select Gat" && topic == "Select Topic") {
      listOfQuestions = await questionBankDatabase.getAllRowsList();
    } else if (gat != "Select Gat" && topic == "Select Topic") {
      listOfQuestions = await questionBankDatabase.getQuestionByGat(gat);
    } else if (gat != "Select Gat" && topic != "Select Topic") {
      listOfQuestions =
          await questionBankDatabase.getQuestionByGatTopic(gat, topic);
    }
  }

  /// Method to add question to selected list
  void addQuestionToSelected(Map<String, dynamic> ques) {
    for (Map<String, dynamic> x in listOfSelectedQuestions) {
      if (x['id'] == ques['id']) return;
    }
    listOfSelectedQuestions.add(ques);
  }

  /// Method to remove question from selected list
  void deleteFromSelected(ques) {
    listOfSelectedQuestions.remove(ques);
  }

  /// Method to get device unique id
  void getid() async {
    _deviceUniqueId = (await getId())!;
  }

  /// Dialog box to confirm quiz
  void showAlertDialogBox(BuildContext context) {
    int time = 10;
    var alertDialog = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LangSelect(widget.lang, "assessment", "makequizwarning"),
            style:
                TextStyle(fontSize: IntegerConstants.alertDialogTextFontSize),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LangSelect(widget.lang, "assessment", "selectdate"),
                style: TextStyle(
                    fontSize: IntegerConstants.alertDialogTextFontSize),
              ),
              SizedBox(
                height: 100.0,
                width: 250.0,
                child: ScrollDatePicker(
                  selectedDate: _selectedDate,
                  minimumDate: DateTime.now(),
                  maximumDate: DateTime(DateTime.now().year,
                      DateTime.now().month + 1, DateTime.now().day),
                  style: DatePickerStyle(
                    selectedTextStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  onDateTimeChanged: (DateTime value) {
                    setState(() {
                      _selectedDate = value;
                      date = _selectedDate.toString().substring(0, 10);
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          StatefulBuilder(builder: (context, SBsetState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LangSelect(widget.lang, "assessment", "qztime"),
                  style: TextStyle(
                      fontSize: IntegerConstants.alertDialogTextFontSize),
                ),
                NumberPicker(
                  value: time,
                  minValue: 5,
                  maxValue: 30,
                  step: 1,
                  itemHeight: 70,
                  itemWidth: 50.0,
                  axis: Axis.horizontal,
                  onChanged: (value) {
                    setState(() => time = value);
                    SBsetState(() => time = value);
                  },
                ),
                Text(
                  " mins",
                  style: TextStyle(
                      fontSize: IntegerConstants.alertDialogTextFontSize2),
                ),
              ],
            );
          }),
          // Padding(padding: EdgeInsets.only(top: 20.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text(
                  LangSelect(widget.lang, "assessment", "cancel"),
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: IntegerConstants.alertDialogButtonSize),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  LangSelect(widget.lang, "assessment", "ok"),
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: IntegerConstants.alertDialogButtonSize),
                ),
                onPressed: () async {
                  String tempId =
                      UniqueKey().toString().substring(2, 7) + _deviceUniqueId;

                  for (int x = 0; x < listOfSelectedQuestions.length; x++) {
                    listOfSelectedQuestionsID
                        .add(listOfSelectedQuestions[x]["id"]);
                    quizDatabase.insertNewQuestion(QuizQuestions(
                        quizId: tempId,
                        questionId: listOfSelectedQuestions[x]["id"],
                        deviceUniqueId: listOfSelectedQuestions[x]
                            ['deviceUniqueId'],
                        synced: 'false',
                        dateOfSync:
                            DateTime.now().toString().substring(0, 10)));
                  }
                  //quizQuestionsCRUD.createQuiz(QuizQuestions(synced: 'false', dateOfSync: DateTime.now().toString().substring(0,10), quizId: tempId, questionId: listOfSelectedQuestionsID, deviceUniqueId: _deviceUniqueId));
                  quizAllocationDatabase.allocateNewQuiz(QuizAllocationSchedule(
                      synced: "false",
                      dateOfSync: DateTime.now().toString().substring(0, 10),
                      quizId: tempId,
                      quizGat: dropDownValueGat,
                      quizDate: date,
                      quizTime: time * 60,
                      deviceUniqueId: _deviceUniqueId));
                  print(await quizAllocationDatabase.getAllRowsList());
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.black38,
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 5,
                        left: MediaQuery.of(context).size.width / 4,
                        right: MediaQuery.of(context).size.width / 4),
                    content: Text(
                      LangSelect(widget.lang, "assessment", "qzcreated"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: IntegerConstants.snackBarMessageFontSize),
                    ),
                  ));
                },
              ),
            ],
          )
        ],
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
