import 'package:flutter/material.dart';
import 'package:nsecure/state.dart';
import 'package:nsecure/ui/common/app_colors.dart';
import 'package:nsecure/ui/common/ui_helpers.dart';
import 'package:nsecure/ui/views/account/profile.dart';
import 'package:nsecure/ui/views/account/support.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        title: Center(
          child: Text(
            'Report',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(

            margin: EdgeInsets.all(20),
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: kcPrimaryColor,
              borderRadius: const BorderRadius.all( Radius.circular(12))
            ),
            child: ListTile(
              title: const Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${profile.value.firstName} ${profile.value.lastName}',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ));
              },
            ),
          ),
          verticalSpaceMedium,
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  // ListTile(
                  //   leading: Icon(Icons.security, color: kcPrimaryColor,),
                  //   title: Text('Security'),
                  //   trailing: Icon(Icons.chevron_right, color: kcPrimaryColor),
                  //   onTap: () {
                  //     // Handle security navigation or action
                  //   },
                  // ),
                  ListTile(
                    leading: Icon(Icons.help_outline, color: kcPrimaryColor),
                    title: Text('Support Center'),
                    trailing: Icon(Icons.chevron_right, color: kcPrimaryColor),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Support(),
                      ));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: kcPrimaryColor),
                    title: Text('Log Out'),
                    trailing: Icon(Icons.chevron_right, color: kcPrimaryColor,),
                    onTap: () {
                      _showCustomDialog(
                          context,
                          'Log Out',
                          'log out',
                              () {
                                return locator<NavigationService>().clearStackAndShow(Routes.loginView);
                          },
                          Colors.white
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete_forever, color: Colors.red),
                    title: Text('Delete Account', style: TextStyle(color: Colors.red),),
                    trailing: Icon(Icons.chevron_right, color: kcPrimaryColor),
                    onTap: () {
                      _showCustomDialog(
                        context,
                        'Delete Account',
                        // content: 'Are you sure you want to delete your account?',
                        'Delete',
                         () {
                          // TODO: Handle the delete account logic
                        },
                        Colors.red
                      );
                    },
                  ),
                ],
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _showCustomDialog(BuildContext context, String title, String confirmationText, Function onConfirm, Color confirmColor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 24.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Are you sure you want to $confirmationText?',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kcPrimaryColor, // Background color from your theme
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: const Size.fromHeight(50), // Button height
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                    onConfirm();
                  },
                  child: Text(
                    'Yes, $confirmationText',
                    style: TextStyle(fontSize: 18, color: confirmColor),
                  ),
                ),
                verticalSpaceSmall,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.transparent, // Background color from your theme
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: const Size.fromHeight(50), // Button height
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18, color: kcPrimaryColor),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        );
      },
    );
  }

}
