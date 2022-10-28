import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoId;
  final String videoPath;
  final String gat;
  final String subject;
  final String topic;
  final String deviceUniqueId;

  VideoPlayerPage(
      {required this.videoId,
      required this.videoPath,
      required this.gat,
      required this.topic,
      required this.subject,
      required this.deviceUniqueId});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerPage> {
  // Variables
  late VideoPlayerController _videoPlayerController;
  late int videoCounter;

  // late String _videoId;
  int i = 0;
  DateTime startTime = DateTime.now();

  // Visibility Variables
  bool _visible = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    print(widget.videoPath);
    videoCounter = 0;
    // _videoId = widget.videoPath;
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
    _timer = Timer(
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
    super.dispose();
    _videoPlayerController.dispose();
    _timer.cancel();
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
                          aspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
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
                  duration: (_visible) ? Duration(milliseconds: 0) : Duration(seconds: 1),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      size: 30.0,
                      color: Colors.white,
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
                  duration: (_visible) ? Duration(milliseconds: 0) : Duration(seconds: 1),
                  child: IconButton(
                    icon: Icon(
                      (_videoPlayerController.value.isPlaying) ? Icons.pause : Icons.play_arrow,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    splashRadius: 40.0,
                    onPressed: () {
                      setState(() {
                        if (_visible) {
                          (_videoPlayerController.value.isPlaying) ? _videoPlayerController.pause() : _videoPlayerController.play();
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
                  duration: (_visible) ? Duration(milliseconds: 0) : Duration(seconds: 1),
                  child: IconButton(
                    icon: Icon(
                      (_videoPlayerController.value.volume == 0.0) ? Icons.volume_off_sharp : Icons.volume_up_sharp,
                      size: 40.0,
                      color: Colors.white,
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
                  duration: (_visible) ? Duration(milliseconds: 0) : Duration(seconds: 1),
                  child: Slider(
                    value: _videoPlayerController.value.volume,
                    min: 0.0,
                    max: 1.0,
                    divisions: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
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
                  duration: (_visible) ? Duration(milliseconds: 0) : Duration(seconds: 1),
                  child: Text(
                    "Time :   " +
                        (_videoPlayerController.value.position.inMinutes).toString() +
                        " m " +
                        (_videoPlayerController.value.position.inSeconds % 60).toString() +
                        " s / " +
                        (_videoPlayerController.value.duration.inMinutes).toString() +
                        " m " +
                        (_videoPlayerController.value.duration.inSeconds % 60).toString() +
                        " s",
                    style: TextStyle(
                      color: Colors.white,
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
                  duration: (_visible) ? Duration(milliseconds: 0) : Duration(seconds: 1),
                  child: Container(
                    height: 10.0,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Slider(
                      value: (_videoPlayerController.value.position.inMilliseconds == 0)
                          ? 0.0
                          : _videoPlayerController.value.position.inMilliseconds / _videoPlayerController.value.duration.inMilliseconds,
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
}
