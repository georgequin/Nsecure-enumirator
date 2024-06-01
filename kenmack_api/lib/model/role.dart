//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Role {
  /// Returns a new [Role] instance.
  Role({
    this.created,
    this.updated,
    this.status,
    this.id,
    this.name,
    this.permissions = const {},
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

  RoleStatusEnum? status;

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

  Set<Permission> permissions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Role &&
    other.created == created &&
    other.updated == updated &&
    other.status == status &&
    other.id == id &&
    other.name == name &&
    _deepEquality.equals(other.permissions, permissions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created == null ? 0 : created!.hashCode) +
    (updated == null ? 0 : updated!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (permissions.hashCode);

  @override
  String toString() => 'Role[created=$created, updated=$updated, status=$status, id=$id, name=$name, permissions=$permissions]';

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
      json[r'permissions'] = this.permissions.toList(growable: false);
    return json;
  }

  /// Returns a new [Role] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Role? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Role[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Role[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Role(
        created: mapDateTime(json, r'created', r''),
        updated: mapDateTime(json, r'updated', r''),
        status: RoleStatusEnum.fromJson(json[r'status']),
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        permissions: Permission.listFromJson(json[r'permissions']).toSet(),
      );
    }
    return null;
  }

  static List<Role> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Role>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Role.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Role> mapFromJson(dynamic json) {
    final map = <String, Role>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Role.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Role-objects as value to a dart map
  static Map<String, List<Role>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Role>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Role.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class RoleStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const RoleStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ACTIVE = RoleStatusEnum._(r'ACTIVE');
  static const INACTIVE = RoleStatusEnum._(r'INACTIVE');
  static const PENDING = RoleStatusEnum._(r'PENDING');
  static const DELETED = RoleStatusEnum._(r'DELETED');
  static const SUSPENDED = RoleStatusEnum._(r'SUSPENDED');

  /// List of all possible values in this [enum][RoleStatusEnum].
  static const values = <RoleStatusEnum>[
    ACTIVE,
    INACTIVE,
    PENDING,
    DELETED,
    SUSPENDED,
  ];

  static RoleStatusEnum? fromJson(dynamic value) => RoleStatusEnumTypeTransformer().decode(value);

  static List<RoleStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RoleStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RoleStatusEnum] to String,
/// and [decode] dynamic data back to [RoleStatusEnum].
class RoleStatusEnumTypeTransformer {
  factory RoleStatusEnumTypeTransformer() => _instance ??= const RoleStatusEnumTypeTransformer._();

  const RoleStatusEnumTypeTransformer._();

  String encode(RoleStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a RoleStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RoleStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ACTIVE': return RoleStatusEnum.ACTIVE;
        case r'INACTIVE': return RoleStatusEnum.INACTIVE;
        case r'PENDING': return RoleStatusEnum.PENDING;
        case r'DELETED': return RoleStatusEnum.DELETED;
        case r'SUSPENDED': return RoleStatusEnum.SUSPENDED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [RoleStatusEnumTypeTransformer] instance.
  static RoleStatusEnumTypeTransformer? _instance;
}


