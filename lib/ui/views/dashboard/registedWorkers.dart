import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nsecure/ui/common/ui_helpers.dart';
import 'package:nsecure/ui/views/dashboard/recommendedCard.dart';
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
          imageUrl: 'assets/images/person.png'),
      Driver(
          name: 'Jaxson Siphron',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/person.png'),
      Driver(
          name: 'Kaylynn Press',
          phoneNumber: '+234-76658432',
          category: 'Truck Driver',
          imageUrl: 'assets/images/person.png'),
      Driver(
          name: 'Roger Philips',
          phoneNumber: '+234-76658432',
          category: 'Truck Driver',
          imageUrl: 'assets/images/person.png'),
      Driver(
          name: 'Kaiya Geidt',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/person.png'),
      Driver(
          name: 'Salim Muhamed',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/person.png'),
      Driver(
          name: 'Ryan Bator',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/person.png'),
      Driver(
          name: 'Carla Levin',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/person.png'),
      Driver(
          name: 'Jaxson Rosser',
          phoneNumber: '+234-76658432',
          category: 'Bus Driver',
          imageUrl: 'assets/images/person.png'),
    ];

    return Scaffold(
      appBar: isModal
          ? null
          : AppBar(
        backgroundColor: kcPrimaryColor,
        title: const Text(
          'Registered Transport Workers',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 100,
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
