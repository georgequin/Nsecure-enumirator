//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Picture {
  /// Returns a new [Picture] instance.
  Picture({
    this.created,
    this.updated,
    this.status,
    this.id,
    this.url,
    this.type,
    this.front,
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

  PictureStatusEnum? status;

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
  String? url;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? front;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Picture &&
    other.created == created &&
    other.updated == updated &&
    other.status == status &&
    other.id == id &&
    other.url == url &&
    other.type == type &&
    other.front == front;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created == null ? 0 : created!.hashCode) +
    (updated == null ? 0 : updated!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (url == null ? 0 : url!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (front == null ? 0 : front!.hashCode);

  @override
  String toString() => 'Picture[created=$created, updated=$updated, status=$status, id=$id, url=$url, type=$type, front=$front]';

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
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.front != null) {
      json[r'front'] = this.front;
    } else {
      json[r'front'] = null;
    }
    return json;
  }

  /// Returns a new [Picture] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Picture? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Picture[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Picture[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Picture(
        created: mapDateTime(json, r'created', r''),
        updated: mapDateTime(json, r'updated', r''),
        status: PictureStatusEnum.fromJson(json[r'status']),
        id: mapValueOfType<int>(json, r'id'),
        url: mapValueOfType<String>(json, r'url'),
        type: mapValueOfType<String>(json, r'type'),
        front: mapValueOfType<bool>(json, r'front'),
      );
    }
    return null;
  }

  static List<Picture> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Picture>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Picture.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Picture> mapFromJson(dynamic json) {
    final map = <String, Picture>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Picture.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Picture-objects as value to a dart map
  static Map<String, List<Picture>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Picture>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Picture.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class PictureStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const PictureStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ACTIVE = PictureStatusEnum._(r'ACTIVE');
  static const INACTIVE = PictureStatusEnum._(r'INACTIVE');
  static const PENDING = PictureStatusEnum._(r'PENDING');
  static const DELETED = PictureStatusEnum._(r'DELETED');
  static const SUSPENDED = PictureStatusEnum._(r'SUSPENDED');

  /// List of all possible values in this [enum][PictureStatusEnum].
  static const values = <PictureStatusEnum>[
    ACTIVE,
    INACTIVE,
    PENDING,
    DELETED,
    SUSPENDED,
  ];

  static PictureStatusEnum? fromJson(dynamic value) => PictureStatusEnumTypeTransformer().decode(value);

  static List<PictureStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PictureStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PictureStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PictureStatusEnum] to String,
/// and [decode] dynamic data back to [PictureStatusEnum].
class PictureStatusEnumTypeTransformer {
  factory PictureStatusEnumTypeTransformer() => _instance ??= const PictureStatusEnumTypeTransformer._();

  const PictureStatusEnumTypeTransformer._();

  String encode(PictureStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a PictureStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PictureStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ACTIVE': return PictureStatusEnum.ACTIVE;
        case r'INACTIVE': return PictureStatusEnum.INACTIVE;
        case r'PENDING': return PictureStatusEnum.PENDING;
        case r'DELETED': return PictureStatusEnum.DELETED;
        case r'SUSPENDED': return PictureStatusEnum.SUSPENDED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PictureStatusEnumTypeTransformer] instance.
  static PictureStatusEnumTypeTransformer? _instance;
}


