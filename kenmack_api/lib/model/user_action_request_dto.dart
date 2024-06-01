//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserActionRequestDTO {
  /// Returns a new [UserActionRequestDTO] instance.
  UserActionRequestDTO({
    this.action,
    this.password,
    this.id,
  });

  UserActionRequestDTOActionEnum? action;

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
  int? id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserActionRequestDTO &&
    other.action == action &&
    other.password == password &&
    other.id == id;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (action == null ? 0 : action!.hashCode) +
    (password == null ? 0 : password!.hashCode) +
    (id == null ? 0 : id!.hashCode);

  @override
  String toString() => 'UserActionRequestDTO[action=$action, password=$password, id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.action != null) {
      json[r'action'] = this.action;
    } else {
      json[r'action'] = null;
    }
    if (this.password != null) {
      json[r'password'] = this.password;
    } else {
      json[r'password'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    return json;
  }

  /// Returns a new [UserActionRequestDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserActionRequestDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserActionRequestDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserActionRequestDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserActionRequestDTO(
        action: UserActionRequestDTOActionEnum.fromJson(json[r'action']),
        password: mapValueOfType<String>(json, r'password'),
        id: mapValueOfType<int>(json, r'id'),
      );
    }
    return null;
  }

  static List<UserActionRequestDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserActionRequestDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserActionRequestDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserActionRequestDTO> mapFromJson(dynamic json) {
    final map = <String, UserActionRequestDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserActionRequestDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserActionRequestDTO-objects as value to a dart map
  static Map<String, List<UserActionRequestDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserActionRequestDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserActionRequestDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class UserActionRequestDTOActionEnum {
  /// Instantiate a new enum with the provided [value].
  const UserActionRequestDTOActionEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const CHANGE_PASSWORD = UserActionRequestDTOActionEnum._(r'CHANGE_PASSWORD');
  static const DEACTIVATE = UserActionRequestDTOActionEnum._(r'DEACTIVATE');
  static const UPGRADE = UserActionRequestDTOActionEnum._(r'UPGRADE');

  /// List of all possible values in this [enum][UserActionRequestDTOActionEnum].
  static const values = <UserActionRequestDTOActionEnum>[
    CHANGE_PASSWORD,
    DEACTIVATE,
    UPGRADE,
  ];

  static UserActionRequestDTOActionEnum? fromJson(dynamic value) => UserActionRequestDTOActionEnumTypeTransformer().decode(value);

  static List<UserActionRequestDTOActionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserActionRequestDTOActionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserActionRequestDTOActionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UserActionRequestDTOActionEnum] to String,
/// and [decode] dynamic data back to [UserActionRequestDTOActionEnum].
class UserActionRequestDTOActionEnumTypeTransformer {
  factory UserActionRequestDTOActionEnumTypeTransformer() => _instance ??= const UserActionRequestDTOActionEnumTypeTransformer._();

  const UserActionRequestDTOActionEnumTypeTransformer._();

  String encode(UserActionRequestDTOActionEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UserActionRequestDTOActionEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserActionRequestDTOActionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'CHANGE_PASSWORD': return UserActionRequestDTOActionEnum.CHANGE_PASSWORD;
        case r'DEACTIVATE': return UserActionRequestDTOActionEnum.DEACTIVATE;
        case r'UPGRADE': return UserActionRequestDTOActionEnum.UPGRADE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UserActionRequestDTOActionEnumTypeTransformer] instance.
  static UserActionRequestDTOActionEnumTypeTransformer? _instance;
}


