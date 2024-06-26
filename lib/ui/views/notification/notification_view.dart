
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        centerTitle: true,
        title: const Text(
          "Notification",
        ),
      ),
      // body: SizedBox(
      //   height: MediaQuery.of(context).size.height / 2,
      //   child: const EmptyState(
      //     animation: "empty_notifications.json",
      //     label: "No Notifications Yet",
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'VERIFICATION ',
                        style:
                        TextStyle(fontSize: 16, color: Color(0xFF475569)),
                      ),

                    ],
                  ),
                ),
                verticalSpaceTiny,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'You have successfully complete your  verification with an enumerator you can now  generate your QR code.',
                    style:
                    TextStyle(fontSize: 14, ),
                  ),
                ),
                verticalSpaceTiny,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '2 mins ago ',
                    style:
                    TextStyle(fontSize: 12, color: Color(0xFF475569)),
                  ),
                ),
              ],
            ),
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
