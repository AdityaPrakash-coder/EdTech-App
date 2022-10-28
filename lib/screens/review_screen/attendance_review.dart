import 'dart:core';

import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/firebase_crud/attendance_details_crud_firebase.dart';
import 'package:iitpal_acharya_ui/firebase_crud/student_data_crud.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../constants/integer_constants.dart';
import '../../constants/theme_colors.dart';
import '../../database_crud/attendance_details_crud.dart';
import '../../database_crud/student_details_crud.dart';
import '../../services/lang_selection.dart';

class AttendanceReview extends StatefulWidget {
  final String lang;
  AttendanceReview({required this.lang});
  @override
  AttendanceReviewState createState() => AttendanceReviewState();
}

class AttendanceReviewState extends State<AttendanceReview> {
  // Databases
  /*final database = StudentDataService();
  final database1 = AttendanceDetailsDataService();*/
  final database = StudentDetailsCRUD.instance;
  final database1 = AttendanceDetailsCRUD.instance;

  // Variables
  String _shishuGat = "शिशु गट";
  String _balGat1 = "बाल गट-1";
  String _balGat2 = "बाल गट-2";
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
  late String dropDownValueGat;
  late String dropDownValueMonth;

  // Set containing id's of all the students of a particular gat
  Set<String> balGat1 = {};
  Set<String> shishuGat = {};
  Set<String> balGat2 = {};

  String _gat = "शिशु गट";
  List<bool> _selectedGat = [false, false, false];

  Map<String, double> dataMapShishuGat = {"Absent": 0, "Present": 0};
  Map<String, double> dataMapBalGat1 = {"Absent": 0, "Present": 0};
  Map<String, double> dataMapBalGat2 = {"Absent": 0, "Present": 0};
  Map<String, double> dataMap = {"Absent": 0, "Present": 0};
  List<Map<String, dynamic>> attendanceList = [];
  List<Map<String, dynamic>> allStudentsList = [];

  @override
  void initState() {
    super.initState();
    dropDownValueMonth =
        _month[DateTime.now().month - 1]; // initialize month to current month
    getAttendanceGraphDataByMonth(
        dropDownValueMonth); // get attendance data for current month
    updateAllStudentList(); // initialize students' list
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAttendanceGraphDataByMonth(dropDownValueMonth),
        builder: (context, snapshot) {
          while (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              primary: (_selectedGat[0] == false)
                                  ? MaterialThemeColors.buttonColorLight
                                  : MaterialThemeColors.buttonColor,
                              minimumSize: Size(140.0, 50.0)),
                          child: Text(
                            "शिशु गट",
                            style: TextStyle(
                                fontSize:
                                    IntegerConstants.gatSelectionFontSize),
                          ),
                          onPressed: () async {
                            _gat = "शिशु गट";
                            _selectedGat = [true, false, false];
                            await getAttendanceGraphDataByMonth(
                                dropDownValueMonth);
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
                                fontSize:
                                    IntegerConstants.gatSelectionFontSize),
                          ),
                          onPressed: () async {
                            _gat = "बाल गट-1";
                            _selectedGat = [false, true, false];
                            await getAttendanceGraphDataByMonth(
                                dropDownValueMonth);
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
                                fontSize:
                                    IntegerConstants.gatSelectionFontSize),
                          ),
                          onPressed: () async {
                            _gat = "बाल गट-2";
                            _selectedGat = [false, false, true];
                            await getAttendanceGraphDataByMonth(
                                dropDownValueMonth);
                            setState(() {});
                          },
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Text(
                                LangSelect(
                                    widget.lang, "review", "selectmonth"),
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                              DropdownButton(
                                value: dropDownValueMonth,
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.black),
                                icon: Icon(Icons.keyboard_arrow_down),
                                items: _month.map((String item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList(),
                                onChanged: (newValue) async {
                                  setState(() {
                                    dropDownValueMonth = newValue.toString();
                                  });
                                  await getAttendanceGraphDataByMonth(
                                      dropDownValueMonth);
                                },
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.height / 1.5,
                      height: MediaQuery.of(context).size.height / 2,
                      child: (_selectedGat[0] == false &&
                              _selectedGat[1] == false &&
                              _selectedGat[2] == false)
                          ? Container(
                              child: Center(
                                child: Text(
                                  LangSelect(
                                      widget.lang, "review", "selectgat"),
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                              ),
                            )
                          : (dataMap["Absent"] == 0 && dataMap["Present"] == 0)
                              ? Container(
                                  child: Center(
                                      child: Text(
                                    LangSelect(
                                        widget.lang, "review", "noattendance"),
                                    style: TextStyle(fontSize: 30),
                                  )),
                                )
                              : PieChart(
                                  dataMap: dataMap,
                                  animationDuration:
                                      Duration(milliseconds: 800),
                                  chartLegendSpacing: 32,
                                  chartType: ChartType.ring,
                                  chartRadius:
                                      MediaQuery.of(context).size.width / 3.2,
                                  initialAngleInDegree: 0,
                                  ringStrokeWidth: 32,
                                  colorList: [
                                    MaterialThemeColors.primaryColor,
                                    MaterialThemeColors.buttonColorLight,
                                  ],
                                  chartValuesOptions: ChartValuesOptions(
                                      showChartValueBackground: true,
                                      showChartValues: true,
                                      showChartValuesInPercentage: true,
                                      showChartValuesOutside: false,
                                      decimalPlaces: 1,
                                      chartValueStyle: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.black,
                                          backgroundColor: Colors.white)),
                                ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  /// Method for updating students' list according to changed parameters
  Future<void> updateAllStudentList() async {
    allStudentsList = await database.getAllRowsList();
    for (int i = 0; i < allStudentsList.length; i++) {
      if (allStudentsList[i]['gat'] == _shishuGat) {
        shishuGat.add(allStudentsList[i]['id']);
      } else if (allStudentsList[i]['gat'] == _balGat1) {
        balGat1.add(allStudentsList[i]['id']);
      } else if (allStudentsList[i]['gat'] == _balGat2) {
        balGat2.add(allStudentsList[i]['id']);
      }
    }
  }

  /// Helper Method
  String strToMonth(String s) {
    if (s == _month[0])
      return "01";
    else if (s == _month[1])
      return "02";
    else if (s == _month[2])
      return "03";
    else if (s == _month[3])
      return "04";
    else if (s == _month[4])
      return "05";
    else if (s == _month[5])
      return "06";
    else if (s == _month[6])
      return "07";
    else if (s == _month[7])
      return "08";
    else if (s == _month[8])
      return "09";
    else if (s == _month[9])
      return "10";
    else if (s == _month[10])
      return "11";
    else
      return "12";
  }

  /// Method to get attendance details according to month specified
  Future<void> getAttendanceGraphDataByMonth(String month) async {
    attendanceList =
        await database1.getAttendanceDetailsByMonth(strToMonth(month));
    dataMapBalGat1["Absent"] = 0;
    dataMapBalGat2["Absent"] = 0;
    dataMapShishuGat["Absent"] = 0;
    dataMapBalGat1["Present"] = 0;
    dataMapBalGat2["Present"] = 0;
    dataMapShishuGat["Present"] = 0;
    for (int i = 0; i < attendanceList.length; i++) {
      String idx = attendanceList[i]['id'];
      if (balGat2.contains(idx)) {
        if (attendanceList[i]['Attendance'] == 'present') {
          dataMapBalGat2["Present"] = (dataMapBalGat2["Present"]! + 1);
        } else
          dataMapBalGat2["Absent"] = (dataMapBalGat2["Absent"]! + 1);
      } else if (balGat1.contains(idx)) {
        if (attendanceList[i]['Attendance'] == 'present') {
          dataMapBalGat1["Present"] = (dataMapBalGat1["Present"]! + 1);
        } else
          dataMapBalGat1["Absent"] = (dataMapBalGat1["Absent"]! + 1);
      } else if (shishuGat.contains(idx)) {
        if (attendanceList[i]['Attendance'] == 'present') {
          dataMapShishuGat["Present"] = (dataMapShishuGat["Present"]! + 1);
        } else
          dataMapShishuGat["Absent"] = (dataMapShishuGat["Absent"]! + 1);
      }
    }
    if (_gat == "बाल गट-1")
      dataMap = dataMapBalGat1;
    else if (_gat == "बाल गट-2")
      dataMap = dataMapBalGat2;
    else
      dataMap = dataMapShishuGat;
  }
}
