import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iitpal_acharya_ui/database_crud/video_watched_crud.dart';
import 'package:iitpal_acharya_ui/firebase_crud/video_watched_crud.dart';
import 'package:iitpal_acharya_ui/models/video_watched_model.dart';
import 'package:iitpal_acharya_ui/screens/unique_key_device.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerState extends StatefulWidget {
  final String videoId;
  final String videoPath;
  final String gat;
  final String subject;
  final String topic;
  final String deviceUniqueId;

  VideoPlayerState(
      {required this.videoId,
      required this.videoPath,
      required this.gat,
      required this.topic,
      required this.subject,
      required this.deviceUniqueId});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerState> {
  // Databases
  //final database = VideoWatchedDataService();
  final database = VideoWatchedCRUD.instance;

  // Variables
  late VideoPlayerController _videoPlayerController;
  late int videoCounter; // To take a note of portion of the video watched
  late String _watchedTime;
  late String _currentPlayTime;
  late String _totalVideoLength;
  late List<Map<String, dynamic>> _listOfVideoWatched;
  late String _deviceUniqueId;
  late Timer _videoWatchedTimer;
  String rebuiltPath = "";

  // Visibility Variables
  bool _visible = true;
  late Timer _visibilityTimer;

  @override
  void initState() {
    super.initState();
    addVideoWatchedById();
    getExternalSdCardPath();
    _videoWatchedTimer = Timer.periodic(
        Duration(seconds: 5), (Timer t) => updateTime()); // Start Timer
    getid(); // Get device's unique id
    videoCounter = 0;
    // initialize the video player with the required video and add listeners to it
    _videoPlayerController = VideoPlayerController.file(File(widget.videoPath))
      ..addListener(() {
        if (_videoPlayerController.value.isPlaying) {
          setState(() {});
        }
      })
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.pause();
      });
    _videoPlayerController.addListener(() {
      videoCounter = _videoPlayerController.value.position.inSeconds;
      setState(() {});
    });
    _visibilityTimer = Timer(
      Duration(seconds: 3),
      () => {
        setState(() {
          _visible = false;
        }),
      },
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _videoWatchedTimer.cancel();
    _visibilityTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          setState(() {
            _visible = true;
          });
          await Future.delayed(Duration(seconds: 3));
          setState(() {
            _visible = false;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0.0,
                left: 0.0,
                child: _videoPlayerController.value.isInitialized
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.topCenter,
                        child: AspectRatio(
                          aspectRatio: MediaQuery.of(context).size.width /
                              MediaQuery.of(context).size.height,
                          child: VideoPlayer(_videoPlayerController),
                        ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black,
                        child: Center(
                          child: CircularProgressIndicator(),
                        )),
              ),
              Positioned(
                top: 50.0,
                left: 50.0,
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: (_visible)
                      ? Duration(milliseconds: 0)
                      : Duration(seconds: 1),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      size: 30.0,
                      color: Colors.yellowAccent,
                    ),
                    splashRadius: 40.0,
                    onPressed: () {
                      if (_visible) Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 35.0,
                left: MediaQuery.of(context).size.width * 0.2 / 2.4 + 30.0,
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: (_visible)
                      ? Duration(milliseconds: 0)
                      : Duration(seconds: 1),
                  child: IconButton(
                    icon: Icon(
                      (_videoPlayerController.value.isPlaying)
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 40.0,
                      color: Colors.yellowAccent,
                    ),
                    splashRadius: 40.0,
                    onPressed: () {
                      setState(() {
                        if (_visible) {
                          (_videoPlayerController.value.isPlaying)
                              ? _videoPlayerController.pause()
                              : _videoPlayerController.play();
                        }
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 35.0,
                left: MediaQuery.of(context).size.width * 0.2 / 2.4 + 100.0,
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: (_visible)
                      ? Duration(milliseconds: 0)
                      : Duration(seconds: 1),
                  child: IconButton(
                    icon: Icon(
                      (_videoPlayerController.value.volume == 0.0)
                          ? Icons.volume_off_sharp
                          : Icons.volume_up_sharp,
                      size: 40.0,
                      color: Colors.yellowAccent,
                    ),
                    splashRadius: 40.0,
                    onPressed: () {
                      setState(() {
                        if (_visible) {
                          (_videoPlayerController.value.volume == 0.0)
                              ? _videoPlayerController.setVolume(1.0)
                              : _videoPlayerController.setVolume(0.0);
                        }
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 30.0,
                left: MediaQuery.of(context).size.width * 0.2 / 2.4 + 150.0,
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: (_visible)
                      ? Duration(milliseconds: 0)
                      : Duration(seconds: 1),
                  child: Slider(
                    value: _videoPlayerController.value.volume,
                    min: 0.0,
                    max: 1.0,
                    divisions: 100,
                    activeColor: Colors.yellowAccent,
                    inactiveColor: Colors.white,
                    onChanged: (double value) {
                      setState(() {
                        _visible = true;
                        _videoPlayerController.setVolume(value);
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 40.0,
                right: MediaQuery.of(context).size.width * 0.2 / 2.4 + 30.0,
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: (_visible)
                      ? Duration(milliseconds: 0)
                      : Duration(seconds: 1),
                  child: Text(
                    "Time :   " +
                        (_videoPlayerController.value.position.inMinutes)
                            .toString() +
                        " m " +
                        (_videoPlayerController.value.position.inSeconds % 60)
                            .toString() +
                        " s / " +
                        (_videoPlayerController.value.duration.inMinutes)
                            .toString() +
                        " m " +
                        (_videoPlayerController.value.duration.inSeconds % 60)
                            .toString() +
                        " s",
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 100.0,
                left: MediaQuery.of(context).size.width * 0.2 / 2.4,
                child: AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: (_visible)
                      ? Duration(milliseconds: 0)
                      : Duration(seconds: 1),
                  child: Container(
                    height: 10.0,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Slider(
                      value: (_videoPlayerController
                                  .value.position.inMilliseconds ==
                              0)
                          ? 0.0
                          : _videoPlayerController
                                  .value.position.inMilliseconds /
                              _videoPlayerController
                                  .value.duration.inMilliseconds,
                      onChanged: (double value) {},
                      activeColor: Colors.red,
                      inactiveColor: Colors.white,
                      thumbColor: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Method for getting device's unique id
  Future<void> getid() async {
    _deviceUniqueId = (await getId())!;
  }

  //method if database is empty for this video id
  Future<void> addVideoWatchedById() async {
    _listOfVideoWatched =
        await database.getVideoWatchedByVideoId(widget.videoId);
    if (_listOfVideoWatched.length == 0) {
      await database.insertNewRaw(VideoWatchedDetails(
          synced: 'false',
          dateOfSync: '',
          Gat: widget.gat,
          Subject: widget.subject,
          Topic: widget.topic,
          totalWatchedTime: '0',
          total_video_length: '30',
          id: widget.videoId,
          deviceUniqueId: widget.deviceUniqueId));
    }
  }

  /// Method for updating watch time in database
  Future<void> updateTime() async {
    _listOfVideoWatched =
        await database.getVideoWatchedByVideoId(widget.videoId);
    print(_listOfVideoWatched);
    _currentPlayTime = await _listOfVideoWatched[0]["totalWatchedTime"];
    _totalVideoLength = await _listOfVideoWatched[0]["total_video_length"];
    if (int.parse(_currentPlayTime) >= int.parse(_totalVideoLength)) {
      setState(() {
        _videoWatchedTimer.cancel();
      });
    }
    _totalVideoLength =
        _videoPlayerController.value.duration.inSeconds.toString();
    int usageTime = _videoPlayerController.value.position.inSeconds;
    if (usageTime >= int.parse(_currentPlayTime)) {
      _currentPlayTime = usageTime.toString();
    }
    _watchedTime = _currentPlayTime;
    print("watch time updated to $_currentPlayTime");
    if (int.parse(_watchedTime) <= int.parse(_totalVideoLength)) {
      VideoWatchedDetails videoWatchedDetails = VideoWatchedDetails(
          id: widget.videoId,
          Subject: widget.subject,
          Topic: widget.topic,
          totalWatchedTime: _watchedTime,
          total_video_length: _totalVideoLength,
          Gat: widget.gat,
          deviceUniqueId: _deviceUniqueId,
          synced: 'false',
          dateOfSync: DateTime.now().toString().substring(0, 10));
      await database.updateRowById(videoWatchedDetails.toMap());
      _listOfVideoWatched =
          await database.getVideoWatchedByVideoId(widget.videoId);
    }
  }

  void getExternalSdCardPath() async {
    List<Directory> extDirectories = (await getExternalStorageDirectories())!;
    List<String> dirs = extDirectories[0].toString().split('/');
    rebuiltPath = '/' + dirs[1] + '/' + dirs[2] + '/' + dirs[3] + '/';
    // rebuiltPath = "assets";
  }
}
