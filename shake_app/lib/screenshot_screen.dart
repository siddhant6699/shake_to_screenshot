import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shake_app/screenshotImage.dart';

class ScreenshotScreen extends StatefulWidget {
  const ScreenshotScreen({Key? key}) : super(key: key);

  @override
  State<ScreenshotScreen> createState() => _ScreenshotScreenState();
}

class _ScreenshotScreenState extends State<ScreenshotScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SCREENSHOT")),
      body: SafeArea(
          child: ScreenShotHelpers.imageFile != null
              ? Container(
                  height: 400,
                  width: 400,
                  color: Colors.amber,
                  child: Image.memory(ScreenShotHelpers.imageFile!))
              : const Center(child: Text("PATHETIIC CODING"))),
    );
  }
}
