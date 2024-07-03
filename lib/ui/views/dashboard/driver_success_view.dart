import 'dart:typed_data';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.router.dart';
import '../../../utils/image_cropper.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/submit_button.dart';
import 'asign_qr_code_viewmodel.dart';
import 'comfirm_id_viewmodel.dart';
import 'dashboard_viewmodel.dart';
import 'driver_success_viewmodel.dart';
import 'face_capture.dart';

class DriverSuccessView extends StackedView<DriverSuccessViewModel> {
  const DriverSuccessView({Key? key}) : super(key: key);





  @override
  Widget builder(BuildContext context, DriverSuccessViewModel viewModel, Widget? child) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            verticalSpaceLarge,
            SvgPicture.asset(
              'assets/images/d_success.svg',
              height: 200,
            ),
            SizedBox(height: 24),
            Text(
              'Great Job!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Driver has been successfully registered and a QR Code has been generated.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            verticalSpaceMassive,
            SubmitButton(
              isLoading: viewModel.isBusy,
              boldText: true,
              label: "BACK TO HOME",
              submit: () async {
                viewModel.navigationService.clearStackAndShow(Routes.homeView);
              },
              color: kcPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  DriverSuccessViewModel viewModelBuilder(BuildContext context) => DriverSuccessViewModel();
}
