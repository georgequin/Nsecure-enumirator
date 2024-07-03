import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:nsecure/app/app.router.dart';
import 'package:nsecure/core/network/loggingApiClient.dart';
import 'package:openapi/api.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class AssignQrCodeViewModel extends BaseViewModel {

  final log = getLogger("DashboardViewModel");
  bool get isBusy => busy(this);
  final NavigationService navigationService = locator<NavigationService>();
  String? selectedGender;
  Uint8List? idCardBytes;

  DateTime? selectedDate;

  void setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();  // Notify the UI to update the TextField
  }

  Future<void> init() async {

  }

  void updateIdCardByte(Uint8List? bytes) {
    idCardBytes = bytes;
    notifyListeners();
  }



  Future<void> refreshData() async {
    setBusy(true); // Use this to show loading indicator

    setBusy(false); // Reset loading indicator after data is refreshed
  }

  Future<void> uploadToCloudinary(String filePath) async {
    final cloudinaryUrl = 'https://api.cloudinary.com/v1_1/dqlwo7ux9/image/upload';
    final preset = 'ml_default'; // Replace with your preset name

    final file = File(filePath);
    final bytes = file.readAsBytesSync();

    final request = http.MultipartRequest('POST', Uri.parse(cloudinaryUrl))
      ..fields['upload_preset'] = preset
      ..files.add(http.MultipartFile.fromBytes('file', bytes, filename: 'qr_code.png'));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      print('Uploaded: $responseData');
    } else {
      print('Upload failed with status: ${response.statusCode}');
      response.stream.listen((value) {
        print('Upload resp: $value');
      });

    }
  }

  Future<void> generateAndUploadQrCode(String data) async {
    try {
      final qrValidationResult = QrValidator.validate(
        data: data,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.L,
      );
      if (qrValidationResult.status == QrValidationStatus.valid) {
        final qrCode = qrValidationResult.qrCode;
        final painter = QrPainter.withQr(
          qr: qrCode!,
          color: Color(0xFF000000),
          gapless: true,
        );

        final picData = await painter.toImageData(200);
        if (picData != null) {
          final buffer = picData.buffer.asUint8List();

          final tempDir = await getTemporaryDirectory();
          final filePath = '${tempDir.path}/qr_code.png';
          final file = File(filePath);
          await file.writeAsBytes(buffer);

          await uploadToCloudinary(filePath);
        } else {
          print("Failed to generate QR code image data.");
        }
      }
    } catch (e) {
      print(e);
    }
  }
}

