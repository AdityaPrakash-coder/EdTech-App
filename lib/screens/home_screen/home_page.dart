import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iitpal_acharya_ui/constants/integer_constants.dart';
import 'package:iitpal_acharya_ui/constants/theme_colors.dart';
import 'package:iitpal_acharya_ui/database_crud/allocated_content_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/appuse_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/attendance_details_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/login_signup_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/question_bank_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/student_details_crud.dart';
import 'package:iitpal_acharya_ui/screens/content_screen/content_selection_page.dart';
import 'package:iitpal_acharya_ui/screens/review_screen/review_page.dart';
import 'package:iitpal_acharya_ui/screens/student_mode/allocated_content_screen.dart';
import 'package:iitpal_acharya_ui/services/sample_data.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../database_crud/holiday_database.dart';
import '../../database_crud/quiz_allocation_schedule_crud.dart';
import '../../database_crud/quiz_details_crud.dart';
import '../../database_crud/quiz_outcome_crud.dart';
import '../../database_crud/video_watched_crud.dart';
import '../../i18n/strings.g.dart';
import '../../services/lang_selection.dart';
import '../assessment_screen/quiz_page.dart';
import '../attendance_screen/attendance_Screen.dart';
import '../manage_student_Screen/manage_student.dart';
import 'drawer/creat_video.dart';
import 'drawer/monthly_quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lang = "english";
  String dropdownValue = "english";
  final english = AppLocale.en.build();
  final hindi = AppLocale.hi.build();
  final Connectivity _connectivity = Connectivity();
  late ConnectivityResult result;

  FlutterLocalNotificationsPlugin localNotification =
      FlutterLocalNotificationsPlugin();

  Future<void> writePermission() async {
    //ask for write permission until given
    var status = await Permission.storage.request();
    if (status.isGranted) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    var androidInitialization = AndroidInitializationSettings('launcher_icon');
    var initializationSettings =
        InitializationSettings(android: androidInitialization);
    // localNotification=FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
    _isCheckSyncdata();

    //  getStudentsList();
  }

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: MaterialThemeColors.primaryColor,
              ),
              child: Center(
                  child: Text(
                'Events',
                style: TextStyle(fontSize: 30, color: Colors.white),
              )),
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UploadVideoPage()));
                },
              ),
              title: const Text('Youtube Page', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UploadVideoPage()));
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.assessment),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MonthlyQuizPage()));
                },
              ),
              title: const Text(
                'Monthly Quiz',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MonthlyQuizPage()));
// Update the state of the app.
// ...
              },
            ),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                'Back',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        leading: Text(''),
        /*leading: IconButton(icon: Icon(Icons.drag_indicator), onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => drawer()));
        },

        ),*/
        title: Text(
          LangSelect(lang, "homepage", "ekal"),
          style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
        ),
        actions: [
          TextButton(
              onPressed: () async {
                await initConnectivity();
                if (result == ConnectivityResult.wifi ||
                    result == ConnectivityResult.ethernet ||
                    result == ConnectivityResult.mobile) {
                  _syncDatatoFirebase();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.black38,
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 5,
                        left: MediaQuery.of(context).size.width / 4,
                        right: MediaQuery.of(context).size.width / 4),
                    content: Text(
                      LangSelect(lang, "homepage", "synced"),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.black38,
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 5,
                        left: MediaQuery.of(context).size.width / 4,
                        right: MediaQuery.of(context).size.width / 4),
                    content: Text(
                      LangSelect(lang, "homepage", "notsynced"),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ));
                }
              },
              child: Icon(
                Icons.sync,
                color: Colors.white,
                size: 30.0,
              )),
          Container(
            width: 120,
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(
                Icons.language,
                size: 30,
                color: Colors.black,
              ),
              elevation: 16,
              style: const TextStyle(color: Colors.white),
              underline: Container(
                height: 2,
                color: Colors.purple,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  lang = dropdownValue;
                  // if (dropdownValue == 'Hindi')
                  //   lang = true;
                  // else if (dropdownValue == 'English') lang_hi = false;
                });
              },
              items: <String>[
                'hindi',
                'english',
                'tamil',
                "kannada",
                "gujarati",
                "telugu",
                "bengali",
                "punjabi",
                "odia",
                "assamese",
                "urdu",
                "malayalam",
                "marathi"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () {
          SystemNavigator.pop();
          return Future.value(true);
        },
        child: FutureBuilder(
            future: writePermission(),
            builder: (context, snapshot) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 25,
                  vertical: MediaQuery.of(context).size.height / 50,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height / 20,
                      left: MediaQuery.of(context).size.width / 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height / 3,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllocatedContentPage(
                                          lang: lang,
                                        )));
                          },
                          child: Card(
                            color: MaterialThemeColors.dashboardCardColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_pin_rounded,
                                  size: MediaQuery.of(context).size.height / 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height / 120.0,
                                  ),
                                ),
                                Text(
                                  LangSelect(lang, "homepage", "studentmode"),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 12,
                      left: MediaQuery.of(context).size.width * 13 / 20 + 10.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ContentSelectionPage(lang: lang)));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: MaterialThemeColors.dashboardCardColor,
                            elevation: 5.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.content_copy_outlined,
                                  size: MediaQuery.of(context).size.height / 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height / 120.0,
                                  ),
                                ),
                                Text(
                                  LangSelect(
                                      lang, "homepage", "allocatecontent"),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 12 +
                          MediaQuery.of(context).size.height / 5 +
                          5.0 +
                          10.0,
                      left: MediaQuery.of(context).size.width * 13 / 20 + 10.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 6,
                        height: MediaQuery.of(context).size.height / 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReviewView(lang: lang)));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: MaterialThemeColors.dashboardCardColor,
                            elevation: 5.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.rate_review_rounded,
                                  size: MediaQuery.of(context).size.height / 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height / 120.0,
                                  ),
                                ),
                                Text(
                                  LangSelect(lang, "homepage", "review"),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 20 +
                          MediaQuery.of(context).size.height / 6 -
                          MediaQuery.of(context).size.height / 20,
                      left: MediaQuery.of(context).size.width / 4 -
                          MediaQuery.of(context).size.width / 5 -
                          10.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 4,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddStudent(
                                          lang: lang,
                                        )));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: MaterialThemeColors.dashboardCardColor,
                            elevation: 5.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.manage_accounts_rounded,
                                  size: MediaQuery.of(context).size.height / 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height / 120.0,
                                  ),
                                ),
                                Text(
                                  LangSelect(lang, "homepage", "managestudent"),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 20 +
                          MediaQuery.of(context).size.height / 3 +
                          10.0,
                      left: MediaQuery.of(context).size.width / 4 +
                          MediaQuery.of(context).size.width / 2.5 -
                          MediaQuery.of(context).size.width / 3,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3.3 -
                            MediaQuery.of(context).size.width / 6 +
                            MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 3.3,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Quiz(lang: lang)));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: MaterialThemeColors.dashboardCardColor,
                            elevation: 5.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.speaker_notes_rounded,
                                  size: 40.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height / 120.0,
                                  ),
                                ),
                                Text(
                                  LangSelect(lang, "homepage", "assessment"),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 20 +
                          MediaQuery.of(context).size.height / 6 +
                          MediaQuery.of(context).size.height / 4 -
                          MediaQuery.of(context).size.height / 20 +
                          10.0,
                      left: MediaQuery.of(context).size.width / 4 -
                          MediaQuery.of(context).size.width / 6,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4.5,
                        height: MediaQuery.of(context).size.height / 6,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AttendancePage(lang: lang)));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: MaterialThemeColors.dashboardCardColor,
                            elevation: 5.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.watch_later,
                                  size: MediaQuery.of(context).size.height / 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height / 120.0,
                                  ),
                                ),
                                Text(
                                  LangSelect(
                                      lang, "homepage", "takeattendance"),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 20 +
                          MediaQuery.of(context).size.height / 3 +
                          MediaQuery.of(context).size.height / 4.5 +
                          10.0,
                      left: MediaQuery.of(context).size.width / 4 +
                          MediaQuery.of(context).size.width / 2.5 -
                          MediaQuery.of(context).size.width / 3 +
                          MediaQuery.of(context).size.width / 3.3 -
                          MediaQuery.of(context).size.width / 6 +
                          MediaQuery.of(context).size.width / 8 +
                          10.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5.5,
                        height: MediaQuery.of(context).size.height / 13,
                        child: InkWell(
                          onTap: () {
                            /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SyncPage()));*/
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: MaterialThemeColors.dashboardCardColor,
                            elevation: 5.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: MediaQuery.of(context).size.height / 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    SampleData();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.black38,
                                      margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4),
                                      content: Text(
                                        LangSelect(
                                            lang, "homepage", "loadeddata"),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.height /
                                            120.0),
                                    child: Text(
                                      LangSelect(
                                          lang, "homepage", "loadsampledata"),
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 2 / 3 -
                          MediaQuery.of(context).size.height / 20 -
                          MediaQuery.of(context).size.height / 12,
                      left: MediaQuery.of(context).size.width / 4 +
                          MediaQuery.of(context).size.width / 2.5 -
                          MediaQuery.of(context).size.width / 3 +
                          MediaQuery.of(context).size.width / 3.3 -
                          MediaQuery.of(context).size.width / 6 +
                          MediaQuery.of(context).size.width / 8 +
                          10.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 7,
                        height: MediaQuery.of(context).size.height / 13,
                        child: InkWell(
                          onTap: () {
                            showMyDialog(context);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: MaterialThemeColors.dashboardCardColor,
                            elevation: 5.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout_outlined,
                                  size:
                                      MediaQuery.of(context).size.height / 25.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height / 120.0,
                                  ),
                                ),
                                Text(
                                  LangSelect(lang, "homepage", "logout"),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text(
      //           'Special Assignments',
      //           style: TextStyle(
      //               fontSize: IntegerConstants.appNameFontSize,
      //               color: Colors.white),
      //         ),
      //       ),
      //       ListTile(
      //         title: const Text(
      //           'Videos',
      //           style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
      //         ),
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => drawervideos()));
      //         },
      //       ),
      //       ListTile(
      //         title: const Text(
      //           'Questions',
      //           style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
      //         ),
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => drawerquestions()));
      //         },
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  //check for internet connectivity
  Future<void> initConnectivity() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status');
      return;
    }
  }

  /// Dialog for confirmation of logging out
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LangSelect(lang, "homepage", "attention")),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(LangSelect(lang, "homepage", "logoutwarning")),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(LangSelect(lang, "homepage", "no")),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(LangSelect(lang, "homepage", "yes")),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _isCheckSyncdata() async {
    final Database = StudentDetailsCRUD.instance;
    List<Map<String, dynamic>> _list = await Database.getAllRowsList();
    print(_list);
    if (_list.length != 0) {
      for (Map<String, dynamic> x in _list) {
        print(x);
        if (x["synced"] == "false") {
          try {
            _showNotification();
          } catch (e) {
            print(e.toString());
          }
        }
      }
    }
  }

  Widget _cardHomepage(String text, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: MaterialThemeColors.dashboardCardColor,
      elevation: 5.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30.0,
          ),
          Padding(
            padding: EdgeInsets.all(
              10.0,
            ),
          ),
          Text(
            LangSelect(lang, "homepage", text), //"takeattendance"
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ],
      ),
    );
  }

  void _showNotification() async {
    var androidDetails = AndroidNotificationDetails(
        "channelId", "Local Notification",
        channelDescription: LangSelect(lang, "homepage", "syncdata"),
        importance: Importance.high);
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails);
    await localNotification.show(1, LangSelect(lang, "homepage", "ekal"),
        LangSelect(lang, "homepage", "syncdata"), generalNotificationDetails);
  }
}

class _syncDatatoFirebase {
  final acharyaDatabase = AcharyaUserDetailsCRUD.instance;
  final studentsDatabase = StudentDetailsCRUD.instance;
  final allocatedContentDatabase = AllocatedContentCRUD.instance;
  final attendanceDatabase = AttendanceDetailsCRUD.instance;
  final questionBankDatabase = QuestionBankCRUD.instance;
  final allocatedQuizzesDatabase = QuizAllocationScheduleCRUD.instance;
  final quizDetailsDatabase = QuizQuestionsCRUD.instance;
  final videoProgressDatabase = VideoWatchedCRUD.instance;
  final quizOutcomeDatabase = QuizOutcomeCRUD.instance;
  final holidayDatabase = HolidayDetailsCRUD.instance;
  final appUseDatabase = AppUseCrudCRUD.instance;
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  _syncDatatoFirebase() {
    _issyncdata();
  }
  void _issyncdata() async {
    await addStudent();
    await addacharya();
    await addaddendance();
    await addallocatedcontent();
    await addquestioncreated();
    await addquizOutcome();
    await addQuizSchedule();
    await addAppUse();
    await addVideoWatched();
    await addholidayDetails();
  }

  Future<void> addStudent() async {
    List<Map<String, dynamic>> _list = await studentsDatabase.getAllRowsList();
    print(_list);
    if (_list.length != 0) {
      for (Map<String, dynamic> x in _list) {
        print(x);
        if (x["synced"] == "false") {
          try {
            DocumentReference ref =
                _fireStore.collection('Students').doc(x["id"]);
            await ref.set({
              'id': x["id"],
              'name': x["name"],
              'gat': x["gat"],
              'age': x["age"],
              'deviceUniqueId': x["deviceUniqueId"],
              'synced': "true",
              'dateOfSync': DateTime.now().toString().substring(0, 10),
            });
            print("Student Added");
            Map<String, dynamic> temp = Map.from(x);
            await temp.update("synced", (value) => "true");
            await temp.update("dateOfSync",
                (value) => DateTime.now().toString().substring(0, 10));
            await studentsDatabase.updateRowById(temp);
          } catch (e) {
            print(e.toString());
          }
        } else {
          print("you have already synced the data");
        }
      }
    }
  }

  Future<void> addacharya() async {
    List<Map<String, dynamic>> _list = await acharyaDatabase.getAllRowsList();
    print(_list);
    if (_list.length != 0) {
      for (Map<String, dynamic> x in _list) {
        print(x);
        if (x["synced"] == "false") {
          try {
            DocumentReference ref =
                _fireStore.collection('Acharya_data').doc(x["id"]);
            await ref.set({
              'id': x["id"],
              'name': x["name"],
              'email': x["email"],
              'password': x['password'],
              'mobileNumber': x["mobileNumber"],
              'synced': "true",
              'dateOfSync': DateTime.now().toString().substring(0, 10),
              'deviceUniqueId': x["deviceUniqueId"],
              'schoolid': x["schoolid"],
              'sanch_name': x["sanch_name"],
            });
            print("Updated");
            Map<String, dynamic> temp = Map.from(x);
            await temp.update("synced", (value) => "true");
            await temp.update("dateOfSync",
                (value) => DateTime.now().toString().substring(0, 10));
            await acharyaDatabase.updateRowById(temp);
          } catch (e) {
            print(e.toString());
          }
        } else {
          print("you have already synced the data");
        }
      }
    }
  }

  Future<void> addaddendance() async {
    List<Map<String, dynamic>> _list =
        await attendanceDatabase.getAllRowsList();
    print(_list);
    if (_list.length != 0) {
      for (Map<String, dynamic> x in _list) {
        print(x);
        if (x["synced"] == "false") {
          try {
            DocumentReference ref =
                _fireStore.collection('AttendanceData').doc(x["id"]);
            await ref.set({
              'id': x["id"],
              'date': x["date"],
              'Attendance': x["Attendance"],
              'deviceUniqueId': x["deviceUniqueId"],
              'synced': "true",
              'dateOfSync': DateTime.now().toString().substring(0, 10),
            });
            print("Updated");
            Map<String, dynamic> temp = Map.from(x);
            await temp.update("synced", (value) => "true");
            await temp.update("dateOfSync",
                (value) => DateTime.now().toString().substring(0, 10));
            await attendanceDatabase.updateRowById(temp);
          } catch (e) {
            print(e.toString());
          }
        } else {
          print("you have already synced the data");
        }
      }
    }
  }

  Future<void> addallocatedcontent() async {
    List<Map<String, dynamic>> _list =
        await allocatedContentDatabase.getAllRowsList();
    print(_list);
    if (_list.length != 0) {
      for (Map<String, dynamic> x in _list) {
        print(x);
        if (x["synced"] == "false") {
          try {
            DocumentReference ref =
                _fireStore.collection('Allocated_content').doc(x["docId"]);
            await ref.set({
              'id': x["id"],
              'contentName': x["contentName"],
              'contentGat': x["contentGat"],
              'contentSubject': x["contentSubject"],
              'contentTopic': x["contentTopic"],
              'time': x["time"],
              'deviceUniqueId': x["deviceUniqueId"],
              'synced': "true",
              'dateOfSync': DateTime.now().toString().substring(0, 10),
              'docId': x["docId"],
            });
            print("Content Allocated");
            Map<String, dynamic> temp = Map.from(x);
            await temp.update("synced", (value) => "true");
            await temp.update("dateOfSync",
                (value) => DateTime.now().toString().substring(0, 10));
            await allocatedContentDatabase.updateRowById(temp);
          } catch (e) {
            print(e.toString());
          }
        } else {
          print("you have already synced the data");
        }
      }
    }
  }

  Future<void> addquestioncreated() async {
    List<Map<String, dynamic>> _list =
        await questionBankDatabase.getAllRowsList();
    print(_list);
    if (_list.length != 0) {
      for (Map<String, dynamic> x in _list) {
        print(x);
        if (x["synced"] == "false") {
          try {
            DocumentReference ref =
                _fireStore.collection('Questions').doc(x["id"]);
            await ref.set({
              'id': x["id"],
              'gat': x["gat"],
              'sub': x["sub"],
              'topic': x["topic"],
              'question': x["question"],
              'a': x["a"],
              'b': x["b"],
              'c': x["c"],
              'd': x["d"],
              'ans': x["answer"],
              'deviceUniqueId': x["deviceUniqueId"],
              'synced': "true",
              'dateOfSync': DateTime.now().toString().substring(0, 10),
            });
            print("Question Added");
            Map<String, dynamic> temp = Map.from(x);
            await temp.update("synced", (value) => "true");
            await temp.update("dateOfSync",
                (value) => DateTime.now().toString().substring(0, 10));
            await questionBankDatabase.updateRowById(temp);
          } catch (e) {
            print(e.toString());
          }
        } else {
          print("you have already synced the data");
        }
      }
    }
  }

  Future<void> addquizOutcome() async {
    List<Map<String, dynamic>> _list =
        await quizOutcomeDatabase.getAllRowsList();
    print(_list);

    for (Map<String, dynamic> x in _list) {
      print(x);
      if (x["synced"] == "false") {
        try {
          DocumentReference ref =
              _fireStore.collection('QuizOutcome').doc(x["docID"]);
          await ref.set({
            'studentID': x["studentID"],
            'quizID': x["quizID"],
            'docID': x["docID"],
            'score': x["score"],
            'maxMarks': x["maxMarks"],
            'timeTaken': x["timeTaken"],
            'deviceUniqueId': x["deviceUniqueId"],
            'synced': "true",
            'dateOfSync': DateTime.now().toString().substring(0, 10),
          });
          print("Quiz Outcome Submitted");
          Map<String, dynamic> temp = Map.from(x);
          await temp.update("synced", (value) => "true");
          await temp.update("dateOfSync",
              (value) => DateTime.now().toString().substring(0, 10));
          await quizOutcomeDatabase.updateRowById(temp);
        } catch (e) {
          print(e.toString());
        }
      } else {
        print("you have already synced the data");
      }
    }
  }

  Future<void> addQuizSchedule() async {
    List<Map<String, dynamic>> _list =
        await QuizAllocationScheduleCRUD.instance.getAllRowsList();
    print(_list);
    if (_list.length != 0) {
      for (Map<String, dynamic> x in _list) {
        print(x);
        if (x["synced"] == "false") {
          try {
            DocumentReference ref =
                _fireStore.collection('QuizAllocationSchedule').doc(x["id"]);
            await ref.set({
              'id': x["id"],
              'gat': x["gat"],
              'date': x["date"],
              'time': x["time"],
              'deviceUniqueId': x["deviceUniqueId"],
              'synced': "true",
              'dateOfSync': x["dateOfSync"],
            });
            print("Quiz Allocated");
            Map<String, dynamic> temp = Map.from(x);
            await temp.update("synced", (value) => "true");
            await temp.update("dateOfSync",
                (value) => DateTime.now().toString().substring(0, 10));
            await QuizAllocationScheduleCRUD.instance.updateRowById(temp);
          } catch (e) {
            print(e.toString());
          }
        } else {
          print("you have already synced the data");
        }
      }
    }
  }

  Future<void> addAppUse() async {
    List<Map<String, dynamic>> _list = await appUseDatabase.getAllRowsList();
    print(_list);
    if (_list.length != 0) {
      for (Map<String, dynamic> x in _list) {
        print(x);
        if (x["synced"] == "false") {
          try {
            DocumentReference ref =
                _fireStore.collection('AppUse').doc(x["deviceUniqueId"]);
            await ref.set({
              'synced': "true",
              'dateOfSync': DateTime.now().toString().substring(0, 10),
              'deviceUniqueId': x["deviceUniqueId"],
              'appUseTime': x["appUseTime"],
            });
            print("Added");
            Map<String, dynamic> temp = Map.from(x);
            await temp.update("synced", (value) => "true");
            await temp.update("dateOfSync",
                (value) => DateTime.now().toString().substring(0, 10));
            await appUseDatabase.updateRowByIdtoFirebase(temp);
          } catch (e) {
            print(e.toString());
          }
        } else {
          print("you have already synced the data");
        }
      }
    }
  }

  Future<void> addVideoWatched() async {
    List<Map<String, dynamic>> _list =
        await videoProgressDatabase.getAllRowsList();
    print(_list);
    if (_list.length != 0) {
      for (Map<String, dynamic> x in _list) {
        print(x);
        if (x["synced"] == "false") {
          try {
            DocumentReference ref =
                _fireStore.collection('VideoWatchedData').doc(x["id"]);
            await ref.set({
              'id': x["id"],
              'Gat': x["Gat"],
              'Subject': x["Subject"],
              'Topic': x["Topic"],
              'totalWatchedTime': x["totalWatchedTime"],
              'total_video_length': x["total_video_length"],
              'deviceUniqueId': x["deviceUniqueId"],
              'synced': "true",
              'dateOfSync': DateTime.now().toString().substring(0, 10),
            });
            print("video watched data Added");
            Map<String, dynamic> temp = Map.from(x);
            await temp.update("synced", (value) => "true");
            await temp.update("dateOfSync",
                (value) => DateTime.now().toString().substring(0, 10));
            await videoProgressDatabase.updateRowById(temp);
          } catch (e) {
            print(e.toString());
          }
        } else {
          print("you have already synced the data");
        }
      }
    }
  }

  Future<void> addholidayDetails() async {
    List<Map<String, dynamic>> _list = await holidayDatabase.getAllRowsList();
    print(_list);
    if (_list.length != 0) {
      for (Map<String, dynamic> x in _list) {
        print(x);
        if (x["synced"] == "false") {
          try {
            DocumentReference ref =
                _fireStore.collection('Holiday_data').doc(x["id"]);
            await ref.set({
              'id': x["id"],
              'date': x["date"],
              'deviceUniqueId': x["deviceUniqueId"],
              'remark': x["remark"],
              'gat': x["gat"],
              'synced': "true",
              'dateOfSynced': DateTime.now().toString().substring(0, 10),
            });
            print("updated");
            Map<String, dynamic> temp = Map.from(x);
            await temp.update("synced", (value) => "true");
            await temp.update("dateOfSynced",
                (value) => DateTime.now().toString().substring(0, 10));
            await videoProgressDatabase.updateRowById(temp);
          } catch (e) {
            print(e.toString());
          }
        } else {
          print("you have already synced the data");
        }
      }
    }
  }
}
