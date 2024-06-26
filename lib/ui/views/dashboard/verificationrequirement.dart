import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kenmack/ui/common/app_colors.dart';

class VerificationRequirement extends StatelessWidget {
  const VerificationRequirement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Verification Requirement',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 120,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: 500,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Details to provide',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'The following are information we want from you.',
                    style: TextStyle(
                        fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Icon.svg', // Replace with your SVG asset path
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Personal information',
                              style: TextStyle(fontSize: 16, color: kcPrimaryColor),
                            ),
                            Text(
                              'Provide your First name, Last name \n and Nick name.',
                              style: TextStyle(fontSize: 14, color: Color(0xFF565656)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Container(
                  //   padding: EdgeInsets.all(8.0),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.grey, width: 1),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       SvgPicture.asset(
                  //         'assets/images/smile.svg', // Replace with your SVG asset path
                  //         width: 40,
                  //         height: 40,
                  //       ),
                  //       SizedBox(width: 16),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             'Face Verification',
                  //             style: TextStyle(fontSize: 16, color: kcPrimaryColor),
                  //           ),
                  //           Text(
                  //             'Get a face shot by following the \n instructions that will be provided.',
                  //             style: TextStyle(fontSize: 14, color: Color(0xFF565656)),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 16),
                  //
                  // Container(
                  //   padding: EdgeInsets.all(8.0),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.grey, width: 1),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       SvgPicture.asset(
                  //         'assets/images/smile.svg', // Replace with your SVG asset path
                  //         width: 40,
                  //         height: 40,
                  //       ),
                  //       SizedBox(width: 16),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             'ID Card Verification',
                  //             style: TextStyle(fontSize: 16, color: kcPrimaryColor),
                  //           ),
                  //           Text(
                  //             'Provide us with a passport  \n photograph and Valid ID card.',
                  //             style: TextStyle(fontSize: 14, color: Color(0xFF565656)),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

