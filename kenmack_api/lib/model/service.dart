//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Service {
  /// Returns a new [Service] instance.
  Service({
    this.created,
    this.updated,
    this.status,
    this.id,
    this.title,
    this.provider,
    this.picture,
    this.description,
    this.providerUri,
    this.relatedProfessions = const {},
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

  ServiceStatusEnum? status;

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
  String? provider;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Picture? picture;

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

  Set<Profession> relatedProfessions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Service &&
    other.created == created &&
    other.updated == updated &&
    other.status == status &&
    other.id == id &&
    other.title == title &&
    other.provider == provider &&
    other.picture == picture &&
    other.description == description &&
    other.providerUri == providerUri &&
    _deepEquality.equals(other.relatedProfessions, relatedProfessions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created == null ? 0 : created!.hashCode) +
    (updated == null ? 0 : updated!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (provider == null ? 0 : provider!.hashCode) +
    (picture == null ? 0 : picture!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (providerUri == null ? 0 : providerUri!.hashCode) +
    (relatedProfessions.hashCode);

  @override
  String toString() => 'Service[created=$created, updated=$updated, status=$status, id=$id, title=$title, provider=$provider, picture=$picture, description=$description, providerUri=$providerUri, relatedProfessions=$relatedProfessions]';

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
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
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
      json[r'relatedProfessions'] = this.relatedProfessions.toList(growable: false);
    return json;
  }

  /// Returns a new [Service] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Service? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Service[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Service[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Service(
        created: mapDateTime(json, r'created', r''),
        updated: mapDateTime(json, r'updated', r''),
        status: ServiceStatusEnum.fromJson(json[r'status']),
        id: mapValueOfType<int>(json, r'id'),
        title: mapValueOfType<String>(json, r'title'),
        provider: mapValueOfType<String>(json, r'provider'),
        picture: Picture.fromJson(json[r'picture']),
        description: mapValueOfType<String>(json, r'description'),
        providerUri: mapValueOfType<String>(json, r'providerUri'),
        relatedProfessions: Profession.listFromJson(json[r'relatedProfessions']).toSet(),
      );
    }
    return null;
  }

  static List<Service> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Service>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Service.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Service> mapFromJson(dynamic json) {
    final map = <String, Service>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Service.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Service-objects as value to a dart map
  static Map<String, List<Service>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Service>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Service.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class ServiceStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const ServiceStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ACTIVE = ServiceStatusEnum._(r'ACTIVE');
  static const INACTIVE = ServiceStatusEnum._(r'INACTIVE');
  static const PENDING = ServiceStatusEnum._(r'PENDING');
  static const DELETED = ServiceStatusEnum._(r'DELETED');
  static const SUSPENDED = ServiceStatusEnum._(r'SUSPENDED');

  /// List of all possible values in this [enum][ServiceStatusEnum].
  static const values = <ServiceStatusEnum>[
    ACTIVE,
    INACTIVE,
    PENDING,
    DELETED,
    SUSPENDED,
  ];

  static ServiceStatusEnum? fromJson(dynamic value) => ServiceStatusEnumTypeTransformer().decode(value);

  static List<ServiceStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServiceStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServiceStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ServiceStatusEnum] to String,
/// and [decode] dynamic data back to [ServiceStatusEnum].
class ServiceStatusEnumTypeTransformer {
  factory ServiceStatusEnumTypeTransformer() => _instance ??= const ServiceStatusEnumTypeTransformer._();

  const ServiceStatusEnumTypeTransformer._();

  String encode(ServiceStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ServiceStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ServiceStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ACTIVE': return ServiceStatusEnum.ACTIVE;
        case r'INACTIVE': return ServiceStatusEnum.INACTIVE;
        case r'PENDING': return ServiceStatusEnum.PENDING;
        case r'DELETED': return ServiceStatusEnum.DELETED;
        case r'SUSPENDED': return ServiceStatusEnum.SUSPENDED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ServiceStatusEnumTypeTransformer] instance.
  static ServiceStatusEnumTypeTransformer? _instance;
}


