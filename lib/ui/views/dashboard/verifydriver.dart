import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/submit_button.dart';
import '../../components/text_field_widget.dart';
import 'dashboard_viewmodel.dart';

class VerifyDriver extends StackedView<DashboardViewModel>  {
  const VerifyDriver({super.key});


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
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Verify a Driver',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 120,
      ),
      body: Column(
        children: [
          Text(
            'Enter the driver’s serial key and click proceed to start the verification process',
            style: TextStyle(fontSize: 16, color: kcPrimaryColor),

          ),
          // TextFieldWidget(
          //   hint: "Serial key",
          //   controller: model.email,
          //   validator: (value) {
          //     if (value.isEmpty) {
          //       return 'required';
          //     }
          //     if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
          //         .hasMatch(value)) {
          //       return 'Invalid Serial key address';
          //     }
          //     return null; // Return null to indicate no validation error
          //   },
          // ),
          // verticalSpace(60),
          // SubmitButton(
          //   isLoading: Model.isBusy,
          //   label: "Sign in",
          //   submit: () {
          //   },
          //   color: kcPrimaryColor,
          //   boldText: true,
          // ),
        ],
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context)
  => DashboardViewModel();
}
