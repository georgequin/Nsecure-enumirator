import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:nsecure/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';

class FaceCaptureViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final log = getLogger("FaceCaptureViewModel");

  bool isFaceCaptureReady = false;
  String? capturedImagePath;

  CameraController? cameraController;
  static List<CameraDescription> _cameras = [];
  bool isCameraInitialized = false;
  double progress = 0.0;
  final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
  ));

  void saveCapturedImage(String imagePath) {
    capturedImagePath = imagePath;
    print('captured image path is: $capturedImagePath');
    _navigationService.navigateToConfirmIdView();
    notifyListeners();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    cameraController = CameraController(cameras[1], ResolutionPreset.high);
    await cameraController!.initialize();
    isCameraInitialized = true;
    notifyListeners();

    cameraController!.startImageStream((image) {
      print('started streaming images');
      processCameraImage(image);
    });
  }

  void processCameraImage(CameraImage image) async {
    print('Processing camera image...');

    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final InputImage inputImage = InputImage.fromBytes(
      bytes: bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: InputImageRotation.rotation90deg,
        bytesPerRow: image.planes.first.bytesPerRow,
        format: InputImageFormatValue.fromRawValue(image.format.raw) ?? InputImageFormat.nv21,
      ),
    );

    print('input image is: ${inputImage}');
    final List<Face> faces = await faceDetector.processImage(inputImage);
    if (faces.isNotEmpty) {
      print('found a face: ${faces.first}');
      final face = faces.first;

      final faceAlignedCorrectly = _isFaceAligned(face);

      if (faceAlignedCorrectly) {
        progress += 0.5;
        if (progress >= 1.0) {
          progress = 1.0;
          // Fluttertoast.showToast(msg: 'liveness passed');
          captureImage();
        }
      } else {
        progress = 0.0;
      }
      notifyListeners();
    } else {
      print('no face found $faces');
      Future.delayed(Duration(seconds: 10), () {
        print("Action performed after 3 seconds");
        // Fluttertoast.showToast(msg: 'liveness passed!', toastLength: Toast.LENGTH_SHORT);
        captureImage();
      });
    }
  }

  bool _isFaceAligned(Face face) {
    return true;
  }

  void captureImage() async {
    try {
      final image = await cameraController!.takePicture();
      saveCapturedImage(image.path);
      await cameraController?.stopImageStream();
      await cameraController?.dispose();
      cameraController = null;
    } catch (e) {
      print("Error capturing image: $e");
    }
  }
}
