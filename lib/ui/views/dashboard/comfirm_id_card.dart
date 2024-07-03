import 'dart:typed_data';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/image_cropper.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/submit_button.dart';
import 'asign_qr_code.dart';
import 'comfirm_id_viewmodel.dart';
import 'dashboard_viewmodel.dart';
import 'face_capture.dart';

class ConfirmIdCard extends StackedView<ConfirmIdViewModel> {
  const ConfirmIdCard({Key? key}) : super(key: key);

  @override
  void onViewModelReady(ConfirmIdViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  Widget LocalFilePicker({
    required Uint8List? fileAction,
    required Function(Uint8List?) onFilePicked,
  }) {
    return InkWell(
      onTap: () => _updateDocument(onFilePicked),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DottedBorder(
          color: Colors.black,
          strokeWidth: 1,
          padding: EdgeInsets.all(6),
          borderType: BorderType.RRect,
          radius: Radius.circular(22),
          dashPattern: [5, 5],
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              height: 175,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    fileAction != null
                        ? Image.memory(
                      fileAction,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                        : Icon(
                      Icons.cloud_upload,
                      size: 56,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Click to upload',
                          style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                    Text(
                      'SVG, PNG, JPG or GIF (max. 800x400px)',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateDocument(void Function(Uint8List?) updateFunction) async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles();
    // if (result != null) {
    //   final bytes = await File(result.files.single.path ?? '').readAsBytes();
    //
    //   // Resize the image here
    //   Uint8List? resizedBytes = await ImageCropper().resizeImage(bytes, 800, 400);
    //
    //   updateFunction(resizedBytes);
    // }
  }

  Widget _buildTextField(String label, ConfirmIdViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
        onChanged: (value) {
          // Update the viewModel with the new input data
          // viewModel.updateField(label, value);
        },
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context, String label, ConfirmIdViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          // Implement the date picker dialog
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light(
                    primary: kcPrimaryColor,  // background color of the header and date picker
                    onPrimary: Colors.white, // text color in the header
                    surface: Colors.white,   // background color of the dialog
                    onSurface: Colors.black, // text color in the dialog
                  ),
                  dialogBackgroundColor: Colors.white, // background color of the dialog
                ),
                child: child!,
              );
            },
          ).then((selectedDate) {
            if (selectedDate != null) {
              viewModel.setSelectedDate(selectedDate);  // Format as needed
            }
          });
        },
        child: AbsorbPointer(
          child: TextField(
            controller: TextEditingController(text: viewModel.selectedDate != null ? DateFormat('yyyy-MM-dd').format(viewModel.selectedDate!) : ''),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: label,
              suffixIcon: Icon(Icons.calendar_today),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardTypeDropdown(ConfirmIdViewModel viewModel) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'ID Card Type',
      ),
      value: viewModel.selectedGender, // Make sure to manage this state in your viewModel
      items: <String>['Drivers License', 'National ID', 'Other'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        viewModel.selectedGender = newValue; // Update the selected gender in your viewModel
        viewModel.notifyListeners();
      },
    );
  }

  @override
  Widget builder(BuildContext context, ConfirmIdViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm your Id Card', style: GoogleFonts.rubik(
          textStyle: TextStyle(
              fontSize: 18,
              color: Colors.black,  // Adjust color as needed
              fontWeight: FontWeight.bold),
        )),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            verticalSpaceSmall,
            _buildCardTypeDropdown(viewModel),
            _buildTextField('ID Card number', viewModel),
            _buildDatePicker(context, 'Date of Birth', viewModel),
            verticalSpaceSmall,
            LocalFilePicker(
              fileAction: viewModel.idCardBytes,
              onFilePicked: viewModel.updateIdCardByte,
            ),
            verticalSpaceLarge,
            SubmitButton(
              isLoading: viewModel.isBusy,
              boldText: true,
              label: "PROCEED",
              submit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssignQrCode(),
                  ),
                );
              },
              color: kcPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  ConfirmIdViewModel viewModelBuilder(BuildContext context) => ConfirmIdViewModel();
}
