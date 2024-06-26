import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kenmack/state.dart';
import 'package:kenmack/ui/common/app_colors.dart';
import 'package:kenmack/ui/common/ui_helpers.dart';
import 'package:kenmack/ui/views/account/profile.dart';
import 'package:kenmack/ui/views/account/support.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Notification',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight
                              .bold), // Increase the font size of the title
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
              height: 150,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(
                      8.0), // Optional: add rounded corners
                ),
                child: Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Common',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: ListTile.divideTiles(
                              context: context,
                              tiles: [
                                ListTile(
                                  title: Text('Edit Profile Information'),
                                  trailing: Switch(
                                    value: false,
                                    onChanged: (value) {
                                      //
                                    },
                                    activeColor: kcPrimaryColor,
                                  ),
                                ),
                                ListTile(
                                  title: Text('Notification'),
                                  trailing: Switch(
                                    value: true,
                                    onChanged: (value) {},
                                    activeColor: kcPrimaryColor,
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            verticalSpaceMedium,
          ],
        ),
      ),
    );
  }
}
