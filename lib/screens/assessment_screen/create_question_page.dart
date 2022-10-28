import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/theme_colors.dart';
import 'package:iitpal_acharya_ui/database_crud/question_bank_crud.dart';
import '../../constants/topics.dart';
import '../../firebase_crud/question_details_crud.dart';
import '../../models/question_model.dart';
import '../../services/lang_selection.dart';
import '../unique_key_device.dart';

class CreateQuestionPage extends StatefulWidget {
  final String lang;
  CreateQuestionPage({required this.lang});
  @override
  CreateQuestionPageState createState() => CreateQuestionPageState();
}

class CreateQuestionPageState extends State<CreateQuestionPage> {
  // Controllers
  TextEditingController questionController = TextEditingController(),
      aController = TextEditingController(),
      bController = TextEditingController(),
      cController = TextEditingController(),
      dController = TextEditingController(),
      ansController = TextEditingController();

  // Variables
  int correctCheck = 0;
  Map<String, dynamic> _items = Topics.items;
  String question = "", a = "", b = "", c = "", d = "", ans = "a";
  String dropDownValueGat = "शिशु गट";
  String dropDownValueTopic = "Select Topic";
  late String _deviceUniqueId;

  @override
  void initState() {
    super.initState();
    getid(); // get device unique id
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.all(10.0)),
                    Text(
                      LangSelect(widget.lang, "assessment", "selectgat"),
                      style: TextStyle(fontSize: 25.0),
                    ),
                    DropdownButton(
                      value: dropDownValueGat,
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _items.keys.toList().map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(fontSize: 25),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropDownValueGat = newValue.toString();
                          dropDownValueTopic = "Select Topic";
                        });
                      },
                    ),
                    Spacer(),
                    Text(
                      LangSelect(widget.lang, "assessment", "selecttopic"),
                      style: TextStyle(fontSize: 25.0),
                    ),
                    DropdownButton(
                      value: dropDownValueTopic,
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _items[dropDownValueGat]
                          .map<DropdownMenuItem<String>>((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(fontSize: 25),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropDownValueTopic = newValue.toString();
                        });
                      },
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 80.0,
                margin: EdgeInsets.all(10.0),
                child: TextField(
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: questionController,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: LangSelect(widget.lang, "assessment", "enterq"),
                  ),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  onChanged: (text1) {
                    setState(() {
                      question = text1;
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50.0,
                margin: EdgeInsets.all(10.0),
                child: TextField(
                  controller: aController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText:
                        LangSelect(widget.lang, "assessment", "enteroptiona"),
                  ),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  onChanged: (text2) {
                    setState(() {
                      a = text2;
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50.0,
                margin: EdgeInsets.all(10.0),
                child: TextField(
                  controller: bController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText:
                        LangSelect(widget.lang, "assessment", "enteroptionb"),
                  ),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  onChanged: (text2) {
                    setState(() {
                      b = text2;
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50.0,
                margin: EdgeInsets.all(10.0),
                child: TextField(
                  controller: cController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText:
                        LangSelect(widget.lang, "assessment", "enteroptionc"),
                  ),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  onChanged: (text2) {
                    setState(() {
                      c = text2;
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50.0,
                margin: EdgeInsets.all(10.0),
                child: TextField(
                  controller: dController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText:
                        LangSelect(widget.lang, "assessment", "enteroptiond"),
                  ),
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  onChanged: (text2) {
                    setState(() {
                      d = text2;
                    });
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50.0,
                margin: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      LangSelect(widget.lang, "assessment", "choosea"),
                      style: TextStyle(fontSize: 22.0),
                    ),
                    Spacer(),
                    InkWell(
                      child: Row(children: [
                        Radio(
                          groupValue: ans,
                          value: "a",
                          activeColor: MaterialThemeColors.buttonColor,
                          onChanged: (value) {
                            setState(() {
                              ans = value.toString();
                            });
                          },
                        ),
                        Text(
                          LangSelect(widget.lang, "assessment", "optiona"),
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ]),
                      onTap: () {
                        setState(() {
                          ans = "a";
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                    ),
                    InkWell(
                      child: Row(children: [
                        Radio(
                          groupValue: ans,
                          value: "b",
                          activeColor: MaterialThemeColors.buttonColor,
                          onChanged: (value) {
                            setState(() {
                              ans = value.toString();
                            });
                          },
                        ),
                        Text(
                          LangSelect(widget.lang, "assessment", "optionb"),
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ]),
                      onTap: () {
                        setState(() {
                          ans = "b";
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                    ),
                    InkWell(
                      child: Row(children: [
                        Radio(
                          groupValue: ans,
                          value: "c",
                          activeColor: MaterialThemeColors.buttonColor,
                          onChanged: (value) {
                            setState(() {
                              ans = value.toString();
                            });
                          },
                        ),
                        Text(
                          LangSelect(widget.lang, "assessment", "optionc"),
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ]),
                      onTap: () {
                        setState(() {
                          ans = "c";
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                    ),
                    InkWell(
                      child: Row(children: [
                        Radio(
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          groupValue: ans,
                          value: "d",
                          activeColor: MaterialThemeColors.buttonColor,
                          onChanged: (value) {
                            setState(() {
                              ans = value.toString();
                            });
                          },
                        ),
                        Text(
                          LangSelect(widget.lang, "assessment", "optiond"),
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ]),
                      onTap: () {
                        setState(() {
                          ans = "d";
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: MaterialThemeColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      LangSelect(widget.lang, "assessment", "createqs"),
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      correctCheck = 0;
                    });
                    var myList = ['a', 'A', 'b', 'B', 'c', 'C', 'd', "D"];
                    if (!myList.contains(ans)) {
                      setState(() {
                        correctCheck = 1;
                      });
                    }
                    if (dropDownValueGat == "Select Gat" ||
                        dropDownValueTopic == "Select Topic" ||
                        question == "" ||
                        a == "" ||
                        b == "" ||
                        c == "" ||
                        d == "") {
                      setState(() {
                        correctCheck = 1;
                      });
                    }
                    if (correctCheck == 1) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.black38,
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 5,
                            left: MediaQuery.of(context).size.width / 4,
                            right: MediaQuery.of(context).size.width / 4),
                        content: Text(
                          "Please enter all the fields",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ));
                    } else {
                      _showConfirmAlert();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  /// Method to get device unique id
  Future<void> getid() async {
    _deviceUniqueId = (await getId())!;
  }

  /// Method to add question to the database
  Future<void> addQuestion() async {
    final database = QuestionBankCRUD.instance;
    String answer;
    if (ans == 'a')
      answer = a;
    else if (ans == 'b')
      answer = b;
    else if (ans == 'c')
      answer = c;
    else
      answer = d;
    QuestionDetails ques = QuestionDetails(
        id: UniqueKey().toString().substring(2, 7) + _deviceUniqueId,
        questionGat: dropDownValueGat,
        questionSubject: dropDownValueTopic,
        questionTopic: dropDownValueTopic,
        question: question,
        a: a,
        b: b,
        c: c,
        d: d,
        answer: answer,
        deviceUniqueId: _deviceUniqueId,
        synced: 'false',
        dateOfSync: DateTime.now().toString().substring(0, 10));
    database.insertNewQuestion(ques);
    // print(await database.displayQuestions());
  }

  /// Dialog box to confirm the question details
  Future<void> _showConfirmAlert() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm Submission',
            style: TextStyle(fontSize: 25),
          ),
          content: Text(
            "Please check the question as you won't be able to edit",
            style: TextStyle(fontSize: 20),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Padding(padding: EdgeInsets.only(left: 10.0)),
            TextButton(
              child: Text(
                'Confirm',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () async {
                await addQuestion();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.black38,
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 5,
                      left: MediaQuery.of(context).size.width / 4,
                      right: MediaQuery.of(context).size.width / 4),
                  content: Text(
                    "The question has been created successfully",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ));
                // _showSubmitted();
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
