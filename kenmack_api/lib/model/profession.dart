//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Profession {
  /// Returns a new [Profession] instance.
  Profession({
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

  ProfessionStatusEnum? status;

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
  bool operator ==(Object other) => identical(this, other) || other is Profession &&
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
  String toString() => 'Profession[created=$created, updated=$updated, status=$status, id=$id, name=$name, description=$description]';

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

  /// Returns a new [Profession] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Profession? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Profession[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Profession[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Profession(
        created: mapDateTime(json, r'created', r''),
        updated: mapDateTime(json, r'updated', r''),
        status: ProfessionStatusEnum.fromJson(json[r'status']),
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
      );
    }
    return null;
  }

  static List<Profession> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Profession>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Profession.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Profession> mapFromJson(dynamic json) {
    final map = <String, Profession>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Profession.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Profession-objects as value to a dart map
  static Map<String, List<Profession>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Profession>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Profession.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class ProfessionStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const ProfessionStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ACTIVE = ProfessionStatusEnum._(r'ACTIVE');
  static const INACTIVE = ProfessionStatusEnum._(r'INACTIVE');
  static const PENDING = ProfessionStatusEnum._(r'PENDING');
  static const DELETED = ProfessionStatusEnum._(r'DELETED');
  static const SUSPENDED = ProfessionStatusEnum._(r'SUSPENDED');

  /// List of all possible values in this [enum][ProfessionStatusEnum].
  static const values = <ProfessionStatusEnum>[
    ACTIVE,
    INACTIVE,
    PENDING,
    DELETED,
    SUSPENDED,
  ];

  static ProfessionStatusEnum? fromJson(dynamic value) => ProfessionStatusEnumTypeTransformer().decode(value);

  static List<ProfessionStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProfessionStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProfessionStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProfessionStatusEnum] to String,
/// and [decode] dynamic data back to [ProfessionStatusEnum].
class ProfessionStatusEnumTypeTransformer {
  factory ProfessionStatusEnumTypeTransformer() => _instance ??= const ProfessionStatusEnumTypeTransformer._();

  const ProfessionStatusEnumTypeTransformer._();

  String encode(ProfessionStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ProfessionStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProfessionStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ACTIVE': return ProfessionStatusEnum.ACTIVE;
        case r'INACTIVE': return ProfessionStatusEnum.INACTIVE;
        case r'PENDING': return ProfessionStatusEnum.PENDING;
        case r'DELETED': return ProfessionStatusEnum.DELETED;
        case r'SUSPENDED': return ProfessionStatusEnum.SUSPENDED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ProfessionStatusEnumTypeTransformer] instance.
  static ProfessionStatusEnumTypeTransformer? _instance;
}


