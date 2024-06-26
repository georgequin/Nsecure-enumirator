import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
import '../notification/notification_view.dart';
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
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: kcPrimaryColor,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        ), // Increase the font size of the title
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.notifications_active_outlined,
                          size: 35,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NotificationView(),
                          ));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
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
                height: 127,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Marvelous',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kcPrimaryColor),
                      ),
                      verticalSpaceSmall,
                      Text(
                        'Please find an Enumerator closest to you  to complete \n your registration using your serial key',
                        style:
                            TextStyle(fontSize: 12, color: Color(0XFF565656)),
                      ),
                      verticalSpaceSmall,
                      Row(
                        children: [
                          Text(
                            'Serial Key:',
                            style: TextStyle(color: kcPrimaryColor),
                          ),
                          Text(
                            '14532334128712GA',
                            style: TextStyle(color: kcMediumGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                height: 144,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Outstanding Balance',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View Details',
                              style: TextStyle(color: kcPrimaryColor),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '₦ 5,000.00',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: kcPrimaryColor),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Pay now',
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
                height: 144,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Applicable Taxes',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View Details',
                              style: TextStyle(color: kcPrimaryColor),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '₦ 15,000.00',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: kcPrimaryColor),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Pay now',
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
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Card(
          //     color: Colors.white,
          //     elevation: 5,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: SizedBox(
          //       width: 500,
          //       height: 144,
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: SizedBox(
          //           height: 125,
          //           child: GoogleMap(
          //             mapType: MapType.normal,
          //             initialCameraPosition: viewModel.initialPosition,
          //             markers: viewModel.locationData != null
          //                 ? {
          //               Marker(
          //                 markerId: const MarkerId("source"),
          //                 position: LatLng(
          //                     viewModel.locationData!.latitude ?? 34.0469,
          //                     viewModel.locationData!.longitude ?? -118.2437),
          //                 icon: viewModel.customIcon ??
          //                     BitmapDescriptor.defaultMarker,
          //                 rotation: viewModel.locationData!.heading ?? 0,
          //               ),
          //             }
          //                 : {},
          //             onMapCreated: (GoogleMapController controller) {
          //               viewModel.mapController = controller;
          //             },
          //           ),
          //         ),
          //         ),
          //       ),
          //     ),
          //   ),
        ],),),);
  }

  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}
