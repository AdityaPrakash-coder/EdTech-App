import 'package:flutter/material.dart';

import 'package:iitpal_acharya_ui/database_crud/student_details_crud.dart';
import 'package:iitpal_acharya_ui/services/lang_selection.dart';
import '../../constants/integer_constants.dart';
import '../../constants/theme_colors.dart';
import '../../models/student_details_model.dart';
import '../unique_key_device.dart';
import 'package:numberpicker/numberpicker.dart';

class AddStudent extends StatefulWidget {
  final String lang;
  AddStudent({required this.lang});
  @override
  AddStudentState createState() => AddStudentState();
}

class AddStudentState extends State<AddStudent> {
  // Databases
  final database = StudentDetailsCRUD.instance;
  //final studentDataService = StudentDataService();

  // Variables
  late String _name;
  //bool _is_notification=false;
  late String _gat;
  int _age = 3;
  int _selectedStudentId = -1;
  // FlutterLocalNotificationsPlugin localNotification=FlutterLocalNotificationsPlugin();

  late List<Map<String, dynamic>> _listOfStudents;
  // late List<Map<String, dynamic>> _firebaseListOfStudents;
  TextEditingController _searchController = TextEditingController();
  String searchText = "";
  List<bool> _selectedGat = [true, false, false];
  String _deviceUniqueId = "";

  @override
  void initState() {
    super.initState();
    /* var androidInitialization=AndroidInitializationSettings('launcher_icon');
    var initializationSettings=InitializationSettings(android: androidInitialization);
   // localNotification=FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);*/
    getid();
    assignDetailsAndId();

    //  getStudentsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
          LangSelect(widget.lang, "managestudents", "managestudents"),
          style: TextStyle(
            fontSize: IntegerConstants.appNameFontSize,
          ),
        ),
      ),
      body: FutureBuilder(
          // future: database.getAllRowsList(),
          future: database.getAllRowsList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                !snapshot.hasData)
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 30,
                  vertical: MediaQuery.of(context).size.height / 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 25,
                      child: ListTile(
                        title: TextFormField(
                          style: TextStyle(
                              fontSize: IntegerConstants.listItemFontSize),
                          controller: _searchController,
                          onEditingComplete: () async {
                            _listOfStudents = await database
                                .getAllRowsListByFilter(_searchController.text);
                            //_firebaseListOfStudents = await studentDataService.getStudentsByFilter(_searchController.text);
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: LangSelect(
                                widget.lang, "managestudents", "search"),
                            icon: Icon(Icons.search),
                          ),
                        ),
                        trailing: Container(
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                _searchController.clear();
                              });
                              _listOfStudents = await database.getAllRowsList();
                              //_firebaseListOfStudents = await studentDataService.getAllStudents();
                            },
                            child: Icon(
                              Icons.clear_outlined,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.3,
                      padding: EdgeInsets.all(30.0),
                      child: _listOfStudents.length == 0
                          // child: _firebaseListOfStudents.length == 0
                          ? Container(
                              child: Center(
                                child: Text(
                                  LangSelect(widget.lang, "managestudents",
                                      "notfound"),
                                  style: TextStyle(fontSize: 25.0),
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: _listOfStudents.length,
                              // itemCount: _firebaseListOfStudents.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color:
                                      MaterialThemeColors.cardBackgroundColor,
                                  child: ListTile(
                                    title: Text(
                                      _listOfStudents[index]["name"],
                                      //_firebaseListOfStudents[index]["name"],
                                      style: TextStyle(
                                        fontSize:
                                            IntegerConstants.listItemFontSize,
                                      ),
                                    ),
                                    trailing: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.6,
                                        child: Row(
                                          children: [
                                            Text(
                                              LangSelect(widget.lang,
                                                      "managestudents", "gat") +
                                                  _listOfStudents[index]["gat"],
                                              //"Gat :  " + _firebaseListOfStudents[index]["gat"],
                                              style: TextStyle(
                                                fontSize: IntegerConstants
                                                    .listItemFontSize2,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              LangSelect(widget.lang,
                                                      "managestudents", "age") +
                                                  _listOfStudents[index]["age"]
                                                      .toString(),
                                              // "Age :  " + _firebaseListOfStudents[index]["age"].toString(),
                                              style: TextStyle(
                                                fontSize: IntegerConstants
                                                    .listItemFontSize2,
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () async {
                                                    _selectedStudentId = index;
                                                    print(_selectedStudentId);
                                                    _name =
                                                        _listOfStudents[index]
                                                            ["name"];
                                                    _gat =
                                                        _listOfStudents[index]
                                                            ["gat"];
                                                    _age =
                                                        _listOfStudents[index]
                                                            ["age"];
                                                    // _name = _firebaseListOfStudents[index]["name"];
                                                    //_gat = _firebaseListOfStudents[index]["gat"];
                                                    //_age = _firebaseListOfStudents[index]["age"];
                                                    if (_gat == "शिशु गट") {
                                                      _selectedGat = [
                                                        true,
                                                        false,
                                                        false
                                                      ];
                                                    } else if (_gat ==
                                                        "बाल गट-1") {
                                                      _selectedGat = [
                                                        false,
                                                        true,
                                                        false
                                                      ];
                                                    } else if (_gat ==
                                                        "बाल गट-2") {
                                                      _selectedGat = [
                                                        false,
                                                        false,
                                                        true
                                                      ];
                                                    }
                                                    setState(() {});
                                                    await showModifyAlertDialogBox(
                                                        context,
                                                        new StudentDetails(
                                                            id: _listOfStudents[
                                                                index]["id"],
                                                            studentName: _name,
                                                            studentGat: _gat,
                                                            studentAge: _age,
                                                            deviceUniqueId:
                                                                _deviceUniqueId,
                                                            synced: 'false',
                                                            dateOfSync:
                                                                DateTime.now()
                                                                    .toString()
                                                                    .substring(
                                                                        0,
                                                                        10)));
                                                    /* new StudentDetails(
                                                            id: _firebaseListOfStudents[index]["id"],
                                                            studentName: _name,
                                                            studentGat: _gat,
                                                            studentAge: _age,
                                                            deviceUniqueId: _deviceUniqueId,
                                                            synced: 'false',
                                                            dateOfSync: DateTime.now().toString().substring(0, 10)));*/
                                                  },
                                                  icon: Icon(Icons.edit),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    _selectedStudentId = index;
                                                    print(_selectedStudentId);
                                                    _name =
                                                        _listOfStudents[index]
                                                            ["name"];
                                                    _gat =
                                                        _listOfStudents[index]
                                                            ["gat"];
                                                    _age =
                                                        _listOfStudents[index]
                                                            ["age"];
                                                    //_name = _firebaseListOfStudents[index]["name"];
                                                    //_gat = _firebaseListOfStudents[index]["gat"];
                                                    //_age = _firebaseListOfStudents[index]["age"];
                                                    if (_gat == "शिशु गट") {
                                                      _selectedGat = [
                                                        true,
                                                        false,
                                                        false
                                                      ];
                                                    } else if (_gat ==
                                                        "बाल गट-1") {
                                                      _selectedGat = [
                                                        false,
                                                        true,
                                                        false
                                                      ];
                                                    } else if (_gat ==
                                                        "बाल गट-2") {
                                                      _selectedGat = [
                                                        false,
                                                        false,
                                                        true
                                                      ];
                                                    }
                                                    setState(() {});
                                                    showDeleteAlertDialogBox(
                                                        context, index);
                                                    setState(() {});
                                                  },
                                                  icon: Icon(Icons
                                                      .delete_outline_sharp),
                                                )
                                              ],
                                            )
                                            // Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/10))
                                          ],
                                        )),
                                  ),
                                );
                              }),
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: MaterialThemeColors.buttonColor,
        onPressed: () => showAddAlertDialogBox(context),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  /// Dialog box to add new student
  Future<void> showAddAlertDialogBox(context) {
    int _curAge = 5;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              LangSelect(widget.lang, "managestudents", "addnew"),
              style: TextStyle(
                  fontSize: IntegerConstants.alertDialogHeadingFontSize),
            ),
            content: StatefulBuilder(
              builder: (context, SBsetState) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          onChanged: (name) {
                            setState(() {
                              _name = name;
                            });
                          },
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            labelText: LangSelect(
                                widget.lang, "managestudents", "name"),
                            labelStyle: TextStyle(fontSize: 18),
                            icon: Icon(Icons.account_box),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.all(10.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Padding(padding: EdgeInsets.symmetric(horizontal: IntegerConstants.recommendedContainerPadding * 2)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  primary: (_selectedGat[0] == false)
                                      ? MaterialThemeColors.buttonColorLight
                                      : MaterialThemeColors.buttonColor,
                                  minimumSize: Size(144.0, 55.0)),
                              child: Text(
                                "शिशु गट",
                                style: TextStyle(fontSize: 22.0),
                              ),
                              onPressed: () async {
                                setState(() {
                                  _gat = "शिशु गट";
                                  _selectedGat = [true, false, false];
                                });
                                SBsetState(() {
                                  _gat = "शिशु गट";
                                  _selectedGat = [true, false, false];
                                });
                              },
                            ),
                            Padding(padding: EdgeInsets.all(8.0)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  primary: (_selectedGat[1] == false)
                                      ? MaterialThemeColors.buttonColorLight
                                      : MaterialThemeColors.buttonColor,
                                  minimumSize: Size(144.0, 55.0)),
                              child: Text(
                                "बाल गट-1",
                                style: TextStyle(fontSize: 22.0),
                              ),
                              onPressed: () async {
                                setState(() {
                                  _gat = "बाल गट-1";
                                  _selectedGat = [false, true, false];
                                });
                                SBsetState(() {
                                  _gat = "बाल गट-1";
                                  _selectedGat = [false, true, false];
                                });
                              },
                            ),
                            Padding(padding: EdgeInsets.all(8.0)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  primary: (_selectedGat[2] == false)
                                      ? MaterialThemeColors.buttonColorLight
                                      : MaterialThemeColors.buttonColor,
                                  minimumSize: Size(144.0, 55.0)),
                              child: Text(
                                "बाल गट-2",
                                style: TextStyle(fontSize: 22.0),
                              ),
                              onPressed: () async {
                                setState(() {
                                  _gat = "बाल गट-2";
                                  _selectedGat = [false, false, true];
                                });
                                SBsetState(() {
                                  _gat = "बाल गट-2";
                                  _selectedGat = [false, false, true];
                                });
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 25.0, top: 20.0)),
                              Text(
                                LangSelect(
                                    widget.lang, "managestudents", "age"),
                                style: TextStyle(fontSize: 22.0),
                              ),
                              Padding(padding: EdgeInsets.all(22.0)),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: NumberPicker(
                                  value: _curAge,
                                  minValue: 3,
                                  maxValue: 11,
                                  step: 1,
                                  itemHeight: 70,
                                  itemWidth: 50.0,
                                  textStyle: TextStyle(fontSize: 22.0),
                                  axis: Axis.horizontal,
                                  onChanged: (value) {
                                    setState(() => _curAge = value);
                                    SBsetState(() => _curAge = value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            actions: [
              ElevatedButton(
                  child: Text(
                    LangSelect(widget.lang, "managestudents", "cancel"),
                    style: TextStyle(
                        fontSize: IntegerConstants.alertDialogButtonSize),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    primary: MaterialThemeColors.buttonColorLight,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ElevatedButton(
                child: Text(
                  LangSelect(widget.lang, "managestudents", "submit"),
                  style: TextStyle(
                      fontSize: IntegerConstants.alertDialogButtonSize),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: MaterialThemeColors.buttonColorLight,
                ),
                onPressed: () async {
                  await database.insertNewStudent(StudentDetails(
                      id: UniqueKey().toString().substring(2, 7) +
                          _deviceUniqueId,
                      studentName: _name,
                      studentGat: _gat,
                      studentAge: _curAge,
                      deviceUniqueId: _deviceUniqueId,
                      synced: 'false',
                      dateOfSync: DateTime.now().toString().substring(0, 10)));
                  /* await studentDataService.addStudent(
                      studentDetails: StudentDetails(
                          id: UniqueKey().toString().substring(2, 7) + _deviceUniqueId,
                          studentName: _name,
                          studentGat: _gat,
                          studentAge: _curAge,
                          deviceUniqueId: _deviceUniqueId,
                          synced: 'false',
                          dateOfSync: DateTime.now().toString().substring(0, 10)));*/
                  _listOfStudents = await database.getAllRowsList();
                  // _firebaseListOfStudents = await studentDataService.getAllStudents();
                  print(_listOfStudents);
                  //print(_firebaseListOfStudents);
                  /*  if(_listOfStudents.length!=0){
                     setState((){
                       _is_notification=true;
                     });
                   }
                   if(_is_notification){
                     _showNotification();
                   }*/
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.black38,
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 5,
                        left: MediaQuery.of(context).size.width / 4,
                        right: MediaQuery.of(context).size.width / 4),
                    content: Text(
                      LangSelect(widget.lang, "managestudents", "studentadded"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: IntegerConstants.snackBarMessageFontSize),
                    ),
                  ));
                  setState(() {});
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  /// Dialog box to edit student details
  Future<void> showModifyAlertDialogBox(
      context, StudentDetails studentDetails) {
    int _curAge = _age;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              LangSelect(widget.lang, "managestudents", "editstudent"),
              style: TextStyle(
                  fontSize: IntegerConstants.alertDialogHeadingFontSize),
            ),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        initialValue: _name,
                        onChanged: (name) {
                          setState(() {
                            _name = name;
                          });
                        },
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          labelText:
                              LangSelect(widget.lang, "managestudents", "name"),
                          labelStyle: TextStyle(
                              fontSize:
                                  IntegerConstants.alertDialogTextFontSize),
                          icon: Icon(Icons.account_box),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Padding(padding: EdgeInsets.symmetric(horizontal: IntegerConstants.recommendedContainerPadding * 2)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                primary: (_selectedGat[0] == false)
                                    ? MaterialThemeColors.buttonColorLight
                                    : MaterialThemeColors.buttonColor,
                                minimumSize: Size(140.0, 50.0)),
                            child: Text(
                              "शिशु गट",
                              style: TextStyle(fontSize: 22.0),
                            ),
                            onPressed: () async {
                              setState(() {
                                _gat = "शिशु गट";
                                _selectedGat = [true, false, false];
                              });
                              SBsetState(() {
                                _gat = "शिशु गट";
                                _selectedGat = [true, false, false];
                              });
                            },
                          ),
                          Padding(padding: EdgeInsets.all(8.0)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                primary: (_selectedGat[1] == false)
                                    ? MaterialThemeColors.buttonColorLight
                                    : MaterialThemeColors.buttonColor,
                                minimumSize: Size(140.0, 50.0)),
                            child: Text(
                              "बाल गट-1",
                              style: TextStyle(fontSize: 22.0),
                            ),
                            onPressed: () async {
                              setState(() {
                                _gat = "बाल गट-1";
                                _selectedGat = [false, true, false];
                              });
                              SBsetState(() {
                                _gat = "बाल गट-1";
                                _selectedGat = [false, true, false];
                              });
                            },
                          ),
                          Padding(padding: EdgeInsets.all(8.0)),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                primary: (_selectedGat[2] == false)
                                    ? MaterialThemeColors.buttonColorLight
                                    : MaterialThemeColors.buttonColor,
                                minimumSize: Size(140.0, 50.0)),
                            child: Text(
                              "बाल गट-2",
                              style: TextStyle(fontSize: 22.0),
                            ),
                            onPressed: () async {
                              setState(() {
                                _gat = "बाल गट-2";
                                _selectedGat = [false, false, true];
                              });
                              SBsetState(() {
                                _gat = "बाल गट-2";
                                _selectedGat = [false, false, true];
                              });
                            },
                          ),
                        ],
                      ),
                      // TextFormField(
                      //   initialValue: _gat,
                      //   onChanged: (gat) {
                      //     setState(() {
                      //       _gat = gat;
                      //     });
                      //   },
                      //   decoration: InputDecoration(
                      //     labelText: 'Gat of Student',
                      //     icon: Icon(Icons.email),
                      //   ),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 25.0, top: 20.0)),
                          Text(
                            LangSelect(widget.lang, "managestudents", "age"),
                            style: TextStyle(fontSize: 22.0),
                          ),
                          Padding(padding: EdgeInsets.all(22.0)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: NumberPicker(
                              value: _curAge,
                              minValue: 3,
                              maxValue: 11,
                              step: 1,
                              itemHeight: 70,
                              itemWidth: 50.0,
                              textStyle: TextStyle(fontSize: 22.0),
                              axis: Axis.horizontal,
                              onChanged: (value) {
                                setState(() => _curAge = value);
                                SBsetState(() => _curAge = value);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
            actions: [
              ElevatedButton(
                  child: Text(
                    LangSelect(widget.lang, "managestudents", "cancel"),
                    style: TextStyle(
                        fontSize: IntegerConstants.alertDialogButtonSize),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    primary: MaterialThemeColors.buttonColorLight,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ElevatedButton(
                child: Text(
                  LangSelect(widget.lang, "managestudents", "submit"),
                  style: TextStyle(
                      fontSize: IntegerConstants.alertDialogButtonSize),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: MaterialThemeColors.buttonColorLight,
                ),
                onPressed: () async {
                  StudentDetails student = StudentDetails(
                      id: studentDetails.id,
                      studentName: _name,
                      studentGat: _gat,
                      studentAge: _curAge,
                      deviceUniqueId: _deviceUniqueId,
                      synced: 'false',
                      dateOfSync: DateTime.now().toString().substring(0, 10));
                  print(student.toString());
                  await database.updateRowById(student.toMap());
                  _listOfStudents = await database.getAllRowsList();
                  // await studentDataService.updateStudent(studentDetails: student);
                  //_firebaseListOfStudents = await studentDataService.getAllStudents();
                  // print(_firebaseListOfStudents);
                  setState(() {});
                  print(_listOfStudents);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  /// Dialog box for deleting student
  Future<void> showDeleteAlertDialogBox(context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              LangSelect(widget.lang, "managestudents", "deletestudent"),
              style: TextStyle(
                  fontSize: IntegerConstants.alertDialogHeadingFontSize),
            ),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  LangSelect(
                      widget.lang, "managestudents", "deletestudentwarning"),
                  style: TextStyle(
                      fontSize: IntegerConstants.alertDialogTextFontSize),
                ),
              );
            }),
            actions: [
              ElevatedButton(
                  child: Text(
                    LangSelect(widget.lang, "managestudents", "cancel"),
                    style: TextStyle(
                        fontSize: IntegerConstants.alertDialogButtonSize),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    primary: MaterialThemeColors.buttonColorLight,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ElevatedButton(
                child: Text(
                  LangSelect(widget.lang, "managestudents", "delete"),
                  style: TextStyle(
                      fontSize: IntegerConstants.alertDialogButtonSize),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  primary: MaterialThemeColors.buttonColorLight,
                ),
                onPressed: () async {
                  await database
                      .deleteStudentById(_listOfStudents[index]['id']);
                  //await studentDataService.deleteStudent(id: _firebaseListOfStudents[index]["id"]);
                  assignDetailsAndId();
                  //await getStudentsList();
                  Navigator.of(context).pop();
                  _selectedStudentId = -1;
                  setState(() {});
                },
              ),
            ],
          );
        });
  }

  /// Method to get device unique id
  Future<void> getid() async {
    _deviceUniqueId = (await getId())!;
    print(_deviceUniqueId);
  }

  /// Method to fetch list of all students
  /* Future<void> getStudentsList() async {
    _firebaseListOfStudents = await studentDataService.getAllStudents();
    _name = "";
    _gat = "शिशु गट";
    print(_firebaseListOfStudents);
  }*/
  /*void _showNotification() async{
    var androidDetails=AndroidNotificationDetails("channelId", "Local Notification",
        channelDescription: "You are successfully added the data do not forgot to sync the data",
        importance: Importance.high);
    var generalNotificationDetails=NotificationDetails(android: androidDetails);
    await localNotification.show(1, "Ekal Acharya",
        "You are successfully added the data do not forgot to sync the data" , generalNotificationDetails);
  }*/

// /// Method to reset student details
  void assignDetailsAndId() async {
    _listOfStudents = await database.getAllRowsList();
    _name = "";
    _gat = "शिशु गट";
    //_deviceUniqueId = "";
  }
}
