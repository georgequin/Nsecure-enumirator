//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ServiceControllerApi {
  ServiceControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'PUT /services/activate' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] serviceId (required):
  Future<Response> activateServiceWithHttpInfo(int serviceId,) async {
    // ignore: prefer_const_declarations
    final path = r'/services/activate';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'serviceId', serviceId));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] serviceId (required):
  Future<Object?> activateService(int serviceId,) async {
    final response = await activateServiceWithHttpInfo(serviceId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /services/create' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [ServiceCreationDTO] serviceCreationDTO (required):
  Future<Response> createServiceWithHttpInfo(ServiceCreationDTO serviceCreationDTO,) async {
    // ignore: prefer_const_declarations
    final path = r'/services/create';

    // ignore: prefer_final_locals
    Object? postBody = serviceCreationDTO;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [ServiceCreationDTO] serviceCreationDTO (required):
  Future<Object?> createService(ServiceCreationDTO serviceCreationDTO,) async {
    final response = await createServiceWithHttpInfo(serviceCreationDTO,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /services/deactivate' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] serviceId (required):
  Future<Response> deActivateServiceWithHttpInfo(int serviceId,) async {
    // ignore: prefer_const_declarations
    final path = r'/services/deactivate';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'serviceId', serviceId));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] serviceId (required):
  Future<Object?> deActivateService(int serviceId,) async {
    final response = await deActivateServiceWithHttpInfo(serviceId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /services' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [bool] includeImages:
  Future<Response> getAllServicesWithHttpInfo({ bool? includeImages, }) async {
    // ignore: prefer_const_declarations
    final path = r'/services';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (includeImages != null) {
      queryParams.addAll(_queryParams('', 'includeImages', includeImages));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [bool] includeImages:
  Future<List<ServicesPOJO>?> getAllServices({ bool? includeImages, }) async {
    final response = await getAllServicesWithHttpInfo( includeImages: includeImages, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ServicesPOJO>') as List)
        .cast<ServicesPOJO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /services/recommended' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] professionId (required):
  ///
  /// * [bool] includeImages:
  Future<Response> getRecommendedServicesWithHttpInfo(int professionId, { bool? includeImages, }) async {
    // ignore: prefer_const_declarations
    final path = r'/services/recommended';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'professionId', professionId));
    if (includeImages != null) {
      queryParams.addAll(_queryParams('', 'includeImages', includeImages));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] professionId (required):
  ///
  /// * [bool] includeImages:
  Future<List<ServicesPOJO>?> getRecommendedServices(int professionId, { bool? includeImages, }) async {
    final response = await getRecommendedServicesWithHttpInfo(professionId,  includeImages: includeImages, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ServicesPOJO>') as List)
        .cast<ServicesPOJO>()
        .toList(growable: false);

    }
    return null;
  }

  /// Performs an HTTP 'GET /services/service' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] serviceId (required):
  Future<Response> getServiceWithHttpInfo(int serviceId,) async {
    // ignore: prefer_const_declarations
    final path = r'/services/service';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'serviceId', serviceId));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] serviceId (required):
  Future<ServicesPOJO?> getService(int serviceId,) async {
    final response = await getServiceWithHttpInfo(serviceId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ServicesPOJO',) as ServicesPOJO;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /services/update/{serviceId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] serviceId (required):
  ///
  /// * [ServiceCreationDTO] serviceCreationDTO (required):
  Future<Response> updateServiceWithHttpInfo(int serviceId, ServiceCreationDTO serviceCreationDTO,) async {
    // ignore: prefer_const_declarations
    final path = r'/services/update/{serviceId}'
      .replaceAll('{serviceId}', serviceId.toString());

    // ignore: prefer_final_locals
    Object? postBody = serviceCreationDTO;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] serviceId (required):
  ///
  /// * [ServiceCreationDTO] serviceCreationDTO (required):
  Future<Object?> updateService(int serviceId, ServiceCreationDTO serviceCreationDTO,) async {
    final response = await updateServiceWithHttpInfo(serviceId, serviceCreationDTO,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }
}
