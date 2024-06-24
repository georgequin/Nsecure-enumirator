import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsecure/ui/views/dashboard/verificationrequirement.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/submit_button.dart';
import '../../components/text_field_widget.dart';
import 'dashboard_viewmodel.dart';

class VerifyDriver extends StackedView<DashboardViewModel>  {
  const VerifyDriver({super.key});


  @override
  void initState() {}

  @override
  void dispose() {}

  @override
  Widget builder(
      BuildContext context,
      DashboardViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        title: Text(
          'Verify a Driver',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 120,
      ),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          verticalSpaceMedium,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), // Add horizontal padding if needed
            child: Text(
              'Enter the driver’s serial key and click proceed to start the verification process',
              textAlign: TextAlign.center,  // Centers text horizontally
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  color: kcPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          verticalSpaceMedium,
          TextFieldWidget(
            hint: "Serial key",
            controller: viewModel.serialNumberController,
            validator: (value) {
              if (value.isEmpty) {
                return 'required';
              }
              if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                  .hasMatch(value)) {
                return 'Invalid Serial key address';
              }
              return null; // Return null to indicate no validation error
            },
          ),
          Spacer(),
          SubmitButton(
            isLoading: viewModel.isBusy,
            label: "PROCEED",
            submit: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerificationRequirement(),
                  ),
              );
            },
            color: kcPrimaryColor,
            boldText: true,
          ),
        ],
      )),

    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context)
  => DashboardViewModel();
}
