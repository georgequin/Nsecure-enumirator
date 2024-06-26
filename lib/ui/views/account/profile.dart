import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kenmack/core/network/loggingApiClient.dart';
import 'package:kenmack/state.dart';
import 'package:kenmack/ui/common/ui_helpers.dart';
import 'package:kenmack/ui/components/text_field_widget.dart';
import 'package:kenmack/utils/profileUtil.dart';
import 'package:openapi/api.dart';
import 'package:path/path.dart' as path;
import 'package:stacked_services/stacked_services.dart';
import 'dart:typed_data';

import '../../../app/app.locator.dart';
import '../../../core/network/api_manager.dart';
import '../../../utils/base64Image.dart';
import '../../common/app_colors.dart';
import '../../components/submit_button.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _imageBytes;
  bool isUpdating = false;
  int? _selectedCountryId;
  final ApiManager _apiManager = ApiManager(locator<LoggingApiClient>());

  // Use initial values from the profile state
  late TextEditingController _fullNameController = TextEditingController(
      text: '${profile.value.firstName} ${profile.value.lastName}');
  late TextEditingController _phoneNumberController =
      TextEditingController(text: '${profile.value.phone}');
  late TextEditingController _emailController =
      TextEditingController(text: '${profile.value.email}');

  @override
  void initState() {
    super.initState();
    ProfileUtil().getProfile();
    initializeControllers();
  }

  void initializeControllers() {
    _fullNameController = TextEditingController(
        text: '${profile.value.firstName} ${profile.value.lastName}');
    _phoneNumberController =
        TextEditingController(text: '${profile.value.phone}');
    _emailController = TextEditingController(text: '${profile.value.email}');
  }

  Future<void> _updateProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await File(pickedFile.path).readAsBytes();
      setState(() {
        _imageBytes = bytes;
        // Convert image to base64 string
        String base64Image = base64Encode(bytes);
        _updateProfilePicture(base64Image);
      });
    }
  }

  Future<void> _updateProfilePicture(String base64Image) async {
    // Assuming you have a method in your UserControllerApi for updating the profile picture
    try {
      await _apiManager.performApiCall(
        apiCall: () =>
            UserControllerApi(_apiManager.apiClient).updateUserProfilePicture(
          profile.value.id!,
          base64Image,
        ),
        endpoint: 'updateProfilePicture',
      );
      ProfileUtil().getProfile();
    } catch (e) {
      print("Error updating profile picture: $e");
    }
  }

  Future<void> _updateProfileDetails() async {
    // Implement your logic to update the profile details
    // Collect data from the TextEditingControllers and send to your backend or service
    UserDetailDTO userDetailDTO = UserDetailDTO(
      fullName: _fullNameController.text,
      phoneNumber: _phoneNumberController.text,
      countryId: _selectedCountryId,
    );

    try {
      Response response = await _apiManager.performApiCall(
        apiCall: () => UserControllerApi(_apiManager.apiClient)
            .updateUserDetails(profile.value.id!, userDetailDTO),
        endpoint: 'user details',
      );
      ProfileUtil().getProfile();
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }

  late bool isloading;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        title: Text('Edit Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 24),
              Stack(
                alignment:
                    Alignment.center, // Align children at the bottom center
                children: [
                  GestureDetector(
                    onTap: _updateProfileImage,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: _imageBytes != null
                          ? MemoryImage(_imageBytes!)
                          : (profile.value.picture?.url != null
                              ? MemoryImage(
                                  base64Decode(profile.value.picture!.url!))
                              : null),
                    ),
                  ),
                  verticalSpaceSmall,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.5), // Semi-transparent black
                      borderRadius: BorderRadius.circular(
                          100), // Circular border to match the avatar
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: GestureDetector(
                        onTap: _updateProfileImage,
                        child: const Column(
                          children: [
                            Text(
                              'Update',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              verticalSpaceMedium,
              Text(
                'Amrah Dee',
                style: TextStyle(
                    color: kcPrimaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Amrah@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  horizontalSpaceTiny,
                  Text(
                    '|',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  horizontalSpaceTiny,
                  Text(
                    '123456789',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              verticalSpaceMedium,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              verticalSpaceMedium,
              TextFieldWidget(
                hint: 'Full name',
                controller: _fullNameController,
              ),
              verticalSpaceSmall,
              TextFieldWidget(
                hint: 'Phone number',
                controller: _phoneNumberController,
              ),
              verticalSpaceMedium,
              TextFieldWidget(
                hint: 'User name',
                controller: _fullNameController,
              ),
              verticalSpaceMedium,
              SubmitButton(
                isLoading: false,
                boldText: true,
                label: "Save",
                submit: () {},
                color: kcPrimaryColor,
              ),
              verticalSpaceMedium,
              TextFieldWidget(
                hint: 'Current password',
                controller: _fullNameController,
              ),
              verticalSpaceMedium,
              TextFieldWidget(
                hint: 'New password',
                controller: _fullNameController,
              ),
              verticalSpaceMedium,
              TextFieldWidget(
                hint: 'Confirm password',
                controller: _fullNameController,
              ),
              verticalSpaceMedium,

              SubmitButton(
                isLoading: false,
                boldText: true,
                label: "Change password",
                submit: () {},
                color: kcPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
