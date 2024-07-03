import 'dart:typed_data';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/image_cropper.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/submit_button.dart';
import 'asign_qr_code_viewmodel.dart';
import 'comfirm_id_viewmodel.dart';
import 'dashboard_viewmodel.dart';
import 'driver_success_view.dart';
import 'face_capture.dart';

class AssignQrCode extends StackedView<AssignQrCodeViewModel> {
  const AssignQrCode({Key? key}) : super(key: key);





  @override
  Widget builder(BuildContext context, AssignQrCodeViewModel viewModel, Widget? child) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            verticalSpaceLarge,
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 80.0,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Your submission has been approved',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'When you assign a QR Code, the system will generate a unique code for the driver automatically.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpaceMassive,
            SubmitButton(
              isLoading: viewModel.isBusy,
              boldText: true,
              label: "ASSIGN A QR CODE",
              submit: () async {
                await viewModel.generateAndUploadQrCode('11223344');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DriverSuccessView(),
                  ),
                );
              },
              color: kcPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  AssignQrCodeViewModel viewModelBuilder(BuildContext context) => AssignQrCodeViewModel();
}
