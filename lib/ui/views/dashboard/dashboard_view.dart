import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nsecure/state.dart';
import 'package:nsecure/ui/views/dashboard/verificationrequirement.dart';
import 'package:nsecure/ui/views/dashboard/verifydriver.dart';
import 'package:openapi/api.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../account/profile.dart';
import 'dashboard_viewmodel.dart';
import 'registedWorkers.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  DashboardView({Key? key}) : super(key: key);

  final PageController _pageController = PageController();
  bool _isCardVisible = true;

  bool get isCardVisible => _isCardVisible;

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: kcPrimaryColor,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpaceMedium,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ));
                        },
                        child: profile.value.picture != null
                            ? CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.white,
                                backgroundImage: MemoryImage(
                                    base64Decode(profile.value.picture!.url!)),
                              )
                            : const CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person_2_rounded,
                                  color: Colors.black54, // Icon content color
                                  size: 22,
                                ),
                              )),
                    // Text(
                    //   'Home',
                    //   style: TextStyle(
                    //       fontSize: 24,
                    //       color: Colors.white,
                    //       fontWeight: FontWeight
                    //           .bold), // Increase the font size of the title
                    // ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_active_outlined,
                        size: 32,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 0.5, // Adjust opacity to make the logo less obtrusive
              child: Image.asset(
                "assets/images/logo-tint.png", // Your logo asset path
                width: 500, // Adjust size accordingly
              ),
            ),
          ),
          ListView(
            children: [
              Column(
                children: [
                  verticalSpaceSmall,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 4,
                      color: Colors.white.withOpacity(0.9),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Registered Transport Workers',
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: Color(0xFF565656),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('1447',
                                style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                      fontSize: 29,
                                      color: kcPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                )),
                            verticalSpaceSmall,
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ServiceDetailsPage(
                                      service: ServicesPOJO(
                                        title: 'Service Title',
                                        description: 'Service Description',
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text('View Workers >',
                                  style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        color: kcPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Divider(
                              color: kcPrimaryColor,
                              thickness: 2.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VerifyDriver(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFF0F3FA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          4), // Reduced border radius
                                    ),
                                  ),
                                  child: Text(
                                    '+ Add New',
                                    style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        color:
                                            kcPrimaryColor, // Make sure kcPrimaryColor is defined
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add new worker
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFF0F3FA),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          4), // Reduced border radius
                                    ),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Scan a Driver',
                                        style: GoogleFonts.rubik(
                                          textStyle: TextStyle(
                                            fontSize: 15,
                                            color:
                                                kcPrimaryColor, // Make sure kcPrimaryColor is defined
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      horizontalSpaceTiny,
                                      Icon(
                                        Icons.document_scanner_outlined,
                                        color: kcPrimaryColor,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 4,
                      color: Colors.white.withOpacity(0.9),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Tax Collected',
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: Color(0xFF565656),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            verticalSpaceSmall,
                            Text(
                              '₦ 15,000.00',
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: kcPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            verticalSpaceSmall,
                            InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'View Details',
                                    style: TextStyle(color: kcPrimaryColor),
                                  ),
                                  Icon(Icons.navigate_next_outlined,
                                      color: kcPrimaryColor),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 4,
                      color: Colors.white.withOpacity(0.9),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cash Collected',
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: Color(0xFF565656),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            verticalSpaceSmall,
                            Text(
                              '₦ 10,000.00',
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: kcPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            verticalSpaceSmall,
                            InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'View Details',
                                    style: TextStyle(color: kcPrimaryColor),
                                  ),
                                  Icon(Icons.navigate_next_outlined,
                                      color: kcPrimaryColor),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 4,
                      color: Colors.white.withOpacity(0.9),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wallet Balance',
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: Color(0xFF565656),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            verticalSpaceSmall,
                            Text(
                              '₦ 10,000.00',
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: kcPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            verticalSpaceSmall,
                            InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Withdraw',
                                    style: TextStyle(color: kcPrimaryColor),
                                  ),
                                  Icon(Icons.navigate_next_outlined,
                                      color: kcPrimaryColor),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
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


  @override
  void onViewModelReady(DashboardViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }
}
