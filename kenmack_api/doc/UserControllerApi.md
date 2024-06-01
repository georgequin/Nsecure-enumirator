# openapi.api.UserControllerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8081*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAllCountries**](UserControllerApi.md#getallcountries) | **GET** /auth/user/countries | 
[**getAllUsers**](UserControllerApi.md#getallusers) | **GET** /auth | 
[**getUserDetails**](UserControllerApi.md#getuserdetails) | **GET** /auth/user/{userId} | 
[**handleUserAction**](UserControllerApi.md#handleuseraction) | **PUT** /auth/admin/actions | 
[**login**](UserControllerApi.md#login) | **POST** /auth/login | 
[**logout**](UserControllerApi.md#logout) | **POST** /auth/logout | 
[**passwordReset**](UserControllerApi.md#passwordreset) | **POST** /auth/resetpassword | 
[**refreshToken**](UserControllerApi.md#refreshtoken) | **POST** /auth/refresh-token | 
[**registerUser**](UserControllerApi.md#registeruser) | **POST** /auth/register | Receives user details and create new user
[**sendEMail**](UserControllerApi.md#sendemail) | **POST** /auth | 
[**updateUserDetails**](UserControllerApi.md#updateuserdetails) | **PUT** /auth/user/{id}/details | 
[**updateUserProfilePicture**](UserControllerApi.md#updateuserprofilepicture) | **POST** /auth/{userId}/profile-picture | 
[**verifyCode**](UserControllerApi.md#verifycode) | **POST** /auth/verifycode | 


# **getAllCountries**
> List<CountryPOJO> getAllCountries()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();

try {
    final result = api_instance.getAllCountries();
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->getAllCountries: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<CountryPOJO>**](CountryPOJO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllUsers**
> List<UserPOJO> getAllUsers()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();

try {
    final result = api_instance.getAllUsers();
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->getAllUsers: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<UserPOJO>**](UserPOJO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserDetails**
> UserPOJO getUserDetails(userId)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();
final userId = 789; // int | 

try {
    final result = api_instance.getUserDetails(userId);
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->getUserDetails: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**UserPOJO**](UserPOJO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **handleUserAction**
> Object handleUserAction(userActionRequestDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();
final userActionRequestDTO = UserActionRequestDTO(); // UserActionRequestDTO | 

try {
    final result = api_instance.handleUserAction(userActionRequestDTO);
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->handleUserAction: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userActionRequestDTO** | [**UserActionRequestDTO**](UserActionRequestDTO.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **login**
> GlobalResponseDtoUserDataPojo login(loginRequestDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();
final loginRequestDTO = LoginRequestDTO(); // LoginRequestDTO | 

try {
    final result = api_instance.login(loginRequestDTO);
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->login: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequestDTO** | [**LoginRequestDTO**](LoginRequestDTO.md)|  | 

### Return type

[**GlobalResponseDtoUserDataPojo**](GlobalResponseDtoUserDataPojo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **logout**
> Object logout()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();

try {
    final result = api_instance.logout();
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->logout: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **passwordReset**
> Object passwordReset(emailVerificationDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();
final emailVerificationDTO = EmailVerificationDTO(); // EmailVerificationDTO | 

try {
    final result = api_instance.passwordReset(emailVerificationDTO);
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->passwordReset: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailVerificationDTO** | [**EmailVerificationDTO**](EmailVerificationDTO.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refreshToken**
> GlobalResponseDtoUserDataPojo refreshToken()



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();

try {
    final result = api_instance.refreshToken();
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->refreshToken: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GlobalResponseDtoUserDataPojo**](GlobalResponseDtoUserDataPojo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerUser**
> Object registerUser(userRegistrationDTO)

Receives user details and create new user

Creates new user in system

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();
final userRegistrationDTO = UserRegistrationDTO(); // UserRegistrationDTO | 

try {
    final result = api_instance.registerUser(userRegistrationDTO);
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->registerUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userRegistrationDTO** | [**UserRegistrationDTO**](UserRegistrationDTO.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendEMail**
> Object sendEMail(emailSenderDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();
final emailSenderDTO = EmailSenderDTO(); // EmailSenderDTO | 

try {
    final result = api_instance.sendEMail(emailSenderDTO);
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->sendEMail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emailSenderDTO** | [**EmailSenderDTO**](EmailSenderDTO.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUserDetails**
> Object updateUserDetails(id, userDetailDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();
final id = 789; // int | 
final userDetailDTO = UserDetailDTO(); // UserDetailDTO | 

try {
    final result = api_instance.updateUserDetails(id, userDetailDTO);
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->updateUserDetails: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **userDetailDTO** | [**UserDetailDTO**](UserDetailDTO.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUserProfilePicture**
> Object updateUserProfilePicture(userId, body)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();
final userId = 789; // int | 
final body = String(); // String | 

try {
    final result = api_instance.updateUserProfilePicture(userId, body);
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->updateUserProfilePicture: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **body** | **String**|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyCode**
> Object verifyCode(verifyPasswordCodeDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api_instance = UserControllerApi();
final verifyPasswordCodeDTO = VerifyPasswordCodeDTO(); // VerifyPasswordCodeDTO | 

try {
    final result = api_instance.verifyCode(verifyPasswordCodeDTO);
    print(result);
} catch (e) {
    print('Exception when calling UserControllerApi->verifyCode: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyPasswordCodeDTO** | [**VerifyPasswordCodeDTO**](VerifyPasswordCodeDTO.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

