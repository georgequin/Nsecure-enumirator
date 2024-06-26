import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/empty_state.dart';
import 'notification_viewmodel.dart';

class NotificationView extends StackedView<NotificationViewModel> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NotificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        title: Center(
          child: Text(
            'Tax Collectionss',
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
      body: RefreshIndicator(
        onRefresh: () async {
          await viewModel.refreshData();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              verticalSpaceSmall,
              Card(
                elevation: 4, // Adjust elevation as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Set border radius here
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search), // Icon at the end of the input field
                      iconColor: kcPrimaryColor,
                      border: InputBorder.none, // Remove the border
                    ),
                  ),
                ),
              ),
              verticalSpaceSmall,
              Text(
                'DEBTORS',
                style: TextStyle(
                  color: kcPrimaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: ListView(
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: [
                      ListTile(
                        leading: CircleAvatar(),
                        title: Text(
                          'Jaxson Siphron',
                          style: TextStyle(color: kcPrimaryColor, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          'Mangu Park',
                          style: TextStyle(),
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              '#2,500.00',
                              style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 2,),
                            Expanded(
                              child: SizedBox(
                                width: 102, // Set the desired width here
                                height: 10, // Set the desired height here
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: kcPrimaryColor.withOpacity(0.5), // Set the background color here
                                    iconColor: kcPrimaryColor, // Set the text color here
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3.0), // Set the border radius here
                                    ),
                                  ),
                                  child: Text(
                                    'Collect Tax',
                                    style: TextStyle(
                                      color: kcPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Add more ListTile widgets here if needed
                    ],
                  ).toList(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  NotificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NotificationViewModel();
}
