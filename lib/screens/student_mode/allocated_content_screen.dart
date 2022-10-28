import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iitpal_acharya_ui/constants/constants.dart' as Constants;
import 'package:iitpal_acharya_ui/database_crud/student_details_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/allocated_content_firebase_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/student_data_crud.dart';
import 'package:iitpal_acharya_ui/models/allocated_content_model.dart';
import 'package:iitpal_acharya_ui/screens/student_mode/student_home_page.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../constants/integer_constants.dart';
import '../../constants/theme_colors.dart';
import '../../database_crud/allocated_content_crud.dart';
import '../../services/lang_selection.dart';
import '../unique_key_device.dart';

class AllocatedContentPage extends StatefulWidget {
  final String lang;
  AllocatedContentPage({required this.lang});
  @override
  State<AllocatedContentPage> createState() => _AllocatedContentPageState();
}

class _AllocatedContentPageState extends State<AllocatedContentPage> {
  // Databases
  final contentsDatabase = AllocatedContentCRUD.instance;
  final studentsDatabase = StudentDetailsCRUD.instance;
  // final contentsDatabase = AllocatedContentService();
  // final studentsDatabase = StudentDataService();

  // Variables
  DateTime _selectedDate = DateTime.now();

  // List<Map<String, dynamic>> allocatedContent = [];
  // late List<Map<String, dynamic>> _listOfAllocatedContent;
  List<AllocatedContent> allocatedContent = [];
  late List<Map<String, dynamic>> _listOfAllocatedContent;
  bool sampleDataAdded = true;

  late String _deviceUniqueId;

  @override
  void initState() {
    super.initState();
    // initialize list variables
    _getAllRowsList();
    // get device unique id
    getid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
          LangSelect(widget.lang, "studentmode", "studentmode"),
          style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
        ),
      ),
      body: FutureBuilder(
          future: contentsDatabase.getAllRowsList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height / 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              LangSelect(
                                  widget.lang, "studentmode", "selectdate"),
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 100.0,
                              width: 250.0,
                              child: ScrollDatePicker(
                                selectedDate: _selectedDate,
                                minimumDate: DateTime.now(),
                                maximumDate: DateTime(DateTime.now().year,
                                    DateTime.now().month + 1),
                                style: DatePickerStyle(
                                  selectedTextStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                ),
                                onDateTimeChanged: (DateTime value) {
                                  setState(() {
                                    _selectedDate = value;
                                    modify(value.toString().substring(0, 10));
                                  });
                                },
                              ),
                            ),
                          ]),
                      (_listOfAllocatedContent.length == 0)
                          ? Container(
                              padding: EdgeInsets.all(50.0),
                              child: Center(
                                child: Text(
                                  LangSelect(
                                      widget.lang, "studentmode", "nocontent"),
                                  style: TextStyle(fontSize: 25.0),
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(16),
                                  child: ListTile(
                                    leading: Text(
                                      'S. No.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 22.0),
                                    ),
                                    title: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: Row(
                                        children: [
                                          Text(
                                            LangSelect(widget.lang,
                                                "studentmode", "videoname"),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 22.0),
                                          ),
                                          Spacer(),
                                          Text(
                                            LangSelect(widget.lang,
                                                "studentmode", "gat"),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 22.0),
                                          ),
                                          Spacer(),
                                          Text(
                                            LangSelect(widget.lang,
                                                "studentmode", "subject"),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 22.0),
                                          ),
                                          Spacer(),
                                          Text(
                                            LangSelect(widget.lang,
                                                "studentmode", "topic"),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 22.0),
                                          ),
                                          Spacer(),
                                          Text(
                                            "           ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 22.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height:
                                      MediaQuery.of(context).size.height / 3.5,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(16),
                                  child: ListView.builder(
                                      itemCount: _listOfAllocatedContent.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: Text(
                                            '${index + 1}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          title: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.5,
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      7,
                                                  child: Text(
                                                    '${_listOfAllocatedContent[index]["contentName"]}',
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                    ),
                                                    softWrap: true,
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      15,
                                                  child: Text(
                                                    '${_listOfAllocatedContent[index]["contentGat"]}',
                                                    style: TextStyle(
                                                        fontSize: 20.0),
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      7,
                                                  child: Text(
                                                    '${_listOfAllocatedContent[index]["contentSubject"]}',
                                                    style: TextStyle(
                                                        fontSize: 20.0),
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      7,
                                                  child: Text(
                                                    '${_listOfAllocatedContent[index]["contentTopic"]}',
                                                    style: TextStyle(
                                                        fontSize: 20.0),
                                                  ),
                                                ),
                                                Spacer(),
                                                OutlinedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty.all(
                                                            MaterialThemeColors
                                                                .dashboardCardColor),
                                                    shape: MaterialStateProperty
                                                        .all(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    )),
                                                  ),
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: MaterialThemeColors
                                                        .buttonColor,
                                                    size: 25.0,
                                                  ),
                                                  onPressed: () async {
                                                    await showDeleteAlertDialogBox(
                                                        context, index);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                      // Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            LangSelect(widget.lang, "studentmode", "selectgat"),
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StudentHomePage(
                                                  gat: "शिशु गट",
                                                  deviceUniqueId:
                                                      _deviceUniqueId,
                                                  lang: widget.lang,
                                                )));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    primary: MaterialThemeColors.buttonColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "शिशु गट",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 28),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 100,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StudentHomePage(
                                                  gat: "बाल गट-1",
                                                  deviceUniqueId:
                                                      _deviceUniqueId,
                                                  lang: widget.lang,
                                                )));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    primary: MaterialThemeColors.buttonColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "बाल गट-1",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 28),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 100,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StudentHomePage(
                                                  gat: "बाल गट-2",
                                                  deviceUniqueId:
                                                      _deviceUniqueId,
                                                  lang: widget.lang,
                                                )));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    primary: MaterialThemeColors.buttonColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "बाल गट-2",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 28),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            );
          }),
    );
  }

  /// Method for getting device's unique id
  void getid() async {
    _deviceUniqueId = (await getId())!;
  }

  /// Method to modify list according to selected date
  void modify(String date) async {
    _listOfAllocatedContent =
        await contentsDatabase.getAllocatedContentByDate(date);
    print(_listOfAllocatedContent);
  }

  /// Method for retrieving tables data into a list
  Future<void> _getAllRowsList() async {
    _listOfAllocatedContent = await contentsDatabase
        .getAllocatedContentByDate(DateTime.now().toString().substring(0, 10));
    print(_listOfAllocatedContent);
  }

  /// Dialog Box for confirmation of user
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Constants.attention),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(Constants.logoutWarning),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(Constants.no),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(Constants.yes),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteAlertDialogBox(context, int i) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              LangSelect(widget.lang, "studentmode", "deletecontent"),
              style: TextStyle(
                  fontSize: IntegerConstants.alertDialogHeadingFontSize),
            ),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  LangSelect(widget.lang, "studentmode", "deletewarning"),
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
                      LangSelect(widget.lang, "studentmode", "no"),
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {});
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
                    LangSelect(widget.lang, "studentmode", "yes"),
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
                onPressed: () async {
                  await contentsDatabase.deleteAllocatedContentById(
                      _listOfAllocatedContent[i]["id"]);

                  _listOfAllocatedContent =
                      await contentsDatabase.getAllocatedContentByDate(
                          DateTime.now().toString().substring(0, 10));
                  ;
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
