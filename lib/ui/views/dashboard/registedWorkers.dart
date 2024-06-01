import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kenmack/ui/common/ui_helpers.dart';
import 'package:kenmack/ui/views/dashboard/recommendedCard.dart';
import 'package:openapi/api.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/model/driver.dart';
import '../../../utils/base64Image.dart';
import '../../common/app_colors.dart';

class ServiceDetailsPage extends StatelessWidget {
  final ServicesPOJO service;
  final bool isModal;

  const ServiceDetailsPage({
    Key? key,
    required this.service,
    this.isModal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Driver> drivers = [
      Driver(
          name: 'Makenna Aminoff',
          phoneNumber: '+234-76658432',
          category: 'Truck Driver',
          imageUrl: 'assets/images/apple.png'),
      Driver(
          name: 'Jaxson Siphron',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/apple.png'),
      Driver(
          name: 'Kaylynn Press',
          phoneNumber: '+234-76658432',
          category: 'Truck Driver',
          imageUrl: 'assets/images/apple.png'),
      Driver(
          name: 'Roger Philips',
          phoneNumber: '+234-76658432',
          category: 'Truck Driver',
          imageUrl: 'assets/images/apple.png'),
      Driver(
          name: 'Kaiya Geidt',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/apple.png'),
      Driver(
          name: 'assets/images/apple.png',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/apple.png'),
      Driver(
          name: 'Ryan Bator',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/apple.png'),
      Driver(
          name: 'Carla Levin',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/apple.png'),
      Driver(
          name: 'Jaxson Rosser',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/apple.png'),
    ];

    return Scaffold(
      appBar: isModal
          ? null
          : AppBar(
        backgroundColor: kcPrimaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceSmall,
            Text(
              'Registered Transport Workers',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            verticalSpaceMedium,
            Text(
              'Total Workers',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '1447',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 120,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: drivers.length,
          itemBuilder: (context, index) {
            Driver driver = drivers.elementAt(index);
            return DriverCard(
              imagePath: driver.imageUrl,
              title: driver.name,
              phoneNumber: driver.phoneNumber,
              category: driver.category,
            );
          }),
    );
  }
}
