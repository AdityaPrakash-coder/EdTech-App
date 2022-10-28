import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/integer_constants.dart';
import 'package:iitpal_acharya_ui/database_crud/question_bank_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_details_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_outcome_crud.dart';
import '../../constants/theme_colors.dart';
import '../../models/quiz_outcome_model.dart';
import '../unique_key_device.dart';

class GetQuestionID extends StatefulWidget {
  final String quizID, _studentID;
  final int totalTime;
  final String _deviceId;

  GetQuestionID(this.quizID, this._studentID, this.totalTime,this._deviceId);

  @override
  GetQuestionIDState createState() => GetQuestionIDState();
}

class GetQuestionIDState extends State<GetQuestionID> {

  // Databases
 /* final questionDetailsCRUD = QuestionDetailsCRUD();
  final quizQuestionsCRUD = QuizQuestionsCRUD();
*/
  final questionBankDatabase = QuestionBankCRUD.instance;
  final quizDetailsDatabase = QuizQuestionsCRUD.instance;
  // Variables
  late String quizID, _studentID;
  late int totalTime;
  final String tblQuizQuestionsCRUD = 'tblQuizQuestions';
  List<Map<String, dynamic>> listOfID = [];
  List<Map<String, dynamic>> quizData = [];

  @override
  void initState() {
    super.initState();
    quizID = widget.quizID;
    _studentID = widget._studentID;
    totalTime = widget.totalTime;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: Future.delayed(Duration(seconds: 0), () => getQuestions()),
      future: getQuestions(),
      builder: (context, snapshot) {
        while (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return QuizPage(
              quizData: quizData,
              quizID: quizID,
              stuID: _studentID,
              totalTime: totalTime);
      },
    );
  }

  /// Method to select quiz and get ids of its questions
  Future<void> selectQuiz() async {
    listOfID = await quizDetailsDatabase.GetQuestionIDbyQuizID(quizID);
  }

  /// Method to get question details according to their id
  Future<void> getQuestions() async {
    quizData.clear();
    await selectQuiz();
    for(Map<String, dynamic> x in listOfID){
      //quizData.add((await questionDetailsCRUD.getQuestionById(listOfID[i]))[0]);
      quizData.add(Map.from((await questionBankDatabase.getQuestionById(x['questionID']))[0]));

    }
  }
}

class QuizPage extends StatefulWidget {
  final List quizData;
  final int totalTime;
  final String quizID, stuID;

  QuizPage(
      {Key? key,
      required this.quizData,
      required this.quizID,
      required this.stuID,
      required this.totalTime})
      : super(key: key);

  @override
  QuizPageState createState() =>
      QuizPageState(quizData, quizID, stuID, totalTime);
}

class QuizPageState extends State<QuizPage> {
  //Variables
  int marks = 0;
  int index = 1;
  int ramIdx = 1;
  int ansCheck = 1;
  int currentQuestionIndex =0;
  final int totalTime;
  late int timer, min, sec;
  late String showTimer, showTotalTime, _deviceUniqueId;
  var randomArray;
  final List quizData;
  final String quizID, stuID;
  
  Map<String, Color> buttonColor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };
  Map<String, bool> ans = {
    "a": false,
    "b": false,
    "c": false,
    "d": false,
  };

  // Constructor
  QuizPageState(this.quizData, this.quizID, this.stuID, this.totalTime);

  @override
  void initState() {
    super.initState();
    getid();
    timer = totalTime;
    min = timer ~/ 60;
    sec = timer % 60;
    showTotalTime = "$min min $sec s";
    showTimer = "$min min $sec s";
    startTimer();
    index=0;
    generateRandomList();
    index = randomArray[0];
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "WARNING", style: TextStyle(fontSize: 25),
                  ),
                  content: Text("You can't go back during the quiz", style: TextStyle(fontSize: 20),),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                      ),
                    )
                  ],
                ));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: MaterialThemeColors.primaryColor,
          centerTitle: true,
          leading: Text(""),
          title: Text(
            "Quiz",
            style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
          ),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: [
                Container(width: MediaQuery.of(context).size.width/50),
                Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.topLeft,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Column(
                    children: [
                      Spacer(),
                      Row(children: [
                        Expanded(
                          child: Text(
                            "Q. $ramIdx   " + quizData[index]["question"],
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ],),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            "Choose your answer from the below options",
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width/3.6,
                    height: 90.0,
                    child:Card(
                      color: Colors.grey[100],
                      child: Column(
                        children: [
                          Spacer(),
                          Center(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Total Time : ",
                                    style: TextStyle(
                                      fontSize: 20.0
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  showTotalTime,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Spacer()
                              ],
                            ),
                          ),
                          Spacer(),
                          Center(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "Time Left :   ",
                                    style: TextStyle(
                                      fontSize: 20.0
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  showTimer,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Spacer()
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),

                ),
                Spacer()
              ],
            ),
            Row(
              children: [
                Container(width: MediaQuery.of(context).size.width/50),
                Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width/1.5,
                    child: ListView(
                      children: ans.keys.map((String k) {
                        return Card(
                          margin: EdgeInsets.all(5.0),
                          child: CheckboxListTile(
                              title: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    quizData[index][k],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),

                                ),
                              ),

                              value: ans[k],
                              activeColor: Colors.deepPurple,
                              checkColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    ans['a'] = false;
                                    ans['b'] = false;
                                    ans['c'] = false;
                                    ans['d'] = false;
                                  }
                                  ans[k] = value!;
                                });
                              }),
                        );
                      }).toList(),
                    )),
                Spacer(),
                Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width/4,
                      height: MediaQuery.of(context).size.height/3,
                      padding: EdgeInsets.all(10.0),
                      child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 60,
                              childAspectRatio: 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                          itemCount: quizData.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              alignment: Alignment.center,
                              child: Text((index+1).toString()),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black54,
                                  width: 2.0
                                ),
                                  color: (index<currentQuestionIndex)?Colors.green[200]:(index==currentQuestionIndex)?Colors.blue[200]:Colors.grey[200],
                                  borderRadius: BorderRadius.circular(15)),
                            );
                          }
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.width / 10,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  primary: MaterialThemeColors.buttonColor,
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                onPressed: () {
                  ansCheck = 1;
                  currentQuestionIndex++;
                  ans.forEach((key, value) {
                    if (value == true) {
                      checkAnswer(key);
                      ansCheck = 0;
                    }
                  });
                  if (ansCheck == 1) {
                    checkAnswer("");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  /// Method to start the timer for the quiz
  void startTimer() async {
    const oneSecondValue = Duration(seconds: 1);
    Timer.periodic(oneSecondValue, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          endQuiz();
        } else {
          timer = timer - 1;
        }
        min = timer ~/ 60;
        sec = timer % 60;
        showTimer = "$min min $sec s";
      });
    });
  }

  /// Method to go to the next question
  void nextQuestion() {
    setState(() {
      ans['a'] = false;
      ans['b'] = false;
      ans['c'] = false;
      ans['d'] = false;
      if (ramIdx < quizData.length) {
        index = randomArray[ramIdx];
        ramIdx++;
      } else {
        endQuiz();
      }
      buttonColor["a"] = Colors.indigoAccent;
      buttonColor["b"] = Colors.indigoAccent;
      buttonColor["c"] = Colors.indigoAccent;
      buttonColor["d"] = Colors.indigoAccent;
    });
  }

  /// Method to end the quiz and submit results
  void endQuiz() async {
    final quizOutcomeCRUD = QuizOutcomeCRUD.instance;
    QuizOutcome quizOutcome = QuizOutcome(
        studentID: stuID,
        quizID: quizID,
        docID: UniqueKey().toString().substring(2,7)+_deviceUniqueId,
        score: marks,
        maxMarks: randomArray.length,
        timeTaken: totalTime - timer,
        deviceUniqueId: _deviceUniqueId,
        synced: 'false',
        dateOfSync: DateTime.now().toString().substring(0, 10));
    await quizOutcomeCRUD.insertNewQuizOutcome(quizOutcome);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black38,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/5, left: MediaQuery.of(context).size.width/4, right: MediaQuery.of(context).size.width/4),
      content: Text("Your response has been submitted successfully", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
    ));
    await Future.delayed(Duration(milliseconds: 500));
    Navigator.of(context).pop();
  }

  /// Method to check the answer and go to next question
  void checkAnswer(String submittedAnswer) {
    if (submittedAnswer != "" && (quizData[index]["ans"] == quizData[index][submittedAnswer])) {
      marks = marks + 1;
    }
    nextQuestion();
  }

  /// Method to get device unique id
  Future<void> getid() async {
    _deviceUniqueId = (await getId())!;
  }

  /// Method to generate random list
  generateRandomList() {
    randomArray = List<int>.generate(quizData.length, (int index) => index);
    randomArray.shuffle();
  }
}
