import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../constants/color_constants.dart';
import '../second_page/second_page.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    var dataSource = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
    _controller = VideoPlayerController.network(dataSource)
      ..initialize().then((_) {
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(50, 50),
                  padding: const EdgeInsets.only(
                    right: 50,
                    left: 50,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  backgroundColor: ButtonColors.kPrimaryColor,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) {
                    return const SecondPage();
                  })));
                },
                child: Text(
                  OnboardTexts.data,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: ButtonColors.whiteColor,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
