import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsecure/ui/common/app_colors.dart';
import 'package:nsecure/ui/views/dashboard/register_driver.dart';
import 'package:stacked/stacked.dart';

import '../../components/submit_button.dart';
import 'dashboard_viewmodel.dart';

class VerificationRequirement extends StackedView<DashboardViewModel> {
  const VerificationRequirement({super.key});

  @override
  Widget builder(BuildContext context, DashboardViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification Requirement',
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF565656),
                  fontWeight: FontWeight.bold),
            )),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // toolbarHeight: 120,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Details to provide',
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF565656),
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 8),
                    Text('The following are information we want from you.',
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF565656),
                          ),
                        )),
                    SizedBox(height: 16),
                    // Example of a detailed entry
                    buildInfoRow(context, 'assets/images/Icon.svg', 'Personal information', 'Provide your First name, Last name and Nick name.'),
                    SizedBox(height: 16),
                    buildInfoRow(context, 'assets/images/smile_scan.svg', 'Face Verification', 'Get a face shot by following the instructions that will be provided.'),
                    SizedBox(height: 16),
                    buildInfoRow(context, 'assets/images/smile2.svg', 'ID Card Verification', 'Provide us with a passport photograph and Valid ID card.'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0), // Add horizontal padding if needed
            child: Text(
              'By clicking on Acept and Proceed you consent to provide us with the requested data',
              textAlign: TextAlign.center,  // Centers text horizontally
              style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                  color: kcPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const Spacer(),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SubmitButton(
              isLoading: viewModel.isBusy,
              label: "ACCEPT AND PROCEED",
              submit: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalInformationView(),
                  ),
                );
              },
              color: kcPrimaryColor,
              boldText: true,
            ),
          ),

        ],
        ),
      ),





    );
  }

  Widget buildInfoRow(BuildContext context, String assetPath, String title, String description) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            assetPath,
            width: 40,
            height: 40,
          ),
          SizedBox(width: 16),
          Flexible(  // Use Flexible to avoid overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          fontSize: 16,
                          color: kcPrimaryColor,
                          fontWeight: FontWeight.w500),
                    )),
                Text(description,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF565656),
                          fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  DashboardViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      DashboardViewModel();
}

