import 'package:flutter/material.dart';
import 'package:nsecure/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/submit_button.dart';
import '../../components/text_field_widget.dart';
import 'auth_viewmodel.dart';

class Register extends StatefulWidget {
  // final TabController controller;

  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Account'),
        ),
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
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceMedium,
                      const Text(
                        "Sign up to get started",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Panchang"),
                      ),
                      verticalSpaceTiny,
                      Row(children: [
                        const Text(
                          "Existing user? ",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            locator<NavigationService>().replaceWithLoginView();
                          },
                          child: const Text(
                            " Sign in here",
                            style: TextStyle(
                                fontSize: 12,
                                color: kcPrimaryColor,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ]),
                      verticalSpaceMedium,

                      verticalSpaceMedium,
                      TextFieldWidget(
                        hint: "Email Address",
                        controller: model.email,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'required';
                          }
                          if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                              .hasMatch(value)) {
                            return 'Invalid email address';
                          }
                          return null; // Return null to indicate no validation error
                        },
                      ),
                      verticalSpaceSmall,
                      TextFieldWidget(
                        inputType: TextInputType.visiblePassword,
                        hint: "Password",
                        controller: model.password,
                        obscureText: model.obscure,
                        suffix: InkWell(
                          onTap: () {
                            model.toggleObscure();
                          },
                          child: Icon(model.obscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Password must contain at least one uppercase letter';
                          }
                          if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return 'Password must contain at least one lowercase letter';
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Password must contain at least one digit';
                          }
                          if (!RegExp(r'[!@#$%^&*]').hasMatch(value)) {
                            return 'Password must contain at least one special character';
                          }
                          return null; // Return null to indicate no validation error
                        },
                      ),
                      verticalSpaceSmall,
                      TextFieldWidget(
                        hint: "Re-type password",
                        controller: model.cPassword,
                        obscureText: model.obscure,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password confirmation is required';
                          }
                          if (value != model.password.text) {
                            return 'Passwords do not match';
                          }
                          return null; // Return null to indicate no validation error
                        },
                        suffix: InkWell(
                          onTap: () {
                            model.toggleObscure();
                          },
                          child: Icon(model.obscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            verticalSpaceMedium,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    "OR",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            verticalSpaceMedium,
                            socialLoginButton('Continue with Google',
                                'assets/images/google.png'),
                            socialLoginButton('Continue with Facebook',
                                'assets/images/facebook.png'),


                            //SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                          ],
                        ),
                      ),

                      verticalSpace(60),
                      SubmitButton(
                        isLoading: model.isBusy,
                        label: "Sign in",
                        submit: () {
                          if (_formKey.currentState!.validate()) {
                            model.register();
                          }
                        },
                        color: kcPrimaryColor,
                        boldText: true,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      verticalSpaceMassive
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void gotoLogin() {}

  Widget socialLoginButton(String text, String iconPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton.icon(
        icon: Image.asset(iconPath, height: 14, width: 14),
        label: Text(text,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400)),
        onPressed: () {
          // Handle social login
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
