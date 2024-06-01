//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Country {
  /// Returns a new [Country] instance.
  Country({
    this.created,
    this.updated,
    this.status,
    this.id,
    this.name,
    this.currency,
    this.phone,
    this.capital,
    this.continent,
    this.code,
    this.code3,
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

  CountryStatusEnum? status;

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
  String? currency;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phone;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? capital;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? continent;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? code;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? code3;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Country &&
    other.created == created &&
    other.updated == updated &&
    other.status == status &&
    other.id == id &&
    other.name == name &&
    other.currency == currency &&
    other.phone == phone &&
    other.capital == capital &&
    other.continent == continent &&
    other.code == code &&
    other.code3 == code3;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created == null ? 0 : created!.hashCode) +
    (updated == null ? 0 : updated!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (currency == null ? 0 : currency!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (capital == null ? 0 : capital!.hashCode) +
    (continent == null ? 0 : continent!.hashCode) +
    (code == null ? 0 : code!.hashCode) +
    (code3 == null ? 0 : code3!.hashCode);

  @override
  String toString() => 'Country[created=$created, updated=$updated, status=$status, id=$id, name=$name, currency=$currency, phone=$phone, capital=$capital, continent=$continent, code=$code, code3=$code3]';

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
    if (this.currency != null) {
      json[r'currency'] = this.currency;
    } else {
      json[r'currency'] = null;
    }
    if (this.phone != null) {
      json[r'phone'] = this.phone;
    } else {
      json[r'phone'] = null;
    }
    if (this.capital != null) {
      json[r'capital'] = this.capital;
    } else {
      json[r'capital'] = null;
    }
    if (this.continent != null) {
      json[r'continent'] = this.continent;
    } else {
      json[r'continent'] = null;
    }
    if (this.code != null) {
      json[r'code'] = this.code;
    } else {
      json[r'code'] = null;
    }
    if (this.code3 != null) {
      json[r'code3'] = this.code3;
    } else {
      json[r'code3'] = null;
    }
    return json;
  }

  /// Returns a new [Country] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Country? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Country[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Country[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Country(
        created: mapDateTime(json, r'created', r''),
        updated: mapDateTime(json, r'updated', r''),
        status: CountryStatusEnum.fromJson(json[r'status']),
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        currency: mapValueOfType<String>(json, r'currency'),
        phone: mapValueOfType<String>(json, r'phone'),
        capital: mapValueOfType<String>(json, r'capital'),
        continent: mapValueOfType<String>(json, r'continent'),
        code: mapValueOfType<String>(json, r'code'),
        code3: mapValueOfType<String>(json, r'code3'),
      );
    }
    return null;
  }

  static List<Country> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Country>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Country.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Country> mapFromJson(dynamic json) {
    final map = <String, Country>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Country.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Country-objects as value to a dart map
  static Map<String, List<Country>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Country>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Country.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class CountryStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const CountryStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ACTIVE = CountryStatusEnum._(r'ACTIVE');
  static const INACTIVE = CountryStatusEnum._(r'INACTIVE');
  static const PENDING = CountryStatusEnum._(r'PENDING');
  static const DELETED = CountryStatusEnum._(r'DELETED');
  static const SUSPENDED = CountryStatusEnum._(r'SUSPENDED');

  /// List of all possible values in this [enum][CountryStatusEnum].
  static const values = <CountryStatusEnum>[
    ACTIVE,
    INACTIVE,
    PENDING,
    DELETED,
    SUSPENDED,
  ];

  static CountryStatusEnum? fromJson(dynamic value) => CountryStatusEnumTypeTransformer().decode(value);

  static List<CountryStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CountryStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CountryStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CountryStatusEnum] to String,
/// and [decode] dynamic data back to [CountryStatusEnum].
class CountryStatusEnumTypeTransformer {
  factory CountryStatusEnumTypeTransformer() => _instance ??= const CountryStatusEnumTypeTransformer._();

  const CountryStatusEnumTypeTransformer._();

  String encode(CountryStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CountryStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CountryStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ACTIVE': return CountryStatusEnum.ACTIVE;
        case r'INACTIVE': return CountryStatusEnum.INACTIVE;
        case r'PENDING': return CountryStatusEnum.PENDING;
        case r'DELETED': return CountryStatusEnum.DELETED;
        case r'SUSPENDED': return CountryStatusEnum.SUSPENDED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CountryStatusEnumTypeTransformer] instance.
  static CountryStatusEnumTypeTransformer? _instance;
}


