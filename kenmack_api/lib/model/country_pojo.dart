//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CountryPOJO {
  /// Returns a new [CountryPOJO] instance.
  CountryPOJO({
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
  bool operator ==(Object other) => identical(this, other) || other is CountryPOJO &&
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
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (currency == null ? 0 : currency!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (capital == null ? 0 : capital!.hashCode) +
    (continent == null ? 0 : continent!.hashCode) +
    (code == null ? 0 : code!.hashCode) +
    (code3 == null ? 0 : code3!.hashCode);

  @override
  String toString() => 'CountryPOJO[id=$id, name=$name, currency=$currency, phone=$phone, capital=$capital, continent=$continent, code=$code, code3=$code3]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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

  /// Returns a new [CountryPOJO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CountryPOJO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CountryPOJO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CountryPOJO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CountryPOJO(
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

  static List<CountryPOJO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CountryPOJO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CountryPOJO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CountryPOJO> mapFromJson(dynamic json) {
    final map = <String, CountryPOJO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CountryPOJO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CountryPOJO-objects as value to a dart map
  static Map<String, List<CountryPOJO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CountryPOJO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CountryPOJO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

