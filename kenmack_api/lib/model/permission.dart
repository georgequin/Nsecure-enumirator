//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Permission {
  /// Returns a new [Permission] instance.
  Permission({
    this.created,
    this.updated,
    this.status,
    this.id,
    this.name,
    this.description,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? created;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? updated;

  PermissionStatusEnum? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Permission &&
    other.created == created &&
    other.updated == updated &&
    other.status == status &&
    other.id == id &&
    other.name == name &&
    other.description == description;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created == null ? 0 : created!.hashCode) +
    (updated == null ? 0 : updated!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode);

  @override
  String toString() => 'Permission[created=$created, updated=$updated, status=$status, id=$id, name=$name, description=$description]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.created != null) {
      json[r'created'] = this.created!.toUtc().toIso8601String();
    } else {
      json[r'created'] = null;
    }
    if (this.updated != null) {
      json[r'updated'] = this.updated!.toUtc().toIso8601String();
    } else {
      json[r'updated'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    return json;
  }

  /// Returns a new [Permission] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Permission? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Permission[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Permission[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Permission(
        created: mapDateTime(json, r'created', r''),
        updated: mapDateTime(json, r'updated', r''),
        status: PermissionStatusEnum.fromJson(json[r'status']),
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
      );
    }
    return null;
  }

  static List<Permission> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Permission>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Permission.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Permission> mapFromJson(dynamic json) {
    final map = <String, Permission>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Permission.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Permission-objects as value to a dart map
  static Map<String, List<Permission>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Permission>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Permission.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class PermissionStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const PermissionStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ACTIVE = PermissionStatusEnum._(r'ACTIVE');
  static const INACTIVE = PermissionStatusEnum._(r'INACTIVE');
  static const PENDING = PermissionStatusEnum._(r'PENDING');
  static const DELETED = PermissionStatusEnum._(r'DELETED');
  static const SUSPENDED = PermissionStatusEnum._(r'SUSPENDED');

  /// List of all possible values in this [enum][PermissionStatusEnum].
  static const values = <PermissionStatusEnum>[
    ACTIVE,
    INACTIVE,
    PENDING,
    DELETED,
    SUSPENDED,
  ];

  static PermissionStatusEnum? fromJson(dynamic value) => PermissionStatusEnumTypeTransformer().decode(value);

  static List<PermissionStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PermissionStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PermissionStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PermissionStatusEnum] to String,
/// and [decode] dynamic data back to [PermissionStatusEnum].
class PermissionStatusEnumTypeTransformer {
  factory PermissionStatusEnumTypeTransformer() => _instance ??= const PermissionStatusEnumTypeTransformer._();

  const PermissionStatusEnumTypeTransformer._();

  String encode(PermissionStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PermissionStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PermissionStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ACTIVE': return PermissionStatusEnum.ACTIVE;
        case r'INACTIVE': return PermissionStatusEnum.INACTIVE;
        case r'PENDING': return PermissionStatusEnum.PENDING;
        case r'DELETED': return PermissionStatusEnum.DELETED;
        case r'SUSPENDED': return PermissionStatusEnum.SUSPENDED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PermissionStatusEnumTypeTransformer] instance.
  static PermissionStatusEnumTypeTransformer? _instance;
}


