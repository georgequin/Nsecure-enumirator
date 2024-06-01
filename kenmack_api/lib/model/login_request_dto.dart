//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LoginRequestDTO {
  /// Returns a new [LoginRequestDTO] instance.
  LoginRequestDTO({
    this.username,
    this.password,
    this.isWebLogin,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? username;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? password;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isWebLogin;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginRequestDTO &&
    other.username == username &&
    other.password == password &&
    other.isWebLogin == isWebLogin;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (username == null ? 0 : username!.hashCode) +
    (password == null ? 0 : password!.hashCode) +
    (isWebLogin == null ? 0 : isWebLogin!.hashCode);

  @override
  String toString() => 'LoginRequestDTO[username=$username, password=$password, isWebLogin=$isWebLogin]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    if (this.password != null) {
      json[r'password'] = this.password;
    } else {
      json[r'password'] = null;
    }
    if (this.isWebLogin != null) {
      json[r'isWebLogin'] = this.isWebLogin;
    } else {
      json[r'isWebLogin'] = null;
    }
    return json;
  }

  /// Returns a new [LoginRequestDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LoginRequestDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LoginRequestDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LoginRequestDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LoginRequestDTO(
        username: mapValueOfType<String>(json, r'username'),
        password: mapValueOfType<String>(json, r'password'),
        isWebLogin: mapValueOfType<bool>(json, r'isWebLogin'),
      );
    }
    return null;
  }

  static List<LoginRequestDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LoginRequestDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LoginRequestDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LoginRequestDTO> mapFromJson(dynamic json) {
    final map = <String, LoginRequestDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginRequestDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LoginRequestDTO-objects as value to a dart map
  static Map<String, List<LoginRequestDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LoginRequestDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LoginRequestDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

