//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserDetailDTO {
  /// Returns a new [UserDetailDTO] instance.
  UserDetailDTO({
    this.fullName,
    this.phoneNumber,
    this.countryId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fullName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phoneNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? countryId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserDetailDTO &&
    other.fullName == fullName &&
    other.phoneNumber == phoneNumber &&
    other.countryId == countryId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fullName == null ? 0 : fullName!.hashCode) +
    (phoneNumber == null ? 0 : phoneNumber!.hashCode) +
    (countryId == null ? 0 : countryId!.hashCode);

  @override
  String toString() => 'UserDetailDTO[fullName=$fullName, phoneNumber=$phoneNumber, countryId=$countryId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fullName != null) {
      json[r'fullName'] = this.fullName;
    } else {
      json[r'fullName'] = null;
    }
    if (this.phoneNumber != null) {
      json[r'phoneNumber'] = this.phoneNumber;
    } else {
      json[r'phoneNumber'] = null;
    }
    if (this.countryId != null) {
      json[r'countryId'] = this.countryId;
    } else {
      json[r'countryId'] = null;
    }
    return json;
  }

  /// Returns a new [UserDetailDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserDetailDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserDetailDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserDetailDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserDetailDTO(
        fullName: mapValueOfType<String>(json, r'fullName'),
        phoneNumber: mapValueOfType<String>(json, r'phoneNumber'),
        countryId: mapValueOfType<int>(json, r'countryId'),
      );
    }
    return null;
  }

  static List<UserDetailDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserDetailDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserDetailDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserDetailDTO> mapFromJson(dynamic json) {
    final map = <String, UserDetailDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserDetailDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserDetailDTO-objects as value to a dart map
  static Map<String, List<UserDetailDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserDetailDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserDetailDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

