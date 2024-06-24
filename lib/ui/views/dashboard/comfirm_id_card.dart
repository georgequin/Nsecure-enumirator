import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../../components/submit_button.dart';
import 'dashboard_viewmodel.dart';
import 'face_capture.dart';

class ConfirmIdCard extends StackedView<DashboardViewModel> {
  const ConfirmIdCard({Key? key}) : super(key: key);

  @override
  void onViewModelReady(DashboardViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }

  Widget _buildTextField(String label, DashboardViewModel viewModel) {
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

  Widget _buildDatePicker(BuildContext context, String label, DashboardViewModel viewModel) {
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

  Widget _buildGenderDropdown(DashboardViewModel viewModel) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Gender',
      ),
      value: viewModel.selectedGender, // Make sure to manage this state in your viewModel
      items: <String>['Male', 'Female', 'Other'].map((String value) {
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
  Widget builder(BuildContext context, DashboardViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information', style: GoogleFonts.rubik(
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
            _buildTextField('First Name', viewModel),
            _buildTextField('Last Name', viewModel),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'State',
              ),
              value: viewModel.selectedState,
              items: viewModel.states.map((String state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  viewModel.onStateSelected(value);
                }
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Local Government',
              ),
              items: viewModel.lgas.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, overflow: TextOverflow.ellipsis,),
                );
              }).toList(),
              onChanged: (value) {
                // Handle LGA selection if needed
              },
              value: viewModel.lgas.isNotEmpty ? viewModel.lgas.first : null,
            ),
            _buildTextField('Address', viewModel),
            _buildGenderDropdown(viewModel),
            _buildDatePicker(context, 'Date of Birth', viewModel),
            verticalSpaceMassive,
            SubmitButton(
              isLoading: viewModel.isBusy,
              boldText: true,
              label: "PROCEED",
              submit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FaceCaptureView(),
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
  DashboardViewModel viewModelBuilder(BuildContext context) => DashboardViewModel();
}
