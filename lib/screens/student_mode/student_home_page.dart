import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/integer_constants.dart';
import 'package:iitpal_acharya_ui/constants/theme_colors.dart';
import 'package:iitpal_acharya_ui/database_crud/allocated_content_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/content_details_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/content_details_crud.dart';
import 'package:iitpal_acharya_ui/models/content_details_model.dart';
import 'package:iitpal_acharya_ui/screens/student_mode/video_view_screen.dart';
import 'package:path_provider/path_provider.dart';
import '../../firebase_crud/allocated_content_firebase_crud.dart';
import '../../models/allocated_content_model.dart';
import '../../services/lang_selection.dart';

class StudentHomePage extends StatefulWidget {
  final String gat;
  final String deviceUniqueId;
  final String lang;

  StudentHomePage(
      {required this.gat, required this.deviceUniqueId, required this.lang});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  // Databases
  final database = AllocatedContentCRUD.instance;
  final database1 = ContentDetailsCRUD.instance;
  // final contentsDatabase = ContentDetailsService();
  //final allocatedContentDatabase = AllocatedContentService();

  // External Storage
  String rebuiltPath = "";

  // Variables
  DateTime date = DateTime.now();

  // List<Map<String, dynamic>> allocatedContent = [];
  // late List<Map<String, dynamic>> _listOfAllocatedContent;
  List<AllocatedContent> allocatedContent = [];
  late List<Map<String, dynamic>> _listOfAllocatedContent;

  // List<Map<String, dynamic>> contentDetails = [];
  List<Map<String, dynamic>> contentDetails = [];
  List<String> ids = [];

  @override
  void initState() {
    super.initState();
    getExternalSdCardPath();
    // initialize list to be displayed
    _getAllRowsList();
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
          future: database.getAllocatedContentByGatAndDate(
              widget.gat, DateTime.now().toString().substring(0, 10)),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                !snapshot.hasData)
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  (_listOfAllocatedContent.length == 0)
                      ? Container(
                          padding: EdgeInsets.all(50.0),
                          child: Center(
                            child: Text(
                              LangSelect(widget.lang, "studentmode",
                                  "nocontentforgat"),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: MediaQuery.of(context).size.height / 20,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(16),
                                child: ListTile(
                                  leading: Text(
                                    'S. No.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 22.0),
                                  ),
                                  title: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    child: Row(
                                      children: [
                                        Text(
                                          LangSelect(widget.lang, "studentmode",
                                              "videoname"),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 22.0),
                                        ),
                                        Spacer(),
                                        Text(
                                          LangSelect(widget.lang, "studentmode",
                                              "gat"),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 22.0),
                                        ),
                                        Spacer(),
                                        Text(
                                          LangSelect(widget.lang, "studentmode",
                                              "subject"),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 22.0),
                                        ),
                                        Spacer(),
                                        Text(
                                          LangSelect(widget.lang, "studentmode",
                                              "topic"),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 22.0),
                                        ),
                                        Spacer(),
                                        Text(
                                          LangSelect(widget.lang, "studentmode",
                                              "watch"),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 22.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height:
                                    MediaQuery.of(context).size.height / 1.5,
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
                                                  style:
                                                      TextStyle(fontSize: 20.0),
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
                                                  style:
                                                      TextStyle(fontSize: 20.0),
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
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                              ),
                                              Spacer(),
                                              Center(
                                                child: OutlinedButton(
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
                                                    Icons.play_arrow,
                                                    color: MaterialThemeColors
                                                        .buttonColor,
                                                    size: 25.0,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                VideoPlayerState(
                                                                  videoId:
                                                                      contentDetails[
                                                                              index]
                                                                          [
                                                                          "id"],
                                                                  gat: contentDetails[
                                                                          index]
                                                                      ["gat"],
                                                                  deviceUniqueId:
                                                                      widget
                                                                          .deviceUniqueId,
                                                                  subject: contentDetails[
                                                                          index]
                                                                      ["sub"],
                                                                  videoPath: rebuiltPath +
                                                                      contentDetails[
                                                                              index]
                                                                          [
                                                                          "path"],
                                                                  topic: contentDetails[
                                                                          index]
                                                                      ["name"],
                                                                )));
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            );
          }),
    );
  }

  /// Method to get External SD Card Path
  void getExternalSdCardPath() async {
    List<Directory> extDirectories = (await getExternalStorageDirectories())!;
    List<String> dirs = extDirectories[0].toString().split('/');
    rebuiltPath = '/' + dirs[1] + '/' + dirs[2] + '/' + dirs[3] + '/';
    // rebuiltPath = "assets";
  }

  /// Method fro retrieving table data to a list
  Future<void> _getAllRowsList() async {
    // _listOfAllocatedContent = await database.getAllocatedContentByGat(widget.gat);
    _listOfAllocatedContent = await database.getAllocatedContentByGatAndDate(
        widget.gat, DateTime.now().toString().substring(0, 10));
    for (int i = 0; i < _listOfAllocatedContent.length; i++) {
      ids.add(_listOfAllocatedContent[i]["id"]!);
    }
    for (int i = 0; i < ids.length; i++) {
      var content = await database1.getVideoById(ids[i]);
      //var content = await database1.getContentById(ids[i]);
      for (var x in content) {
        contentDetails.add(x);
      }
    }
  }
}
