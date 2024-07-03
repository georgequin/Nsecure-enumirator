import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:nsecure/app/app.router.dart';
import 'package:nsecure/core/network/loggingApiClient.dart';
import 'package:openapi/api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../core/network/api_manager.dart';
import '../../../core/network/interceptors.dart';
import '../../../core/utils/local_store_dir.dart';
import '../../../core/utils/local_stotage.dart';
import '../../../state.dart';
import '../../../utils/face_detection_utils.dart';
import '../../../utils/location_utils.dart';

class ConfirmIdViewModel extends BaseViewModel {

  final log = getLogger("DashboardViewModel");
  bool get isBusy => busy(this);

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
}

