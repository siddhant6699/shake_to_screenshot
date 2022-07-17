import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:shake_app/navigatorService.dart';
import 'package:shake_app/screenshotImage.dart';
import 'package:shake_app/screenshot_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ShakeDetector detector = ShakeDetector.autoStart(
    onPhoneShake: () async {
      ScreenShotHelpers.takeScreenshot();
    },
  );
  runApp(RepaintBoundary(
    key: ScreenShotHelpers.globalSSKey,
    child:
        MaterialApp(navigatorKey: NavigatorService.navigatorKey, home: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScreenShotHelpers.imageFile != null
            ? Container(
                height: 400,
                width: 400,
                color: Colors.amber,
                child: Image.memory(ScreenShotHelpers.imageFile!))
            : FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScreenshotScreen();
                  }));
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ScreenshotScreen();
          }));
        },
      ),
    );
  }

  // void _takeScreenshot() async {
  //   RenderRepaintBoundary boundary = ScreenShotHelpers.globalKey.currentContext!
  //       .findRenderObject() as RenderRepaintBoundary;

  //   ui.Image image = await boundary.toImage();
  //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   if (byteData != null) {
  //     ScreenShotHelpers.imageFile = byteData.buffer.asUint8List();
  //     setState(() {});
  //     print("PNGBYTES SCREENSHOT: ${ScreenShotHelpers.imageFile}");
  //   }
  // }
}

// class firstScreen extends StatefulWidget {
//   const firstScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<firstScreen> createState() => _firstScreenState();
// }

// class _firstScreenState extends State<firstScreen> {
//   @override
//   void initState() {
//     super.initState();
//     ShakeDetector detector = ShakeDetector.autoStart(
//       onPhoneShake: () async {
//         print("SIUUUUUUU");
//         // _takeScreenshot();
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("SCREENSHOT")),
//       body: SafeArea(
//           child: Center(
//               child: imageFile != null
//                   ? Container(
//                       height: 400,
//                       width: 400,
//                       child: Image.memory(imageFile!),
//                     )
//                   : const Text("Take my Screenshot"))),
//     );
//   }
// }
