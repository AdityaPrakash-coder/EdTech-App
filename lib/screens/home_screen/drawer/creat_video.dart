
import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/constants/integer_constants.dart';
import 'package:iitpal_acharya_ui/constants/theme_colors.dart';
import 'package:iitpal_acharya_ui/firebase_crud/youtube_firebase_crud.dart';
import 'package:iitpal_acharya_ui/screens/home_screen/drawer/youtube_video.dart';


class UploadVideoPage extends StatefulWidget {

  @override
  UploadVideoPageState createState() => UploadVideoPageState();
}

class UploadVideoPageState extends State<UploadVideoPage> {
  // Controllers
  TextEditingController videoIdController = TextEditingController(), videotopicController = TextEditingController();
  late List<Map<String, dynamic>> _listOfVideos;

  @override
  void initState() {
    super.initState();
    getVideoList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialThemeColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Youtube Vidoes",
          style: TextStyle(fontSize: IntegerConstants.appNameFontSize),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: _showVideoList()
        ),
      ),
    );
  }

  /// Method to get device unique id




  Widget _showVideoList() {
    return FutureBuilder(
        future: YoutubeVideoCRUD().getVideos(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "List Of All Videos",
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    height: MediaQuery.of(context).size.height / 1.3,
                    padding: EdgeInsets.all(30.0),
                    child: _listOfVideos.length == 0
                        ? Container(
                      child: Center(
                        child: Text(
                          "No Videos upload Yet",
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    )
                        : ListView.builder(
                      itemCount: _listOfVideos.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: MaterialThemeColors.cardBackgroundColor,
                          child: ListTile(
                            leading: Text(
                              "${index + 1}",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            title: Row(
                              children: [
                                Spacer(),
                                Text(
                                  "topic :  " + _listOfVideos[index]["topic"],
                                  style: TextStyle(
                                    fontSize: IntegerConstants.listItemFontSize2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
                                ),
                                Text(
                                  "Date :  " + _listOfVideos[index]["dateofSync"],
                                  style: TextStyle(
                                    fontSize: IntegerConstants.listItemFontSize2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
                                ),
                                IconButton(
                                  onPressed: () async {

                                  Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            YoutubeVideo(_listOfVideos[index]["videoid"])));
                                    //showDeleteAlertDialogBox(context, index);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.play_arrow),
                                ),
                                //Spacer(),
                              ],
                            ),

                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// Method to get list of quizzes to give
  void getVideoList() async {
    _listOfVideos = await YoutubeVideoCRUD().getVideos();

  }

  /// Method to delete a quiz from database
  /*Future<void> showDeleteAlertDialogBox(context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              'Delete a Video',
              style: TextStyle(fontSize: IntegerConstants.alertDialogHeadingFontSize),
            ),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Are you sure you want to delete this Uploaede Video ?',
                  style: TextStyle(fontSize: 22.0),
                ),
              );
            }),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    primary: MaterialThemeColors.buttonColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "No",
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  primary: MaterialThemeColors.buttonColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
                onPressed: () async {
                  await YoutubeVideoCRUD().deleteVideoById(_listOfVideos[index]['id']);
                  _listOfVideos.clear();
                  _listOfVideos=await YoutubeVideoCRUD().getVideos();
                  setState(() {});
                  Navigator.of(context).pop();

                },
              ),
            ],
          );
        });
  }*/
}
