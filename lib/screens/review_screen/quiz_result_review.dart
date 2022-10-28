import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_allocation_schedule_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/quiz_outcome_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/student_details_crud.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../constants/integer_constants.dart';
import '../../constants/theme_colors.dart';
import '../../models/chart_data.dart';
import '../../services/lang_selection.dart';

class QuizReview extends StatefulWidget {
  final String lang;
  const QuizReview({Key? key, required this.lang}) : super(key: key);

  @override
  State<QuizReview> createState() => _QuizReviewState();
}

class _QuizReviewState extends State<QuizReview> {
  // Databases
  /* final quizOutcomeCRUD = QuizOutcomeCRUD();
  final studentsListDatabase = StudentDataService();
  final quizAllocationCRUD = QuizAllocationScheduleCRUD();
*/
  final quizOutcomeDatabase = QuizOutcomeCRUD.instance;
  final studentsListDatabase = StudentDetailsCRUD.instance;
  final quizAllocationDetailsDatabase = QuizAllocationScheduleCRUD.instance;

  // Variables
  late String dropDownValueGat;
  late String dropDownValueMonth;
  late TooltipBehavior _tooltip;
  int _selectedStudentIndex = -1;

  String _gat = "शिशु गट";
  List<bool> _selectedGat = [true, false, false];

  List<String> _month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<ChartData> data = [];
  List<Map<String, dynamic>> allStudentList = [];
  List<List<String>> studentList = [
    ['Select Student', '01']
  ];

  @override
  void initState() {
    super.initState();
    _tooltip = TooltipBehavior(enable: true); // initialize tooltip behaviour
    dropDownValueMonth =
        _month[DateTime.now().month - 1]; // initialize to current month
    dropDownValueGat = "शिशु गट";
    data = [];
    updateAllStudentList(); // initialize display list
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: updateAllStudentList(),
      builder: (context, snapshot) {
        while (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                IntegerConstants.recommendedContainerPadding *
                                    4)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          primary: (_selectedGat[0] == false)
                              ? MaterialThemeColors.buttonColorLight
                              : MaterialThemeColors.buttonColor,
                          minimumSize: Size(140.0, 50.0)),
                      child: Text(
                        "शिशु गट",
                        style: TextStyle(
                            fontSize: IntegerConstants.gatSelectionFontSize),
                      ),
                      onPressed: () async {
                        data.clear();
                        _selectedStudentIndex = -1;
                        _gat = "शिशु गट";
                        _selectedGat = [true, false, false];
                        updateStudentList(_gat);
                        setState(() {});
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          primary: (_selectedGat[1] == false)
                              ? MaterialThemeColors.buttonColorLight
                              : MaterialThemeColors.buttonColor,
                          minimumSize: Size(140.0, 50.0)),
                      child: Text(
                        "बाल गट-1",
                        style: TextStyle(
                            fontSize: IntegerConstants.gatSelectionFontSize),
                      ),
                      onPressed: () async {
                        data.clear();
                        _selectedStudentIndex = -1;
                        _gat = "बाल गट-1";
                        _selectedGat = [false, true, false];
                        updateStudentList(_gat);
                        setState(() {});
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          primary: (_selectedGat[2] == false)
                              ? MaterialThemeColors.buttonColorLight
                              : MaterialThemeColors.buttonColor,
                          minimumSize: Size(140.0, 50.0)),
                      child: Text(
                        "बाल गट-2",
                        style: TextStyle(
                            fontSize: IntegerConstants.gatSelectionFontSize),
                      ),
                      onPressed: () async {
                        data.clear();
                        _selectedStudentIndex = -1;
                        _gat = "बाल गट-2";
                        _selectedGat = [false, false, true];
                        updateStudentList(_gat);
                        setState(() {});
                      },
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Text(
                            LangSelect(widget.lang, "review", "selectmonth"),
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          DropdownButton(
                            value: dropDownValueMonth,
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.black),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: _month.map((String item2) {
                              return DropdownMenuItem(
                                value: item2,
                                child: Text(
                                  item2,
                                  style: TextStyle(fontSize: 22.0),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                data.clear();
                                _selectedStudentIndex = -1;
                                dropDownValueMonth = newValue.toString();
                                data.clear();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Row(
                  children: [
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 2,
                      margin: const EdgeInsets.all(16),
                      child: ListView.builder(
                          itemCount: studentList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                selected: (_selectedStudentIndex == index),
                                leading: Icon(Icons.list),
                                title: Text(
                                  "${studentList[index][0]}",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                                onTap: () async {
                                  // onTap code
                                  if (_selectedStudentIndex == index) {
                                    _selectedStudentIndex = -1;
                                    data.clear();
                                  } else {
                                    _selectedStudentIndex = index;
                                    await updateGraphData(
                                        studentList[index][1]);
                                  }
                                  setState(() {});
                                },
                              ),
                            );
                          }),
                    ),
                    const Spacer(),
                    (_selectedStudentIndex == -1)
                        ? Card(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 2,
                              child: Center(
                                child: Text(
                                  LangSelect(
                                      widget.lang, "review", "selectstudent"),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Card(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 2,
                              child: (data.isEmpty)
                                  ? Center(
                                      child: Text(
                                        LangSelect(widget.lang, "review",
                                            "noquizgiven"),
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    )
                                  : SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      primaryYAxis: NumericAxis(
                                          minimum: 0,
                                          maximum: 100,
                                          interval: 10),
                                      tooltipBehavior: _tooltip,
                                      series: <ChartSeries<ChartData, String>>[
                                          BarSeries<ChartData, String>(
                                              dataSource: data,
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y,
                                              name: 'Gold',
                                              color: Color.fromRGBO(
                                                  255, 129, 129, 1.0))
                                        ]),
                            ),
                          ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Helper Method
  String strToMonth(String s) {
    if (s == "January")
      return "01";
    else if (s == "February")
      return "02";
    else if (s == "March")
      return "03";
    else if (s == 'April')
      return "04";
    else if (s == "May")
      return "05";
    else if (s == "June")
      return "06";
    else if (s == "July")
      return "07";
    else if (s == "August")
      return "08";
    else if (s == "September")
      return "09";
    else if (s == "October")
      return "10";
    else if (s == "November")
      return "11";
    else if (s == "December")
      return "12";
    else
      return s;
  }

  /// Method for retrieving all students' list
  Future<void> updateAllStudentList() async {
    allStudentList = await studentsListDatabase.getAllRowsList();
    updateStudentList(_gat);
  }

  /// Method for updating graph data according to changed parameters
  Future<void> updateGraphData(String id) async {
    List<Map<String, dynamic>> quizData =
        await quizOutcomeDatabase.getQuizOutcomeById(id);
    List<Map<String, dynamic>> _allocatedQuizzesByMonth =
        await quizAllocationDetailsDatabase
            .getAllocatedQuizByMonth(strToMonth(dropDownValueMonth));
    Set<String> _quizzesToBeDisplayed = {};
    for (var x in _allocatedQuizzesByMonth) {
      _quizzesToBeDisplayed.add(x['id']);
    }
    data.clear();
    for (int i = 0; i < quizData.length; i++) {
      if (_quizzesToBeDisplayed.contains(quizData[i]['quizID'])) {
        double t = quizData[i]['score'] / quizData[i]['maxMarks'];
        t = t * 100;
        data.add(ChartData('Quiz ${i + 1}', t));
      }
    }
  }

  /// Method for updating students' list according to changed parameters
  void updateStudentList(String gat) {
    studentList.clear();
    for (int i = 0; i < allStudentList.length; i++) {
      if (allStudentList[i]['gat'] == gat) {
        List<String> x = [];
        x.add(allStudentList[i]['name']);
        x.add(allStudentList[i]['id']);
        studentList.add(x);
      }
    }
  }
}
