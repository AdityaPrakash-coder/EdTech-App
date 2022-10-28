import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/integer_constants.dart';
import 'package:iitpal_acharya_ui/constants/theme_colors.dart';
import 'package:iitpal_acharya_ui/database_crud/attendance_details_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/attendance_taken_by_date_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/holiday_database.dart';
import 'package:iitpal_acharya_ui/database_crud/student_details_crud.dart';
import 'package:iitpal_acharya_ui/models/holiday_model.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:intl/intl.dart';
import '../../models/attendance_details_model.dart';
import '../../models/date_wise_attendance_record_model.dart';
import '../../services/lang_selection.dart';
import '../unique_key_device.dart';

class AttendancePage extends StatefulWidget {
  final String lang;
  AttendancePage({required this.lang});
  @override
  AttendancePageState createState() => AttendancePageState();
}

class AttendancePageState extends State<AttendancePage> {
  // Databases
  /*final database = StudentDataService();
  final attendanceDatabase = AttendanceDetailsDataService();
  final dateWiseAttendanceDatabase = DateWiseRecordDataService();*/
  final database = StudentDetailsCRUD.instance;
  final attendanceDatabase = AttendanceDetailsCRUD.instance;
  final dateWiseAttendanceDatabase = DateWiseAttendanceRecordsCRUD.instance;
  final holidaydetailsDatabase = HolidayDetailsCRUD.instance;

  // Variables
  late String datetoday;
  late String _deviceUniqueId;
  String _shishuGat = "शिशु गट";
  String _balGat1 = "बाल गट-1";
  String _balGat2 = "बाल गट-2";
  bool isholiday_shishu_gat = true;
  bool isholiday_bal_gat1 = true;
  bool isholiday_bal_gat2 = true;

  late bool isholidayCheck;
  bool _showattendancescreen = true;
  bool _showdashboard = true;
  bool is_textfield = false;
  TextEditingController holidayController = TextEditingController();
  String remark = "";

  DateTime _selectedDate = DateTime.now();

  Map<String, double> dataMap = {"Absent": 0, "Present": 0};

  // Data Maps for Pie Chart
  late Map<String, double> dataMapShishuGat;
  late Map<String, double> dataMapBalGat1;
  late Map<String, double> dataMapBalGat2;

  List<Map<String, dynamic>> attendanceByDate = [];
  List<Map<String, dynamic>> holidayByDate = [];

  String _gat = "";
  late List<bool> _selectedGat = [false, false, false];

  List<Map<String, dynamic>> allStudentsList = [];
  List<Map<String, dynamic>> _studentsList = [];
  List<AttendanceDetails> attendanceList = [];
  List<Map<String, dynamic>> dateRecords = [];
  List<DateWiseRecord> _attendanceStatusByDateAndGat = [];
  Set<String> balGat1 = {};
  Set<String> shishuGat = {};
  Set<String> balGat2 = {};
  List<String> today = [];

  @override
  void initState() {
    super.initState();

    getid();
    updateALlStudentList();
    getDateRecords();
    updateToday();
    datetoday = DateFormat("dd-MM-yyyy").format(DateTime.now());
    dataMap = {"Absent": 0, "Present": 0};
    dataMapShishuGat = {"Absent": 0, "Present": 0};
    dataMapBalGat1 = {"Absent": 0, "Present": 0};
    dataMapBalGat2 = {"Absent": 0, "Present": 0};
    getAttendanceGraphData();
    _attendanceList();
    _checkholiday();
    _checkholidayonSelectedDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
          LangSelect(widget.lang, "takeattendance", "takeattendance"),
          style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
        ),
      ),
      body: FutureBuilder(
          future: database.getAllRowsList(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.all(10.0)),
                              Text(
                                '${LangSelect(widget.lang, "takeattendance", "date")}' +
                                    '$datetoday',
                                style: TextStyle(fontSize: 22.0),
                              ),
                              Padding(padding: EdgeInsets.all(10.0)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0)),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        primary: (_selectedGat[0] == false)
                                            ? MaterialThemeColors
                                                .buttonColorLight
                                            : MaterialThemeColors.buttonColor,
                                        minimumSize: Size(140.0, 50.0)),
                                    child: Text(
                                      "शिशु गट",
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _gat = "शिशु गट";
                                        _selectedGat = [true, false, false];
                                      });
                                      modify(_gat);
                                    },
                                  ),
                                  Padding(padding: EdgeInsets.all(8.0)),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        primary: (_selectedGat[1] == false)
                                            ? MaterialThemeColors
                                                .buttonColorLight
                                            : MaterialThemeColors.buttonColor,
                                        minimumSize: Size(140.0, 50.0)),
                                    child: Text(
                                      "बाल गट-1",
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _gat = "बाल गट-1";
                                        _selectedGat = [false, true, false];
                                      });
                                      modify(_gat);
                                    },
                                  ),
                                  Padding(padding: EdgeInsets.all(8.0)),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        primary: (_selectedGat[2] == false)
                                            ? MaterialThemeColors
                                                .buttonColorLight
                                            : MaterialThemeColors.buttonColor,
                                        minimumSize: Size(140.0, 50.0)),
                                    child: Text(
                                      "बाल गट-2",
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _gat = "बाल गट-2";
                                        _selectedGat = [false, false, true];
                                      });
                                      modify(_gat);
                                    },
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(20.0)),
                            ],
                          ),
                        ),
                        _showattendancescreen
                            ? Container(
                                width: MediaQuery.of(context).size.width / 2,
                                height: MediaQuery.of(context).size.height / 2,
                                padding:
                                    EdgeInsets.only(left: 50.0, right: 50.0),
                                child: (_selectedGat[0] == false &&
                                        _selectedGat[1] == false &&
                                        _selectedGat[2] == false)
                                    ? Container(
                                        child: Center(
                                          child: Text(
                                            LangSelect(widget.lang,
                                                "takeattendance", "selectgat"),
                                            style: TextStyle(
                                              fontSize: 25.0,
                                            ),
                                          ),
                                        ),
                                      )
                                    : (attendanceList.length == 0)
                                        ? Container(
                                            child: Center(
                                              child: Text(
                                                LangSelect(
                                                    widget.lang,
                                                    "takeattendance",
                                                    "nostudent"),
                                                style: TextStyle(
                                                  fontSize: 25.0,
                                                ),
                                              ),
                                            ),
                                          )
                                        : isholidayCheck
                                            ? isHoliday(_gat)
                                            : ListView.builder(
                                                itemCount:
                                                    attendanceList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ListTile(
                                                    leading: Icon(
                                                      Icons
                                                          .account_circle_sharp,
                                                      color: MaterialThemeColors
                                                          .buttonColor,
                                                      size: 40.0,
                                                    ),
                                                    title: Text(
                                                      _studentsList[index]
                                                          ['name'],
                                                      style: TextStyle(
                                                        fontSize: 25.0,
                                                      ),
                                                    ),
                                                    trailing: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if ((_selectedGat[0] == true && (today.contains('शिशु गट') == false)) ||
                                                              (_selectedGat[
                                                                          1] ==
                                                                      true &&
                                                                  (today.contains(
                                                                          'बाल गट-1') ==
                                                                      false)) ||
                                                              (_selectedGat[
                                                                          2] ==
                                                                      true &&
                                                                  (today.contains(
                                                                          'बाल गट-2') ==
                                                                      false)))
                                                            changeValueOfAttendance(
                                                                index);
                                                          else
                                                            showAttendanceAlreadyTakenMessage(
                                                                context);
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 90.0,
                                                        height: 35.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.0),
                                                          color: (attendanceList[
                                                                          index]
                                                                      .Attendance ==
                                                                  'absent')
                                                              ? Colors.redAccent[
                                                                  100]
                                                              : Colors.blueAccent[
                                                                  100],
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            attendanceList[
                                                                    index]
                                                                .Attendance,
                                                            style: TextStyle(
                                                                fontSize: 20.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width / 2,
                                height: MediaQuery.of(context).size.height / 2,
                                padding:
                                    EdgeInsets.only(left: 50.0, right: 50.0),
                                child: Center(
                                    child: Text(
                                  LangSelect(
                                      widget.lang, "takeattendance", "holiday"),
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                        _showattendancescreen
                            ? Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: FloatingActionButton.extended(
                                  backgroundColor:
                                      MaterialThemeColors.buttonColor,
                                  onPressed: () {
                                    if (_gat != "")
                                    //check if attendace is done or not
                                    if ((_selectedGat[0] == true &&
                                            (today.contains('शिशु गट') ==
                                                false)) ||
                                        (_selectedGat[1] == true &&
                                            (today.contains('बाल गट-1') ==
                                                false)) ||
                                        (_selectedGat[2] == true &&
                                            (today.contains('बाल गट-2') ==
                                                false)))
                                      showConfirmAttendanceDialog(context);
                                    else
                                      showAttendanceAlreadyTakenMessage(
                                          context);
                                  },
                                  icon: Icon(Icons.save),
                                  label: Text(
                                    LangSelect(
                                        widget.lang, "takeattendance", "save"),
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    Spacer(),
                    // DashBoard
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0)),
                              color: MaterialThemeColors.buttonColorLight,
                            ),
                            height: 60.0,
                            child: Center(
                                child: Text(
                              LangSelect(
                                  widget.lang, "takeattendance", "dashboard"),
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.7,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0)),
                                border: Border.all(
                                    color: MaterialThemeColors.buttonColorLight,
                                    width: 5.0)),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      LangSelect(widget.lang, "takeattendance",
                                          "selectdate"),
                                      style: TextStyle(fontSize: 22.0),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        textStyle: TextStyle(fontSize: 16.0),
                                        elevation: 2.0,
                                        primary: Colors.white,
                                        onPrimary: Colors.black,
                                        minimumSize: Size(100.0, 40.0)),
                                    child: Row(
                                      children: [
                                        Text(
                                          _selectedDate
                                              .toString()
                                              .substring(0, 10),
                                          style: TextStyle(
                                              fontSize: IntegerConstants
                                                  .buttonFontSize),
                                        )
                                      ],
                                    ),
                                    onPressed: () async {
                                      await _pickDateDialog();
                                      setState(() {
                                        getAttendanceGraphData();
                                      });
                                    },
                                  ),
                                ],
                              ),
                              _showdashboard
                                  ? Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.6,
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          ((dataMapShishuGat["Absent"] == 0) &&
                                                  (dataMapShishuGat[
                                                          "Present"] ==
                                                      0))
                                              ? Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      7,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                      border: Border.all(
                                                          color: Colors
                                                              .redAccent[200]!,
                                                          width: 2.0)),
                                                  child: Row(children: [
                                                    Text(
                                                      "शिशु गट :    ",
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                    Text(
                                                      LangSelect(
                                                          widget.lang,
                                                          "takeattendance",
                                                          "attendancenottaken"),
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                  ]),
                                                )
                                              : Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      7,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                      border: Border.all(
                                                          color: Colors
                                                              .redAccent[200]!,
                                                          width: 2.0)),
                                                  child: Row(children: [
                                                    Text(
                                                      "शिशु गट :    ",
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                    PieChart(
                                                      dataMap: dataMapShishuGat,
                                                      animationDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  800),
                                                      chartLegendSpacing: 32,
                                                      chartRadius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.5,
                                                      initialAngleInDegree: 0,
                                                      ringStrokeWidth: 32,
                                                      colorList: [
                                                        MaterialThemeColors
                                                            .primaryColor,
                                                        MaterialThemeColors
                                                            .buttonColorLight,
                                                      ],
                                                      chartValuesOptions:
                                                          ChartValuesOptions(
                                                        showChartValueBackground:
                                                            true,
                                                        showChartValues: true,
                                                        showChartValuesInPercentage:
                                                            true,
                                                        showChartValuesOutside:
                                                            false,
                                                        decimalPlaces: 1,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                          Padding(
                                              padding: EdgeInsets.all(10.0)),
                                          ((dataMapBalGat1["Absent"] == 0) &&
                                                  (dataMapBalGat1["Present"] ==
                                                      0))
                                              ? Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      7,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                      border: Border.all(
                                                          color: Colors
                                                              .redAccent[200]!,
                                                          width: 2.0)),
                                                  child: Row(children: [
                                                    Text(
                                                      "बाल गट-1 :    ",
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                    Text(
                                                      LangSelect(
                                                          widget.lang,
                                                          "takeattendance",
                                                          "attendancenottaken"),
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                  ]),
                                                )
                                              : Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      7,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                      border: Border.all(
                                                          color: Colors
                                                              .redAccent[200]!,
                                                          width: 2.0)),
                                                  child: Row(children: [
                                                    Text(
                                                      "बाल गट-1 :    ",
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                    PieChart(
                                                      dataMap: dataMapBalGat1,
                                                      animationDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  800),
                                                      chartLegendSpacing: 32,
                                                      chartRadius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.2,
                                                      initialAngleInDegree: 0,
                                                      ringStrokeWidth: 32,
                                                      colorList: [
                                                        MaterialThemeColors
                                                            .primaryColor,
                                                        MaterialThemeColors
                                                            .buttonColorLight,
                                                      ],
                                                      chartValuesOptions:
                                                          ChartValuesOptions(
                                                        showChartValueBackground:
                                                            true,
                                                        showChartValues: true,
                                                        showChartValuesInPercentage:
                                                            true,
                                                        showChartValuesOutside:
                                                            false,
                                                        decimalPlaces: 1,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                          Padding(
                                              padding: EdgeInsets.all(10.0)),
                                          ((dataMapBalGat2["Absent"] == 0) &&
                                                  (dataMapBalGat2["Present"] ==
                                                      0))
                                              ? Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      7,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                      border: Border.all(
                                                          color: Colors
                                                              .redAccent[200]!,
                                                          width: 2.0)),
                                                  child: Row(children: [
                                                    Text(
                                                      "बाल गट-2 :    ",
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                    Text(
                                                      LangSelect(
                                                          widget.lang,
                                                          "takeattendance",
                                                          "attendancenottaken"),
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                  ]),
                                                )
                                              : Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      7,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                      border: Border.all(
                                                          color: Colors
                                                              .redAccent[200]!,
                                                          width: 2.0)),
                                                  child: Row(children: [
                                                    Text(
                                                      "बाल गट-2 :    ",
                                                      style: TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                                    PieChart(
                                                      dataMap: dataMapBalGat2,
                                                      animationDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  800),
                                                      chartLegendSpacing: 32,
                                                      chartRadius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3.2,
                                                      initialAngleInDegree: 0,
                                                      ringStrokeWidth: 32,
                                                      colorList: [
                                                        MaterialThemeColors
                                                            .primaryColor,
                                                        MaterialThemeColors
                                                            .buttonColorLight,
                                                      ],
                                                      chartValuesOptions:
                                                          ChartValuesOptions(
                                                        showChartValueBackground:
                                                            true,
                                                        showChartValues: true,
                                                        showChartValuesInPercentage:
                                                            true,
                                                        showChartValuesOutside:
                                                            false,
                                                        decimalPlaces: 1,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.6,
                                      padding: EdgeInsets.all(20.0),
                                      child: Center(
                                          child: Text(
                                        "Holiday on ${_selectedDate.toString().substring(0, 10)}",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(20.0))
                  ],
                ),
              ),
            );
          }),
    );
  }

  /// Method to update the list of all students
  void updateALlStudentList() async {
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
  Future<List<Map<String, dynamic>>> getEmptyList() async {
    return [];
  }

  /// Method to get Data for the graph for selected date
  Future<void> getAttendanceGraphData() async {
    attendanceByDate = await attendanceDatabase
        .getAttendanceDetailsByDate(_selectedDate.toString().substring(0, 10));
    print(attendanceByDate);
    dataMapBalGat1["Absent"] = 0;
    dataMapBalGat2["Absent"] = 0;
    dataMapShishuGat["Absent"] = 0;
    dataMapBalGat1["Present"] = 0;
    dataMapBalGat2["Present"] = 0;
    dataMapShishuGat["Present"] = 0;
    for (int i = 0; i < attendanceByDate.length; i++) {
      String idx = attendanceByDate[i]['id'];
      if (balGat2.contains(idx)) {
        if (attendanceByDate[i]['Attendance'] == "present") {
          dataMapBalGat2["Present"] = (dataMapBalGat2["Present"]! + 1);
        } else
          dataMapBalGat2["Absent"] = (dataMapBalGat2["Absent"]! + 1);
      } else if (balGat1.contains(idx)) {
        if (attendanceByDate[i]['Attendance'] == "present") {
          dataMapBalGat1["Present"] = (dataMapBalGat1["Present"]! + 1);
        } else
          dataMapBalGat1["Absent"] = (dataMapBalGat1["Absent"]! + 1);
      } else if (shishuGat.contains(idx)) {
        if (attendanceByDate[i]['Attendance'] == "present") {
          dataMapShishuGat["Present"] = (dataMapShishuGat["Present"]! + 1);
        } else
          dataMapShishuGat["Absent"] = (dataMapShishuGat["Absent"]! + 1);
      }
    }
  }

  Future<void> _attendanceList() async {
    attendanceByDate = await attendanceDatabase
        .getAttendanceDetailsByDate(DateTime.now().toString().substring(0, 10));
    if (attendanceByDate.length == 0) {
      isholidayCheck = true;
    } else {
      isholidayCheck = false;
    }
  }

  /// Method for showing the date picker
  Future<void> _pickDateDialog() async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2022),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });

      _checkholidayonSelectedDate();
    }
  }

  /// Method to update attendance Status by date and gat
  Future<void> getDateRecords() async {
    dateRecords = await getEmptyList();
    _attendanceStatusByDateAndGat.clear();
    dateRecords = await dateWiseAttendanceDatabase.getList();
    print("Dae Records: " + dateRecords.toString());
    for (int i = 0; i < dateRecords.length; i++) {
      var x = DateWiseRecord(
          date: dateRecords[i]['date'],
          gat: dateRecords[i]['gat'],
          deviceUniqueId: _deviceUniqueId);
      _attendanceStatusByDateAndGat.add(x);
    }
  }

  /// Method to store the today's attendance data in today variable if attendance already taken
  void updateToday() async {
    today.clear();
    List<Map<String, dynamic>> todaysAttendance = await attendanceDatabase
        .getAttendanceDetailsByDate(DateTime.now().toString().substring(0, 10));
    for (var x in todaysAttendance) {
      String index = x['id'];
      if (shishuGat.contains(index))
        today.add("शिशु गट");
      else if (balGat1.contains(index))
        today.add("बाल गट-1");
      else if (balGat2.contains(index)) today.add("बाल गट-2");
    }
  }

  Widget isHoliday(String gat) {
    return Container(
      child: Column(
        children: [
          Row(children: [
            Text(
              LangSelect(widget.lang, "takeattendance", "holiday"),
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              width: 10.0,
            ),
            ElevatedButton(
                child: Text("Yes"),
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 16.0),
                    elevation: 2.0,
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(30.0, 30.0)),
                onPressed: () {
                  setState(() => is_textfield = true);
                }),
            SizedBox(
              width: 10.0,
            ),
            ElevatedButton(
                child: Text("No"),
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 16.0),
                    elevation: 2.0,
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(30.0, 30.0)),
                onPressed: () {
                  setState(() => isholidayCheck = false);
                }),
          ]),
          is_textfield
              ? TextFormField(
                  controller: holidayController,
                  validator: (value) =>
                      value!.isEmpty ? "Enter a remark" : null,
                  onChanged: (userName) async {
                    remark = userName;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MaterialThemeColors.backgroundColor,
                          width: 10.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Remark',
                    hintText: "because of Holi",
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  /// Method to update attendance list of students based on gat selection
  void modify(String gat) async {
    _studentsList = await database.getStudentByGat(gat);
    attendanceList.clear();
    if (today.contains(gat)) {
      List<Map<String, dynamic>> attendanceDataToday =
          await attendanceDatabase.getAttendanceDetailsByDate(
              DateTime.now().toString().substring(0, 10));
      for (var x in attendanceDataToday) {
        String idx = x['id'];
        if ((gat == 'शिशु गट' && shishuGat.contains(idx)) ||
            (gat == 'बाल गट-1' && balGat1.contains(idx)) ||
            (gat == 'बाल गट-2' && balGat2.contains(idx))) {
          attendanceList.add(AttendanceDetails(
              synced: 'false',
              dateOfSync: '',
              id: idx,
              date: DateTime.now().toString().substring(0, 10),
              Attendance: x['Attendance'],
              deviceUniqueId: getId().toString()));
        }
      }
    } else {
      for (int i = 0; i < _studentsList.length; i++) {
        var x = AttendanceDetails(
            id: _studentsList[i]['id'].toString(),
            date: DateTime.now().toString().substring(0, 10),
            Attendance: 'absent',
            deviceUniqueId: _deviceUniqueId,
            synced: 'false',
            dateOfSync: DateTime.now().toString().substring(0, 10));
        attendanceList.add(x);
      }
    }
    print(attendanceList.length);
    setState(() {});
  }

  /// Method to change value of attendance to present or absent of a particular student
  void changeValueOfAttendance(int idx) {
    List<AttendanceDetails> tempList = [];
    for (int i = 0; i < attendanceList.length; i++) {
      if (i != idx)
        tempList.add(attendanceList[i]);
      else {
        if (attendanceList[i].Attendance == 'present') {
          var x = AttendanceDetails(
              id: attendanceList[i].id,
              date: attendanceList[i].date,
              Attendance: 'absent',
              deviceUniqueId: _deviceUniqueId,
              synced: 'false',
              dateOfSync: DateTime.now().toString().substring(0, 10));
          tempList.add(x);
        } else {
          var x = AttendanceDetails(
              id: attendanceList[i].id,
              date: attendanceList[i].date,
              Attendance: 'present',
              deviceUniqueId: _deviceUniqueId,
              synced: 'false',
              dateOfSync: DateTime.now().toString().substring(0, 10));
          tempList.add(x);
        }
      }
    }
    attendanceList.clear();
    attendanceList = tempList;
  }

  /// Method to add attendance records to database
  Future<void> addholidayRecord() async {
    HolidayDetails holidaydetails = HolidayDetails(
        dateOfHoliday: DateTime.now().toString().substring(0, 10),
        remark: remark,
        id: UniqueKey().toString().substring(2, 7) + _deviceUniqueId,
        deviceUniqueId: _deviceUniqueId,
        gat: _gat,
        synced: "false",
        dateOfSynced: '');
    await holidaydetailsDatabase.insertNewContent(holidaydetails);
  }

  Future<void> addRecords() async {
    DateWiseRecord record = DateWiseRecord(
        date: DateTime.now().toString().substring(0, 10),
        gat: _studentsList[0]['gat'],
        deviceUniqueId: _deviceUniqueId);
    today.add(_studentsList[0]['gat']);
    await dateWiseAttendanceDatabase.insertNewDateRecord(record);
    _attendanceStatusByDateAndGat.add(record);
    for (int i = 0; i < attendanceList.length; i++) {
      await attendanceDatabase.insertNewRecord(attendanceList[i]);
    }
  }

  /// Method to get Device Unique ID
  Future<void> getid() async {
    _deviceUniqueId = (await getId())!;
  }

  //Method of checking that today is holiday
  Future<void> _checkholiday() async {
    holidayByDate = await holidaydetailsDatabase
        .getHolidayDetailsByDate(DateTime.now().toString().substring(0, 10));
    if (holidayByDate.length == 0) {
      setState(() => _showattendancescreen = true);
    } else {
      setState(() => _showattendancescreen = false);
    }
  }

  Future<void> _checkholidayonSelectedDate() async {
    holidayByDate = await holidaydetailsDatabase
        .getHolidayDetailsByDate(_selectedDate.toString().substring(0, 10));
    if (holidayByDate.length == 0) {
      setState(() => _showdashboard = true);
    } else {
      setState(() => _showdashboard = false);
    }
  }

  /// Dialog box to confirm attendance
  showConfirmAttendanceDialog(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: TextStyle(
            color: MaterialThemeColors.buttonColor,
            fontSize: IntegerConstants.alertDialogButtonSize),
      ),
      onPressed: () async {
        if (is_textfield) {
          await addholidayRecord();
          setState(() {});

          Navigator.of(context).pop();
        }

        await addRecords();
        await getDateRecords();
        await getAttendanceGraphData();
        setState(() {});
        Navigator.of(context).pop();
      },
    );
    Widget cancelButton = TextButton(
      child: Text(
        LangSelect(widget.lang, "takeattendance", "cancel"),
        style: TextStyle(
            color: MaterialThemeColors.buttonColor,
            fontSize: IntegerConstants.alertDialogButtonSize),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        LangSelect(widget.lang, "takeattendance", "confirmattendance"),
        style: TextStyle(fontSize: 25),
      ),
      content: Text(
        LangSelect(widget.lang, "takeattendance", "confirmwarning"),
        style: TextStyle(fontSize: 20),
      ),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  /// Dialog box for attendance already taken
  showAttendanceAlreadyTakenMessage(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text(
        LangSelect(widget.lang, "takeattendance", "ok"),
        style: TextStyle(color: MaterialThemeColors.buttonColor, fontSize: 18),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        LangSelect(widget.lang, "takeattendance", "attendancetaken"),
        style: TextStyle(fontSize: 25),
      ),
      content: Text(
        LangSelect(widget.lang, "takeattendance", "takenwarning"),
        style: TextStyle(fontSize: 20),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
