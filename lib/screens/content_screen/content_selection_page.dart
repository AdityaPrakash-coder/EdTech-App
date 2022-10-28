import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/integer_constants.dart';
import 'package:iitpal_acharya_ui/constants/theme_colors.dart';
import 'package:iitpal_acharya_ui/database_crud/content_details_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/allocated_content_firebase_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/content_details_crud.dart';
import 'package:iitpal_acharya_ui/models/content_details_model.dart';
import 'package:iitpal_acharya_ui/screens/content_screen/content_video_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../database_crud/allocated_content_crud.dart';
import '../../models/allocated_content_model.dart';
import '../../services/lang_selection.dart';
import '../unique_key_device.dart';
import '../../constants/topics.dart';

class ContentSelectionPage extends StatefulWidget {
  final String lang;
  ContentSelectionPage({required this.lang});
  @override
  ContentSelectionPageState createState() => ContentSelectionPageState();
}

class ContentSelectionPageState extends State<ContentSelectionPage> {
  // External Storage
  String rebuiltPath = "";

  // Variables
  late String time;
  late String _deviceUniqueId;
  DateTime _selectedDate = DateTime.now();

  late List<Map<String, dynamic>> listOfVideos;
  List<Map<String, dynamic>> listOfSelectedVideos = [];
  //late List<ContentDetails> listOfVideos;
  //List<ContentDetails> listOfSelectedVideos = [];
  Map<String, dynamic> _items = Topics.items;
  String dropDownValueGat = Gats.shishu, dropDownValueTopic = "Select Topic";

  // Databases
  final contentsDatabase = ContentDetailsCRUD.instance;
  final allocatedContentDatabase = AllocatedContentCRUD.instance;
  //final contentsDatabase = ContentDetailsService();
  //final allocatedContentDatabase = AllocatedContentService();

  @override
  void initState() {
    super.initState();
    getid();
    getAllRowsList();
    getExternalSdCardPath();
    time = DateTime.now().toString().substring(0, 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
          LangSelect(widget.lang, "allocatecontent", "allocatecontent"),
          style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
        ),
      ),
      body: FutureBuilder(
          future: contentsDatabase.getVideosByGat(dropDownValueGat),
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
                  children: [
                    Row(
                      children: [
                        Column(children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  LangSelect(widget.lang, "allocatecontent",
                                      "selectgat"),
                                  style: TextStyle(fontSize: 25.0),
                                ),
                                trailing: DropdownButton(
                                  value: dropDownValueGat,
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items:
                                      _items.keys.toList().map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: TextStyle(fontSize: 24),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      listOfSelectedVideos.clear();
                                      dropDownValueGat = newValue.toString();
                                      dropDownValueTopic = "Select Topic";
                                      getListOfVideosByGatAndTopic(
                                          dropDownValueGat, dropDownValueTopic);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 20.0)),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  LangSelect(widget.lang, "allocatecontent",
                                      "selecttopic"),
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                                trailing: DropdownButton(
                                  value: dropDownValueTopic,
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: _items[dropDownValueGat]
                                      .map<DropdownMenuItem<String>>(
                                          (String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Text(
                                          items,
                                          style: TextStyle(
                                            fontSize: 22.0,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropDownValueTopic = newValue.toString();
                                      getListOfVideosByGatAndTopic(
                                          dropDownValueGat, dropDownValueTopic);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 40.0)),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 500.0,
                            child: Column(
                              children: [
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(20.0),
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15.0),
                                          topLeft: Radius.circular(15.0)),
                                      color: MaterialThemeColors.buttonColor,
                                    ),
                                    child: Text(
                                      LangSelect(widget.lang, "allocatecontent",
                                          "selectvideos"),
                                      style: TextStyle(
                                          fontSize: 26, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: ListView.builder(
                                    itemCount: listOfVideos.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        leading: IconButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  VideoPlayerPage(
                                                videoId: listOfVideos[index]
                                                    ["id"],
                                                gat: listOfVideos[index]["gat"],
                                                deviceUniqueId: _deviceUniqueId,
                                                subject: listOfVideos[index]
                                                    ["sub"],
                                                topic: listOfVideos[index]
                                                    ["name"],
                                                videoPath: rebuiltPath +
                                                    listOfVideos[index]["path"],
                                              ),
                                            ));
                                            /*Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => VideoPlayerPage(
                                                videoId: listOfVideos[index].id,
                                                gat: listOfVideos[index].gat,
                                                deviceUniqueId: _deviceUniqueId,
                                                subject: listOfVideos[index].subject,
                                                topic: listOfVideos[index].videoName,
                                                videoPath: rebuiltPath+listOfVideos[index].videoPath,
                                              ),
                                            ));*/
                                          },
                                          icon: Icon(
                                            Icons.play_arrow_rounded,
                                            size: 35.0,
                                          ),
                                        ),
                                        title: Text(
                                          listOfVideos[index]["name"],
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            addVideoToSelected(
                                                listOfVideos[index]);
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Container(
                                padding: EdgeInsets.all(18.0),
                                width: MediaQuery.of(context).size.width / 2.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15.0),
                                      topLeft: Radius.circular(15.0)),
                                  color: MaterialThemeColors.buttonColor,
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Text(
                                        LangSelect(
                                            widget.lang,
                                            "allocatecontent",
                                            "selectedvideos"),
                                        style: TextStyle(
                                            fontSize: 26, color: Colors.white),
                                      ),
                                      Spacer(),
                                      (listOfSelectedVideos.length == 0)
                                          ? SizedBox(
                                              width: 45.0,
                                              height: 45.0,
                                            )
                                          : IconButton(
                                              iconSize: 30.0,
                                              color: Colors.white,
                                              icon: Icon(
                                                Icons.cancel,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  listOfSelectedVideos.clear();
                                                });
                                              },
                                            ),
                                      (listOfSelectedVideos.length == 0)
                                          ? SizedBox(
                                              width: 45.0,
                                              height: 45.0,
                                            )
                                          : IconButton(
                                              iconSize: 30.0,
                                              color: Colors.white,
                                              icon: Icon(
                                                Icons.done,
                                              ),
                                              onPressed: () =>
                                                  dateAllocationDialogBox(
                                                      context),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 1.22,
                              child: ListView.builder(
                                itemCount: listOfSelectedVideos.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                      leading: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            deleteFromSelected(
                                                listOfSelectedVideos[index]);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                          size: 30.0,
                                        ),
                                      ),
                                      title: Text(
                                        listOfSelectedVideos[index]["name"],
                                        style: TextStyle(
                                          fontSize: 22,
                                        ),
                                      ));
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

  /// Method for retrieving table data to a list
  void getAllRowsList() async {
    // listOfVideos = await contentsDatabase.getContentByGat(dropDownValueGat);
    listOfVideos = await contentsDatabase.getVideosByGat(dropDownValueGat);
  }

  /// Method to get empty list
  Future<List<Map<String, dynamic>>> getEmptyList() async {
    return [];
  }

  /// Method to get list of Videos by Gat And Topic
  void getListOfVideosByGatAndTopic(String gat, String topic) async {
    if (gat != "Select Gat" && topic == "Select Topic") {
      listOfVideos = await contentsDatabase.getVideosByGat(gat);
    } else if (gat != "Select Gat" && topic != "Select Topic") {
      listOfVideos = await contentsDatabase.getVideosByGatSubject(gat, topic);
    }
    print(listOfVideos);
    setState(() {});
  }

  /// Method to add Video to List of Selected Videos
  /* void addVideoToSelected(ContentDetails ques) {
    for (ContentDetails x in listOfSelectedVideos) {
      if (x.id == ques.id) return;
    }
    listOfSelectedVideos.add(ques);
    print(listOfSelectedVideos);
  }*/
  void addVideoToSelected(Map<String, dynamic> ques) {
    for (Map<String, dynamic> x in listOfSelectedVideos) {
      if (x['id'] == ques['id']) return;
    }
    listOfSelectedVideos.add(ques);
    print(listOfSelectedVideos);
  }

  /// Method to Remove Video from List of Selected Video
  void deleteFromSelected(ques) {
    listOfSelectedVideos.remove(ques);
  }

  /// Method to get device unique id
  void getid() async {
    _deviceUniqueId = (await getId())!;
  }

  /// Dialog box for selecting date for the allocated Content
  void dateAllocationDialogBox(BuildContext context) {
    var alertDialog = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LangSelect(widget.lang, "allocatecontent", "dateofcontent"),
            style:
                TextStyle(fontSize: IntegerConstants.alertDialogTextFontSize),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(20.0)),
                  Text(
                    LangSelect(widget.lang, "allocatecontent", "selectdate"),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 100.0,
                    width: 250.0,
                    child: ScrollDatePicker(
                      selectedDate: _selectedDate,
                      minimumDate: DateTime.now(),
                      maximumDate: DateTime(
                          DateTime.now().year, DateTime.now().month + 1),
                      style: DatePickerStyle(
                        selectedTextStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        textStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      onDateTimeChanged: (DateTime value) {
                        setState(() {
                          _selectedDate = value;
                          time = value.toString().substring(0, 10);
                        });
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(20.0)),
                ],
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: MaterialThemeColors.buttonColor,
                          fontSize: IntegerConstants.alertDialogButtonSize),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text(
                      "OK",
                      style: TextStyle(
                          color: MaterialThemeColors.buttonColor,
                          fontSize: IntegerConstants.alertDialogButtonSize),
                    ),
                    onPressed: () async {
                      print(time);
                      for (int x = 0; x < listOfSelectedVideos.length; x++) {
                        await allocatedContentDatabase.insertNewContent(
                            AllocatedContent(
                                id: listOfSelectedVideos[x]["id"],
                                contentName: listOfSelectedVideos[x]["name"],
                                contentGat: listOfSelectedVideos[x]["gat"],
                                contentSubject: listOfSelectedVideos[x]["sub"],
                                contentTopic: listOfSelectedVideos[x]["topic"],
                                time: time,
                                synced: 'false',
                                dateOfSync:
                                    DateTime.now().toString().substring(0, 10),
                                deviceUniqueId: _deviceUniqueId,
                                docId: UniqueKey().toString().substring(2, 7) +
                                    _deviceUniqueId));
                      }

                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.black38,
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 5,
                            left: MediaQuery.of(context).size.width / 4,
                            right: MediaQuery.of(context).size.width / 4),
                        content: Text(
                          "The content has been allocated successfully",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize:
                                  IntegerConstants.snackBarMessageFontSize),
                        ),
                      ));
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
    if (listOfSelectedVideos.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black38,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 5,
            left: MediaQuery.of(context).size.width / 4,
            right: MediaQuery.of(context).size.width / 4),
        content: Text(
          "Please select at least one video",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: IntegerConstants.snackBarMessageFontSize),
        ),
      ));
    } else {
      showDialog(
          context: context, builder: (BuildContext context) => alertDialog);
    }
  }
}
