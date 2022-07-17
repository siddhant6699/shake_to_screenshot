import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:shake_app/navigatorService.dart';

class ScreenShotHelpers {
  static Uint8List? imageFile;
  static final GlobalKey globalSSKey = GlobalKey();

  static void takeScreenshot() async {
    print(globalSSKey.currentContext);
    print(NavigatorService.navigatorKey.currentContext);
    var boundary =
        globalSSKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    print(boundary);
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      ScreenShotHelpers.imageFile = byteData.buffer.asUint8List();
      print("PNGBYTES SCREENSHOT: ${ScreenShotHelpers.imageFile}");
    }
  }
}
