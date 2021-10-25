// ignore_for_file: import_of_legacy_library_into_null_safe, use_key_in_widget_constructors, unused_import

import 'dart:async';

import 'package:arcore_plugin/arcore_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImageRecognitionApp extends StatefulWidget {
  @override
  _ImageRecognitionAppState createState() => _ImageRecognitionAppState();
}

class _ImageRecognitionAppState extends State<ImageRecognitionApp> {
  late String recongizedImage;
  late ArCoreViewController arCoreViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('ArCoreViewExample'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Center(
            child: ArCoreView(
          focusBox: Container(
            width: screenSize.width * 0.5,
            height: screenSize.width * 0.5,
            decoration: BoxDecoration(
                border: Border.all(width: 1, style: BorderStyle.solid)),
          ),
          width: screenSize.width,
          height: screenSize.height,
          onImageRecognized: _onImageRecognized,
          onArCoreViewCreated: _onArCoreViewCreated,
        )));
  }

  Future<void> _onArCoreViewCreated(ArCoreViewController controller) async {
    arCoreViewController = controller;
    await arCoreViewController.loadImgdbFromAssets(
        tempFilePath:
            '/data/user/0/com.peqas.arcorepluginexample/cache/image_database.imgdb');
    await controller.getArCoreView();
  }

  void _onImageRecognized(String recImgName) {
    debugPrint('image recongized: $recImgName');
    _showToast('image recongized: $recImgName');

    // you can pause the image recognition via arCoreViewController.pauseImageRecognition();
    // resume it via arCoreViewController.resumeImageRecognition();
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 20.0);
  }
}