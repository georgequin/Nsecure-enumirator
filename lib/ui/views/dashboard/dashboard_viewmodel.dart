import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:nsecure/app/app.router.dart';
import 'package:nsecure/core/network/loggingApiClient.dart';
import 'package:openapi/api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../core/network/api_manager.dart';
import '../../../core/network/interceptors.dart';
import '../../../core/utils/local_store_dir.dart';
import '../../../core/utils/local_stotage.dart';
import '../../../state.dart';
import '../../../utils/face_detection_utils.dart';
import '../../../utils/location_utils.dart';

class DashboardViewModel extends BaseViewModel {
  final ApiManager _apiManager = ApiManager(locator<LoggingApiClient>());
  int selectedIndex = 0;
  final log = getLogger("DashboardViewModel");
  List<ServicesPOJO> recommendedService = [];
  List<ServicesPOJO> services = [];
  final TextEditingController serialNumberController = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();
  bool _isCardVisible = true;
  bool get isCardVisible => _isCardVisible;
  bool get isBusy => busy(this);

  final LocationService _locationService = LocationService();
  final FaceDetectionService _faceDetectionService = FaceDetectionService();

  final dateController = TextEditingController();
  List<String> states = [];
  List<String> lgas = [];
  String? selectedState;
  String? selectedGender;
  DateTime? selectedDate;

  bool isFaceCaptureReady = false;
  String? capturedImagePath;

  CameraController? cameraController;
  bool isCameraInitialized = false;
  double progress = 0.0;
  final FaceDetector faceDetector = GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
  ));


  void saveCapturedImage(String imagePath) {
    capturedImagePath = imagePath;
    print('captured image path is: $capturedImagePath');
    _navigationService.navigateToConfirmIdView();
    notifyListeners();
    // Additional logic to handle the captured image

  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    cameraController = CameraController(cameras[1], ResolutionPreset.high);
    await cameraController!.initialize();
    isCameraInitialized = true;
    notifyListeners();

    cameraController!.startImageStream((image) {
      print('started streaming images');
      processCameraImage(image);
    });
  }

  // void processCameraImage(CameraImage image) async {
  //   // Processing logic...
  //   final faceAlignedCorrectly = true;  // Result from face detection
  //   onFaceDetected(faceAlignedCorrectly);
  // }

  void processCameraImage(CameraImage image) async {

    print('Processing camera image...');

    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final InputImage inputImage = InputImage.fromBytes(
      bytes: bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: InputImageRotation.rotation90deg,
        bytesPerRow: image.planes.first.bytesPerRow,
        format: InputImageFormatValue.fromRawValue(image.format.raw) ?? InputImageFormat.nv21,
      ),
    );

    final List<Face> faces = await faceDetector.processImage(inputImage);
    if (faces.isNotEmpty) {
      print('found a face: ${faces.first}');
      final face = faces.first;

      // Check if the face is aligned within the oval (placeholder logic)
      final faceAlignedCorrectly = _isFaceAligned(face);

      if (faceAlignedCorrectly) {
        progress += 0.5;
        if (progress >= 1.0) {
          progress = 1.0;
          captureImage();
        }
      } else {
        progress = 0.0; // Reset progress if the face is not aligned
      }
      notifyListeners();
    }
    else{
      print('no face found');
    }
  }

  bool _isFaceAligned(Face face) {
    // Placeholder logic to check if face is aligned within the oval
    // Replace with actual logic based on your requirements
    // return face.boundingBox.center.dy < 300 && face.boundingBox.center.dx < 200;
    return true;
  }

  void captureImage() async {
    try {
      final image = await cameraController!.takePicture();
      saveCapturedImage(image.path);
    } catch (e) {
      print("Error capturing image: $e");
    }
  }

  void setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();  // Notify the UI to update the TextField
  }

  void hideCard() {
    _isCardVisible = false;
    notifyListeners(); // This will trigger the UI to rebuild
  }

  void changeSelected(int i) {
    selectedIndex = i;
    rebuildUi();
  }

  Future<void> init() async {
    states = await _locationService.fetchStates();
    print('value of states: ${states.first}');
    notifyListeners();
    // await loadServices();
    // await loadRecommended();
  }

  Future<void> onStateSelected(String state) async {
    setBusy(true);
    selectedState = state;
    lgas = await _locationService.fetchLGAs(state);
    notifyListeners();
    setBusy(false);
  }

  Future<void> loadServices() async {
    String? storedServicesJson = await locator<LocalStorage>().fetch(LocalStorageDir.service);
    if (storedServicesJson != null) {
      services = decodeServicesList(storedServicesJson);
    } else {
      await getServices();
    }
  }

  Future<void> loadRecommended() async {
    String? storedRecommendedServicesJson = await locator<LocalStorage>().fetch(LocalStorageDir.recommendedService);
    if (storedRecommendedServicesJson != null) {
      recommendedService = decodeServicesList(storedRecommendedServicesJson);
    } else {
      await getRecommended();
    }
    notifyListeners();
  }

  Future<void> refreshData() async {
    setBusy(true); // Use this to show loading indicator
    getResourceList();
    setBusy(false); // Reset loading indicator after data is refreshed
  }

  void getResourceList() {
    getServices();
    getRecommended();
    // if (userLoggedIn.value == true) {
    //   initCart();
    //   getNotifications();
    // }
  }

  Future<void> getServices() async {
    setBusyForObject(services, true);
    try {
      services = await _apiManager.performApiCall(
          apiCall: () => ServiceControllerApi(_apiManager.apiClient).getAllServices(),
          endpoint: 'services'
      );
      await locator<LocalStorage>().save(LocalStorageDir.service, encodeServicesList(services));
      notifyListeners();
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
    }
    setBusyForObject(services, false);
  }

  Future<void> getRecommended() async {
    setBusyForObject(recommendedService, true);
    try {
      recommendedService = await _apiManager.performApiCall(
          apiCall: () => ServiceControllerApi(_apiManager.apiClient).getRecommendedServices(profile.value.profession!.id!),
          endpoint: 'recommended'
      );
      await locator<LocalStorage>().save(LocalStorageDir.recommendedService, encodeServicesList(recommendedService));
      notifyListeners();
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
    }
    setBusyForObject(recommendedService, false);
  }

  String encodeServicesList(List<ServicesPOJO> services) {
    return jsonEncode(services.map((service) => service.toJson()).toList());
  }

  // Use this to decode a JSON string into a list of services
  List<ServicesPOJO> decodeServicesList(String servicesJson) {
    Iterable l = json.decode(servicesJson);
    List<ServicesPOJO> services = List<ServicesPOJO>.from(l.map((model) => ServicesPOJO.fromJson(model)));
    return services;
  }
}
