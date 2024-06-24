import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nsecure/ui/views/services/service_viewmodel.dart';
import 'package:openapi/api.dart';
import 'package:stacked/stacked.dart';
import '../../../state.dart';
import '../../../utils/base64Image.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import '../dashboard/registedWorkers.dart';

class ServiceView extends StackedView<ServiceViewModel> {
  ServiceView({Key? key}) : super(key: key);


  final PageController _pageController = PageController();

  TextEditingController searchController = TextEditingController();


  @override
  void onViewModelReady(ServiceViewModel viewModel) {
    super.onViewModelReady(viewModel);
  }


  @override
  ServiceViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      ServiceViewModel();

  @override
  Widget builder(
      BuildContext context,
      ServiceViewModel viewModel,
      Widget? child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: RefreshIndicator(
        onRefresh: () async {
          await viewModel.refreshData();
        },
        child:
          Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0), // Added horizontal margin
                child:Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: viewModel.updateSearchQuery,
                      decoration: InputDecoration(
                        labelText: 'Search Services',
                        prefixIcon: Icon(Icons.search),
                        iconColor: kcPrimaryColor
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: viewModel.filteredServices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ServiceCard(service: viewModel.filteredServices[index]);
                      },
                    ),
                  ),
                ],
              )
              ),

      ),
    );
  }

}


class ServiceCard extends StatelessWidget {
  final ServicesPOJO service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ServiceDetailsPage(service: service),
            ));
          },
          child:Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child:   Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.0),
                  decoration: BoxDecoration(
                    color: kcPrimaryColor,
                    borderRadius: const BorderRadius.all( Radius.circular(12)
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all( Radius.circular(12)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Base64Image(
                          base64String: service.picture?.url,
                          width: double.infinity, // or specify a width
                          height: 114, // or specify a height
                          fit: BoxFit.cover, // adjust the fit as needed
                        ),
                        Padding( // Add padding to the row
                          padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0,0), // Adjust padding as needed
                          child: Text(
                            service.title ?? 'service title',

                            style: TextStyle(
                                fontSize: 12,
                                color: uiMode.value == AppUiModes.light ? kcSecondaryColor : kcWhiteColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Panchang"
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding( // Add padding to the row
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0,8.0), // Adjust padding as needed
                          child:Text(
                            service.provider ?? 'service provider',
                            style:  TextStyle(
                                fontSize: 10,
                                color: uiMode.value == AppUiModes.light ? kcWhiteColor : kcWhiteColor,
                                fontFamily: "Panchang"
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),),
        ),
      ],
    );
  }
}

