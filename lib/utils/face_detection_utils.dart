import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';

class FaceDetectionService {
  late CameraController controller;
  final FaceDetector faceDetector;
  Function(Face)? onFaceDetected;

  FaceDetectionService()
      : faceDetector = GoogleMlKit.vision.faceDetector(
      FaceDetectorOptions(

          performanceMode: FaceDetectorMode.accurate,
          enableLandmarks: true,
          enableClassification: true
      )
  );

  Future<void> initializeCamera(Function onCameraInitialized) async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front);

    controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
    );

    await controller.initialize();
    onCameraInitialized();
    startImageStream();
  }

  void startImageStream() {
    controller.startImageStream((image) async {
      final faces = await detectFaces(image);
      if (faces.isNotEmpty) {
        onFaceDetected?.call(faces.first);
      }
    });
  }

  Future<List<Face>> detectFaces(CameraImage image) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
    final InputImageRotation imageRotation = InputImageRotationValue.fromRawValue(controller.description.sensorOrientation) ?? InputImageRotation.rotation0deg;

    final inputImage = InputImage.fromBytes(
      bytes: bytes,
      // inputImageData:
      metadata: InputImageMetadata(
      size: imageSize,
      rotation: imageRotation,
      format: InputImageFormatValue.fromRawValue(image.format.raw) ?? InputImageFormat.nv21,
      bytesPerRow: image.planes[0].bytesPerRow,
    ),
    );

    return await faceDetector.processImage(inputImage);
  }

  void dispose() {
    controller.dispose();
    faceDetector.close();
  }
}
