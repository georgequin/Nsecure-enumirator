//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ServicesPOJO {
  /// Returns a new [ServicesPOJO] instance.
  ServicesPOJO({
    this.id,
    this.title,
    this.sn,
    this.provider,
    this.picture,
    this.description,
    this.providerUri,
    this.relatedProfessionIds = const {},
    this.status,
  });

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
  PicturePOJO? picture;

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

  ServicesPOJOStatusEnum? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ServicesPOJO &&
    other.id == id &&
    other.title == title &&
    other.sn == sn &&
    other.provider == provider &&
    other.picture == picture &&
    other.description == description &&
    other.providerUri == providerUri &&
    _deepEquality.equals(other.relatedProfessionIds, relatedProfessionIds) &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (sn == null ? 0 : sn!.hashCode) +
    (provider == null ? 0 : provider!.hashCode) +
    (picture == null ? 0 : picture!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (providerUri == null ? 0 : providerUri!.hashCode) +
    (relatedProfessionIds.hashCode) +
    (status == null ? 0 : status!.hashCode);

  @override
  String toString() => 'ServicesPOJO[id=$id, title=$title, sn=$sn, provider=$provider, picture=$picture, description=$description, providerUri=$providerUri, relatedProfessionIds=$relatedProfessionIds, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
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
    if (this.picture != null) {
      json[r'picture'] = this.picture;
    } else {
      json[r'picture'] = null;
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
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    return json;
  }

  /// Returns a new [ServicesPOJO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ServicesPOJO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ServicesPOJO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ServicesPOJO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ServicesPOJO(
        id: mapValueOfType<int>(json, r'id'),
        title: mapValueOfType<String>(json, r'title'),
        sn: mapValueOfType<int>(json, r'sn'),
        provider: mapValueOfType<String>(json, r'provider'),
        picture: PicturePOJO.fromJson(json[r'picture']),
        description: mapValueOfType<String>(json, r'description'),
        providerUri: mapValueOfType<String>(json, r'providerUri'),
        relatedProfessionIds: json[r'relatedProfessionIds'] is Iterable
            ? (json[r'relatedProfessionIds'] as Iterable).cast<int>().toSet()
            : const {},
        status: ServicesPOJOStatusEnum.fromJson(json[r'status']),
      );
    }
    return null;
  }

  static List<ServicesPOJO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServicesPOJO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServicesPOJO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ServicesPOJO> mapFromJson(dynamic json) {
    final map = <String, ServicesPOJO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ServicesPOJO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ServicesPOJO-objects as value to a dart map
  static Map<String, List<ServicesPOJO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ServicesPOJO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ServicesPOJO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class ServicesPOJOStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const ServicesPOJOStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ACTIVE = ServicesPOJOStatusEnum._(r'ACTIVE');
  static const INACTIVE = ServicesPOJOStatusEnum._(r'INACTIVE');
  static const PENDING = ServicesPOJOStatusEnum._(r'PENDING');
  static const DELETED = ServicesPOJOStatusEnum._(r'DELETED');
  static const SUSPENDED = ServicesPOJOStatusEnum._(r'SUSPENDED');

  /// List of all possible values in this [enum][ServicesPOJOStatusEnum].
  static const values = <ServicesPOJOStatusEnum>[
    ACTIVE,
    INACTIVE,
    PENDING,
    DELETED,
    SUSPENDED,
  ];

  static ServicesPOJOStatusEnum? fromJson(dynamic value) => ServicesPOJOStatusEnumTypeTransformer().decode(value);

  static List<ServicesPOJOStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServicesPOJOStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServicesPOJOStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ServicesPOJOStatusEnum] to String,
/// and [decode] dynamic data back to [ServicesPOJOStatusEnum].
class ServicesPOJOStatusEnumTypeTransformer {
  factory ServicesPOJOStatusEnumTypeTransformer() => _instance ??= const ServicesPOJOStatusEnumTypeTransformer._();

  const ServicesPOJOStatusEnumTypeTransformer._();

  String encode(ServicesPOJOStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ServicesPOJOStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ServicesPOJOStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ACTIVE': return ServicesPOJOStatusEnum.ACTIVE;
        case r'INACTIVE': return ServicesPOJOStatusEnum.INACTIVE;
        case r'PENDING': return ServicesPOJOStatusEnum.PENDING;
        case r'DELETED': return ServicesPOJOStatusEnum.DELETED;
        case r'SUSPENDED': return ServicesPOJOStatusEnum.SUSPENDED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ServicesPOJOStatusEnumTypeTransformer] instance.
  static ServicesPOJOStatusEnumTypeTransformer? _instance;
}


