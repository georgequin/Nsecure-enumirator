import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kenmack/state.dart';
import 'package:kenmack/ui/common/app_colors.dart';
import 'package:kenmack/ui/common/ui_helpers.dart';
import 'package:kenmack/ui/views/account/profile.dart';
import 'package:kenmack/ui/views/account/support.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../notification/notification_settinngs.dart';
import '../notification/notification_view.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
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
                      'Settings',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            verticalSpaceMedium,
            SizedBox(
              height: 300,
              child: Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder (
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: [
                        ListTile(
                          leading: Icon(Icons.person_2_outlined, color: kcPrimaryColor),
                          title: Text('Edit Profile Information'),
                          trailing: Icon(Icons.chevron_right, color: kcPrimaryColor),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Support(),
                            ));
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.notifications_active_outlined, color: kcPrimaryColor),
                          title: Text('Notification'),
                          trailing: Icon(Icons.chevron_right, color: kcPrimaryColor,),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NotificationSettings(),
                            ));
                          },
                        ),

                        ListTile(
                          leading: Icon(Icons.language_outlined, color:  kcPrimaryColor),
                          title: Text('Language', style: TextStyle(),),
                          trailing: Icon(Icons.chevron_right, color: kcPrimaryColor),
                          onTap: () {

                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.security, color: kcPrimaryColor,),
                          title: Text('Security'),
                          trailing: Icon(Icons.chevron_right, color: kcPrimaryColor),
                          onTap: () {
                            // Handle security navigation or action
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.dark_mode_outlined, color: kcPrimaryColor,),
                          title: Text('Dark mode'),
                          trailing: Icon(Icons.chevron_right, color: kcPrimaryColor),
                          onTap: () {
                            // Handle security navigation or action
                          },
                        ),
                      ],
                    ).toList(),
                  ),
                ),
              ),
            ),
            verticalSpaceMedium,
            SizedBox(
              height: 200,
              child: Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder (
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: [
                        ListTile(
                          leading: Icon(Icons.help_center_outlined, color: kcPrimaryColor),
                          title: Text('Help annd support'),
                          trailing: Icon(Icons.chevron_right, color: kcPrimaryColor),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Support(),
                            ));
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.privacy_tip_outlined, color: kcPrimaryColor),
                          title: Text('Privacy policy'),
                          trailing: Icon(Icons.chevron_right, color: kcPrimaryColor,),
                          onTap: () {
                          },
                        ),

                        ListTile(
                          leading: Icon(Icons.contact_mail_outlined, color:  kcPrimaryColor),
                          title: Text('Contact us', style: TextStyle(),),
                          trailing: Icon(Icons.chevron_right, color: kcPrimaryColor),
                          onTap: () {

                          },
                        ),
                      ],
                    ).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _showCustomDialog(BuildContext context, String title, String confirmationText, Function onConfirm, Color confirmColor) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(12.0),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               const SizedBox(height: 24.0),
  //               Text(
  //                 title,
  //                 style: const TextStyle(
  //                   fontSize: 20.0,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               const SizedBox(height: 8.0),
  //               Text(
  //                 'Are you sure you want to $confirmationText?',
  //                 textAlign: TextAlign.center,
  //               ),
  //               const SizedBox(height: 24.0),
  //               ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: kcPrimaryColor, // Background color from your theme
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(30.0),
  //                   ),
  //                   minimumSize: const Size.fromHeight(50), // Button height
  //                 ),
  //                 onPressed: () {
  //                   Navigator.of(context).pop(); // To close the dialog
  //                   onConfirm();
  //                 },
  //                 child: Text(
  //                   'Yes, $confirmationText',
  //                   style: TextStyle(fontSize: 18, color: confirmColor),
  //                 ),
  //               ),
  //               verticalSpaceSmall,
  //               ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //
  //                   backgroundColor: Colors.transparent, // Background color from your theme
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(30.0),
  //                   ),
  //                   minimumSize: const Size.fromHeight(50), // Button height
  //                 ),
  //                 onPressed: () {
  //                   Navigator.of(context).pop(); // To close the dialog
  //                 },
  //                 child: const Text(
  //                   'Cancel',
  //                   style: TextStyle(fontSize: 18, color: kcPrimaryColor),
  //                 ),
  //               ),
  //               const SizedBox(height: 16.0),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

}
