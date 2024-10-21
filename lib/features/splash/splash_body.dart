import 'dart:async';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late Timer _timer;

  _goNext() => Navigator.pushReplacementNamed(context, Routes.homeScreen);

  _startDelay() {
    _timer = Timer(const Duration(seconds: 12), () => _goNext());
  }

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller
    _controller = VideoPlayerController.asset('assets/videos/intro.mp4')
      ..initialize().then((_) {
        setState(() {}); // Refresh when video is initialized
        _controller.play(); // Play the video
        _controller.setLooping(false); // Set looping to false
        _controller.setVolume(0.0); // Mute the video
      });
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose(); // Dispose the video controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _controller.value.isInitialized
          ? SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: VideoPlayer(_controller),
          ),
        ),
      )
          : const Center(child: CircularProgressIndicator()), // Show loader until video is ready
    );
  }
}
