import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kenmack/state.dart';
import 'package:kenmack/ui/views/dashboard/recommendedCard.dart';
import 'package:kenmack/ui/views/dashboard/verificationrequirement.dart';
import 'package:kenmack/ui/views/dashboard/verifydriver.dart';
import 'package:openapi/api.dart';
import 'package:stacked/stacked.dart';
import '../../../utils/base64Image.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/empty_state.dart';
import '../../components/submit_button.dart';
import '../account/profile.dart';
import 'dashboard_viewmodel.dart';
import 'dismissable_card.dart';
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
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: kcPrimaryColor,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                              radius: 29,
                              backgroundColor: Colors.white,
                              backgroundImage: MemoryImage(
                                  base64Decode(profile.value.picture!.url!)),
                            )
                          : const Icon(
                              Icons.person_2_rounded,
                              color: Colors.white, // Icon content color
                              size: 44,
                            ),
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontWeight: FontWeight
                              .bold), // Increase the font size of the title
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications_active_outlined,
                        size: 44,
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
      body: Column(
        children: [
          verticalSpaceSmall,
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: 500,
                height: 187,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Registered Transport Workers',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Ensure to pass a valid ServicesPOJO object
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
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          width: 100,
                          height: 50,
                          child: Center(
                            child: Text(
                              '1447',
                              style: TextStyle(
                                  fontSize: 29, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          icon: Icon(
                            Icons.add,
                            size: 24,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerificationRequirement(),
                              ),
                            );
                          },
                          label: Text(
                            'Add New',
                            style: TextStyle(color: kcPrimaryColor),
                          ),
                        ),
                        TextButton.icon(
                          icon: Icon(
                            Icons.document_scanner_outlined,
                            size: 24,
                          ),
                          onPressed: () {},
                          label: Text(
                            'Scan a Driver',
                            style: TextStyle(color: kcPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: 500,
                height: 150,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Tax Collected',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(
                        '₦ 15,000.00',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: kcPrimaryColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View Details',
                              style: TextStyle(color: kcPrimaryColor),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.navigate_next_outlined,
                                color: kcPrimaryColor),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: 500,
                height: 150,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cash Collected',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpaceSmall,
                      Text(
                        '₦ 10,000.00',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: kcPrimaryColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View Details',
                              style: TextStyle(color: kcPrimaryColor),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.navigate_next_outlined,
                                color: kcPrimaryColor),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
