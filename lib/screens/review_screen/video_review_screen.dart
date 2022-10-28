import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/database_crud/allocated_content_crud.dart';
import 'package:iitpal_acharya_ui/database_crud/video_watched_crud.dart';
// import 'package:iitpal_acharya_ui/database_crud/allocated_content_crud.dart';
// import 'package:iitpal_acharya_ui/database_crud/video_watched_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/allocated_content_firebase_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/video_watched_crud.dart';
import 'package:iitpal_acharya_ui/models/video_watched_model.dart';
import '../../constants/integer_constants.dart';
import '../../constants/theme_colors.dart';
import '../../models/chart_data.dart';
import '../../services/lang_selection.dart';

class VideoReview extends StatefulWidget {
  final String lang;
  const VideoReview({Key? key, required this.lang}) : super(key: key);

  @override
  State<VideoReview> createState() => _VideoReviewState();
}

class _VideoReviewState extends State<VideoReview> {
  // Databases
  /*final videoWatchedDB = VideoWatchedDataService();
  final allocatedContentDatabase = AllocatedContentService();*/
  final videoWatchedDB = VideoWatchedCRUD.instance;
  final allocatedContentDatabase = AllocatedContentCRUD.instance;

  // Variables
  String _gat = "शिशु गट";
  List<bool> _selectedGat = [true, false, false];
  late String dropDownValueMonth;
  List<ChartData> data = [];
  List<Map<String, dynamic>> list = [];
  List<VideoWatchedDetails> listOfSelectedVideos = [];
  List<int> texts = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];
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
  @override
  void initState() {
    super.initState();
    dropDownValueMonth =
        _month[DateTime.now().month - 1]; // initialize to current month
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(_gat),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          _gat = "शिशु गट";
                          _selectedGat = [true, false, false];
                          await getData(_gat);
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
                          _gat = "बाल गट-1";
                          _selectedGat = [false, true, false];
                          await getData(_gat);
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
                          _gat = "बाल गट-2";
                          _selectedGat = [false, false, true];
                          await getData(_gat);
                          setState(() {});
                        },
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.all(12.0),
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
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.black),
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: _month.map((String item2) {
                                return DropdownMenuItem(
                                  value: item2,
                                  child: Text(item2),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  dropDownValueMonth = newValue.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.8,
                      child: SingleChildScrollView(
                          child: Column(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          margin: EdgeInsets.all(16),
                          child: (list.length == 0)
                              ? Container(
                                  padding: EdgeInsets.all(
                                    50.0,
                                  ),
                                  child: Center(
                                    child: Text(
                                      LangSelect(
                                          widget.lang, "review", "nodata"),
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                )
                              : DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        LangSelect(
                                            widget.lang, "review", "videono"),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: IntegerConstants
                                                .dataColumnHeadingFontSize),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        LangSelect(
                                            widget.lang, "review", "topic"),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: IntegerConstants
                                                .dataColumnHeadingFontSize),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        LangSelect(
                                            widget.lang, "review", "progress"),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: IntegerConstants
                                                .dataColumnHeadingFontSize),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        LangSelect(
                                            widget.lang, "review", "duration"),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: IntegerConstants
                                                .dataColumnHeadingFontSize),
                                      ),
                                    )
                                  ],
                                  rows: <DataRow>[
                                    for (int i = 0; i < list.length; i++)
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(Text(
                                            '${i + 1}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: IntegerConstants
                                                    .listItemVideosFontSize),
                                          )),
                                          DataCell(
                                            Text(
                                              list[i]['Topic'],
                                              style: TextStyle(
                                                  fontSize: IntegerConstants
                                                      .listItemVideosFontSize),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          DataCell(Text(
                                            ((int.parse(list[i]['totalWatchedTime']) /
                                                            (int.parse(list[i][
                                                                'total_video_length']))) *
                                                        100)
                                                    .toStringAsFixed(0) +
                                                ' %',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: ((int.parse((list[i][
                                                            'totalWatchedTime']))) ==
                                                        (int.parse((list[i][
                                                            'total_video_length']))))
                                                    ? Colors.green
                                                    : Colors.grey[600],
                                                fontSize: IntegerConstants
                                                    .listItemVideosFontSize),
                                          )),
                                          DataCell(
                                            Text(
                                              (int.parse(list[i][
                                                              'total_video_length']) ~/
                                                          60)
                                                      .toString() +
                                                  ' mins ' +
                                                  (int.parse(list[i][
                                                              'total_video_length']) %
                                                          60)
                                                      .toStringAsFixed(0) +
                                                  ' secs',
                                              style: TextStyle(
                                                  fontSize: IntegerConstants
                                                      .listItemVideosFontSize),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                        ),
                      ])),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
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

  /// Method for updating local graph data
  void updateGraphData(String id) async {
    for (var x in data) {
      print("${x.x} ${x.y}");
    }
  }

  /// Method for retrieving data to graph
  Future<void> getData(String gat) async {
    list.clear();
    List<Map<String, dynamic>> list1 = await allocatedContentDatabase
        .getAllocatedContentByGatAndMonth(gat, strToMonth(dropDownValueMonth));
    print(list1);
    List<String> contentId = [];
    for (var x in list1) {
      contentId.add(x['id']);
    }
    List<Map<String, dynamic>> _tempList =
        await videoWatchedDB.getVideoWatchedByGat(gat);
    for (var x in _tempList) {
      if (contentId.contains(x['id'])) list.add(x);
    }
  }
}
