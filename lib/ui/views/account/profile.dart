import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nsecure/core/network/loggingApiClient.dart';
import 'package:nsecure/state.dart';
import 'package:nsecure/ui/common/ui_helpers.dart';
import 'package:nsecure/utils/profileUtil.dart';
import 'package:openapi/api.dart';
import 'package:path/path.dart' as path;
import 'package:stacked_services/stacked_services.dart';
import 'dart:typed_data';

import '../../../app/app.locator.dart';
import '../../../core/network/api_manager.dart';
import '../../../utils/base64Image.dart';
import '../../common/app_colors.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _imageBytes;
  bool isUpdating = false;
  int? _selectedCountryId;
  List<CountryPOJO> _countries = [];
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
    fetchCountries();
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

  void fetchCountries() async {
    try {
      _countries = await _apiManager.performApiCall(
          apiCall: () =>
              UserControllerApi(_apiManager.apiClient).getAllCountries(),
          endpoint: 'countries');

      if (_countries.isNotEmpty) {
        if (profile.value.countryPOJO != null) {
          _selectedCountryId = profile.value.countryPOJO?.id;
        } else {
          _selectedCountryId = _countries.first.id;
        }
      }
      setState(() {});
    } catch (e) {
      print("Error fetching countries: $e");
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColor,
        title: Center(
          child: Text(
            'Driver Profile',
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
                    color:
                        Colors.black.withOpacity(0.5), // Semi-transparent black
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
            verticalSpaceSmall,
            Text(
              'Amrah Dee',
              style: TextStyle(
                  color: kcPrimaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            Container(
              width: 365,
              height: 179,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: [
                        ListTile(
                          leading: Text(
                            'Outstanding Tax',
                            style: TextStyle(),
                          ),
                          title: Text(
                            '#1,447',
                            style: TextStyle(),
                          ),
                          trailing:
                              Icon(Icons.chevron_right, color: kcPrimaryColor),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Text('Applicable Tax'),
                          title: Text('Bus driver '),
                          trailing: Text(
                            '#4500/month',
                            style: TextStyle(),
                          ),
                          onTap: () {
                            // Handle security navigation or action
                          },
                        ),
                        ListTile(
                          title: Text('Serial ID'),
                          trailing: Text(
                            '8973602TY',
                            style: TextStyle(),
                          ),
                          onTap: () {
                            // Handle security navigation or action
                          },
                        ),
                      ],
                    ).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {String? trailing, bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          suffixText: trailing,
        ),
        enabled: enabled, // This line will enable or disable the text field
      ),
    );
  }

  Widget _buildCountryDropdown() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: DropdownButtonFormField<int>(
          value: _selectedCountryId,
          onChanged: (newValue) {
            setState(() {
              _selectedCountryId = newValue;
            });
          },
          items: _countries.map<DropdownMenuItem<int>>((CountryPOJO country) {
            return DropdownMenuItem<int>(
              value: country.id,
              child: Text(country.name ?? ''),
            );
          }).toList(),
        ));
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Profile"),
          icon: Icon(Icons.edit),
          content: Column(
            children: [
              _buildTextField(_fullNameController, 'Full Name'),
              _buildTextField(_phoneNumberController, 'Phone Number',
                  trailing: 'Not Verified'),
              _buildCountryDropdown(),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                _updateProfileDetails();
                Navigator.pop(context);
              },
              child: Text('Update'),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: kcPrimaryColor,
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 20),
              ),
            ),
          ],
        );
      },
    );
  }
}
