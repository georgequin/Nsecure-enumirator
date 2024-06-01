//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ServiceCreationDTO {
  /// Returns a new [ServiceCreationDTO] instance.
  ServiceCreationDTO({
    this.title,
    this.sn,
    this.provider,
    this.description,
    this.providerUri,
    this.relatedProfessionIds = const {},
    this.imageUrl,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? sn;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? provider;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? providerUri;

  Set<int> relatedProfessionIds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? imageUrl;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ServiceCreationDTO &&
    other.title == title &&
    other.sn == sn &&
    other.provider == provider &&
    other.description == description &&
    other.providerUri == providerUri &&
    _deepEquality.equals(other.relatedProfessionIds, relatedProfessionIds) &&
    other.imageUrl == imageUrl;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (title == null ? 0 : title!.hashCode) +
    (sn == null ? 0 : sn!.hashCode) +
    (provider == null ? 0 : provider!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (providerUri == null ? 0 : providerUri!.hashCode) +
    (relatedProfessionIds.hashCode) +
    (imageUrl == null ? 0 : imageUrl!.hashCode);

  @override
  String toString() => 'ServiceCreationDTO[title=$title, sn=$sn, provider=$provider, description=$description, providerUri=$providerUri, relatedProfessionIds=$relatedProfessionIds, imageUrl=$imageUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.sn != null) {
      json[r'sn'] = this.sn;
    } else {
      json[r'sn'] = null;
    }
    if (this.provider != null) {
      json[r'provider'] = this.provider;
    } else {
      json[r'provider'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.providerUri != null) {
      json[r'providerUri'] = this.providerUri;
    } else {
      json[r'providerUri'] = null;
    }
      json[r'relatedProfessionIds'] = this.relatedProfessionIds.toList(growable: false);
    if (this.imageUrl != null) {
      json[r'imageUrl'] = this.imageUrl;
    } else {
      json[r'imageUrl'] = null;
    }
    return json;
  }

  /// Returns a new [ServiceCreationDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ServiceCreationDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ServiceCreationDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ServiceCreationDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ServiceCreationDTO(
        title: mapValueOfType<String>(json, r'title'),
        sn: mapValueOfType<int>(json, r'sn'),
        provider: mapValueOfType<String>(json, r'provider'),
        description: mapValueOfType<String>(json, r'description'),
        providerUri: mapValueOfType<String>(json, r'providerUri'),
        relatedProfessionIds: json[r'relatedProfessionIds'] is Iterable
            ? (json[r'relatedProfessionIds'] as Iterable).cast<int>().toSet()
            : const {},
        imageUrl: mapValueOfType<String>(json, r'imageUrl'),
      );
    }
    return null;
  }

  static List<ServiceCreationDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServiceCreationDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServiceCreationDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ServiceCreationDTO> mapFromJson(dynamic json) {
    final map = <String, ServiceCreationDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ServiceCreationDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ServiceCreationDTO-objects as value to a dart map
  static Map<String, List<ServiceCreationDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ServiceCreationDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ServiceCreationDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

