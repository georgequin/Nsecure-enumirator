import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nsecure/app/app.router.dart';
import 'package:nsecure/ui/common/app_colors.dart';
import 'package:nsecure/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../components/submit_button.dart';
import '../../components/text_field_widget.dart';
import 'auth_viewmodel.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  bool _isPasswordVisible = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        body: ViewModelBuilder<AuthViewModel>.reactive(
          onViewModelReady: (model) {
            model.init();
          },
          viewModelBuilder: () => AuthViewModel(),
          builder: (context, model, child) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  verticalSpaceMassive,
                  Image.asset('assets/images/logo.png', height:92, width: 92, ),
                  // verticalSpaceSmall,
                  const Text(
                    'Welcome Back! 👋',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  verticalSpaceSmall,
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "New user? ",
                        style: TextStyle(color: kcPrimaryColor),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Create an account',
                            style: TextStyle(
                              color: kcPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                locator<NavigationService>().replaceWithRegisterView();
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFieldWidget(
                    hint: "Email",
                    controller: model.email,
                  ),
                  verticalSpaceMedium,
                  TextFieldWidget(
                    hint: "Password",
                    controller: model.password,
                    obscureText: model.obscure,
                    suffix: InkWell(
                      onTap: () {
                        model.toggleObscure();
                      },
                      child: Icon(
                          model.obscure ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                  verticalSpaceTiny,
                  Center(
                    child: TextButton(
                        onPressed: () {
                          print('clicked forgot');
                          model.moveToForgotPassword();
                        },
                        child: Text('Forgot Password?', style: TextStyle(color: kcPrimaryColor),  textAlign: TextAlign.right,),
                      ),
                  ),
                  verticalSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: model.toggleRemember,
                        child: Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: model.remember
                                        ? kcPrimaryColor
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: model.remember
                                            ? Colors.transparent
                                            : kcPrimaryColor)),
                                child: model.remember
                                    ? const Center(
                                  child: Icon(
                                    Icons.check,
                                    color: kcWhiteColor,
                                    size: 14,
                                  ),
                                )
                                    : const SizedBox()),
                            horizontalSpaceSmall,
                            const Text(
                              "Remember Me",
                              style: TextStyle(
                                  fontSize: 14, decoration: TextDecoration.underline),
                            )
                          ],
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     locator<NavigationService>()
                      //         .navigateToChangePasswordView(isResetPassword: true);
                      //   },
                      //   child: const Text(
                      //     "Forgot password?",
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       color: kcSecondaryColor,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  verticalSpaceMedium,
                  SubmitButton(
                    isLoading: model.isBusy,
                    boldText: true,
                    label: "Login",
                    submit: () {
                      model.login();
                    },
                    color: kcPrimaryColor,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ],
              ),
          ),
        ),
      ),
    );
  }
}

