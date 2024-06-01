# openapi.api.ProfessionControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8081*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAllProfessions**](ProfessionControllerApi.md#getallprofessions) | **GET** /profession/professions | 


# **getAllProfessions**
> GlobalResponseDtoListProfession getAllProfessions()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ProfessionControllerApi();

try {
    final result = api_instance.getAllProfessions();
    print(result);
} catch (e) {
    print('Exception when calling ProfessionControllerApi->getAllProfessions: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GlobalResponseDtoListProfession**](GlobalResponseDtoListProfession.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

