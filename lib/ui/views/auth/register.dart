import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kenmack/app/app.router.dart';
import 'package:openapi/api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final List<String> categories = ['happy', 'sad', 'weee'];


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
                        "Welcome aboard!",
                        style: TextStyle(
                            fontSize: 20,
                            color: kcPrimaryColor,
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
                      Column(
                        
                        children: [
                          TextFieldWidget(
                            hint: "First Name",
                            controller: model.firstname,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'required';
                              }
                              return null; // Return null to indicate no validation error
                            },
                          ),
                          TextFieldWidget(
                            hint: "First Name",
                            controller: model.firstname,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'required';
                              }
                              return null; // Return null to indicate no validation error
                            },
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      TextFieldWidget(
                        hint: "City",
                        controller: model.email,
                        validator: (value) {},
                      ),
                      verticalSpaceMedium,
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: 'Category',
                          labelStyle: const TextStyle(
                              color: Colors.black, fontSize: 13),
                          floatingLabelStyle:
                          const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        value: model
                            .selectedGender, // You should add selectedGender to your model
                        onSaved: (String? newValue) {
                          model.selectedGender = newValue!;
                        },
                        onChanged: (String? newValue) {
                          model.selectedGender = newValue!;
                          print('value of gender is${ model.selectedGender}');
                        },
                        items: categories
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        validator: (value) =>
                        value == null ? 'Please select a gender' : null,
                      ),
                      verticalSpaceMedium,
                      TextFieldWidget(
                        hint: "Station",
                        controller: model.email,
                        validator: (value) {},
                      ),
                      verticalSpaceMedium,
                      TextFieldWidget(
                        hint: "Plate Number",
                        controller: model.email,
                        validator: (value) {},
                      ),
                      verticalSpaceSmall,
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
                      IntlPhoneField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 13),
                          floatingLabelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10.0), // Add border curve
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10.0), // Add border curve
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                        ),
                        validator: (value) {
                          if (value!.completeNumber.isEmpty) {
                            return 'required';
                          }
                          return null; // Return null to indicate no validation error
                        },
                        initialCountryCode: 'NG',
                        controller: model.phone,
                        onChanged: (phone) {
                          model.phoneNumber = phone;
                        },
                      ),
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
  }