import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kenmack/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'onboarding2.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 710,
                child: Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0,right: 40, top: 40,),
                      child: Image.asset('assets/images/n secure logo.png'),
                    ),
                  ),
                ),
              ),

              Container(
                height: 220,
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                    verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, right: 32),
                      child: Text(
                        'It’s a pleasure to meet you. We are excited that you’re here so let’s get started!',
                        style: TextStyle(
                            color: kcBlackColor, fontFamily: 'Poppins', fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    verticalSpaceMedium,
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, right: 32, bottom: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => OnboardingView2(),
                                  ));                                },
                                child: const Text(
                                  'Get Started',
                                  style: TextStyle(fontSize: 15),
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: kcPrimaryColor,
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
              ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        );
      },
    );
  }
}
