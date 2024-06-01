# openapi.api.ServiceControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8081*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activateService**](ServiceControllerApi.md#activateservice) | **PUT** /services/activate | 
[**createService**](ServiceControllerApi.md#createservice) | **POST** /services/create | 
[**deActivateService**](ServiceControllerApi.md#deactivateservice) | **PUT** /services/deactivate | 
[**getAllServices**](ServiceControllerApi.md#getallservices) | **GET** /services | 
[**getRecommendedServices**](ServiceControllerApi.md#getrecommendedservices) | **GET** /services/recommended | 
[**getService**](ServiceControllerApi.md#getservice) | **GET** /services/service | 
[**updateService**](ServiceControllerApi.md#updateservice) | **PUT** /services/update/{serviceId} | 


# **activateService**
> Object activateService(serviceId)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceControllerApi();
final serviceId = 789; // int | 

try {
    final result = api_instance.activateService(serviceId);
    print(result);
} catch (e) {
    print('Exception when calling ServiceControllerApi->activateService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceId** | **int**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createService**
> Object createService(serviceCreationDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceControllerApi();
final serviceCreationDTO = ServiceCreationDTO(); // ServiceCreationDTO | 

try {
    final result = api_instance.createService(serviceCreationDTO);
    print(result);
} catch (e) {
    print('Exception when calling ServiceControllerApi->createService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceCreationDTO** | [**ServiceCreationDTO**](ServiceCreationDTO.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deActivateService**
> Object deActivateService(serviceId)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceControllerApi();
final serviceId = 789; // int | 

try {
    final result = api_instance.deActivateService(serviceId);
    print(result);
} catch (e) {
    print('Exception when calling ServiceControllerApi->deActivateService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceId** | **int**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllServices**
> List<ServicesPOJO> getAllServices(includeImages)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceControllerApi();
final includeImages = true; // bool | 

try {
    final result = api_instance.getAllServices(includeImages);
    print(result);
} catch (e) {
    print('Exception when calling ServiceControllerApi->getAllServices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **includeImages** | **bool**|  | [optional] [default to true]

### Return type

[**List<ServicesPOJO>**](ServicesPOJO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRecommendedServices**
> List<ServicesPOJO> getRecommendedServices(professionId, includeImages)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceControllerApi();
final professionId = 789; // int | 
final includeImages = true; // bool | 

try {
    final result = api_instance.getRecommendedServices(professionId, includeImages);
    print(result);
} catch (e) {
    print('Exception when calling ServiceControllerApi->getRecommendedServices: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **professionId** | **int**|  | 
 **includeImages** | **bool**|  | [optional] [default to true]

### Return type

[**List<ServicesPOJO>**](ServicesPOJO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getService**
> ServicesPOJO getService(serviceId)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceControllerApi();
final serviceId = 789; // int | 

try {
    final result = api_instance.getService(serviceId);
    print(result);
} catch (e) {
    print('Exception when calling ServiceControllerApi->getService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceId** | **int**|  | 

### Return type

[**ServicesPOJO**](ServicesPOJO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateService**
> Object updateService(serviceId, serviceCreationDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = ServiceControllerApi();
final serviceId = 789; // int | 
final serviceCreationDTO = ServiceCreationDTO(); // ServiceCreationDTO | 

try {
    final result = api_instance.updateService(serviceId, serviceCreationDTO);
    print(result);
} catch (e) {
    print('Exception when calling ServiceControllerApi->updateService: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serviceId** | **int**|  | 
 **serviceCreationDTO** | [**ServiceCreationDTO**](ServiceCreationDTO.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

