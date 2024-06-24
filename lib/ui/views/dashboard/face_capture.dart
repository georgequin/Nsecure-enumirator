import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nsecure/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'dashboard_viewmodel.dart';

class FaceCaptureView extends StatelessWidget {
  const FaceCaptureView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      onModelReady: (viewModel) => viewModel.initializeCamera(),
      builder: (context, viewModel, child) {
        if (!viewModel.isCameraInitialized) {
          return Scaffold(
            appBar: AppBar(title: Text('Face Capture')),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(title: Text('Face Capture')),
          body: Stack(
            alignment: Alignment.center,
            children: [
              CameraPreview(viewModel.cameraController!),
              // Positioned(
              //   top: 50,
              //   child: Text(
              //     "Face Capture",
              //     style: TextStyle(
              //       fontSize: 22,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              Positioned(
                top: 70,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomPaint(
                          size: const Size(200, 300), // Adjust size as needed
                          painter: FaceOutlinePainter(),
                        ),
                        SizedBox(height: 20),
                        Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(

                              children: [
                                SvgPicture.asset(
                                  'assets/images/Arrows.svg',
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  "Place your head in the shape above",
                                  style: TextStyle(fontSize: 16, color: Colors.black54),
                                ),
                                Text(
                                  "Move your head from left to right",
                                  style: TextStyle(fontSize: 16, color: Colors.black54),
                                ),
                                Text(
                                  "Continue till the bar below is completed.",
                                  style: TextStyle(fontSize: 16, color: Colors.black54),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: 200,
                                  color: Colors.black,
                                  child: LinearProgressIndicator(
                                      value: viewModel.progress),
                                ),
                                verticalSpaceSmall
                              ],
                            )),

                      ],
                    ),
                  ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FaceOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    // Draw oval for face alignment
    Rect rect = Rect.fromCenter(
        center: size.center(Offset.zero),
        width: size.width,
        height: size.height);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
