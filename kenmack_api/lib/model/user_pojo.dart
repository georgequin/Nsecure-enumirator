//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserPOJO {
  /// Returns a new [UserPOJO] instance.
  UserPOJO({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.phone,
    this.emailVerified,
    this.phoneVerified,
    this.picture,
    this.countryPOJO,
    this.profession,
    this.roles = const {},
    this.status,
    this.createdAt,
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
  String? username;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? firstName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastName;

  UserPOJOGenderEnum? gender;

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
  bool? emailVerified;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? phoneVerified;

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
  CountryPOJO? countryPOJO;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProfessionPOJO? profession;

  Set<RolePOJO> roles;

  UserPOJOStatusEnum? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserPOJO &&
    other.id == id &&
    other.username == username &&
    other.email == email &&
    other.firstName == firstName &&
    other.lastName == lastName &&
    other.gender == gender &&
    other.phone == phone &&
    other.emailVerified == emailVerified &&
    other.phoneVerified == phoneVerified &&
    other.picture == picture &&
    other.countryPOJO == countryPOJO &&
    other.profession == profession &&
    _deepEquality.equals(other.roles, roles) &&
    other.status == status &&
    other.createdAt == createdAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (username == null ? 0 : username!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (firstName == null ? 0 : firstName!.hashCode) +
    (lastName == null ? 0 : lastName!.hashCode) +
    (gender == null ? 0 : gender!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (emailVerified == null ? 0 : emailVerified!.hashCode) +
    (phoneVerified == null ? 0 : phoneVerified!.hashCode) +
    (picture == null ? 0 : picture!.hashCode) +
    (countryPOJO == null ? 0 : countryPOJO!.hashCode) +
    (profession == null ? 0 : profession!.hashCode) +
    (roles.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode);

  @override
  String toString() => 'UserPOJO[id=$id, username=$username, email=$email, firstName=$firstName, lastName=$lastName, gender=$gender, phone=$phone, emailVerified=$emailVerified, phoneVerified=$phoneVerified, picture=$picture, countryPOJO=$countryPOJO, profession=$profession, roles=$roles, status=$status, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.firstName != null) {
      json[r'firstName'] = this.firstName;
    } else {
      json[r'firstName'] = null;
    }
    if (this.lastName != null) {
      json[r'lastName'] = this.lastName;
    } else {
      json[r'lastName'] = null;
    }
    if (this.gender != null) {
      json[r'gender'] = this.gender;
    } else {
      json[r'gender'] = null;
    }
    if (this.phone != null) {
      json[r'phone'] = this.phone;
    } else {
      json[r'phone'] = null;
    }
    if (this.emailVerified != null) {
      json[r'emailVerified'] = this.emailVerified;
    } else {
      json[r'emailVerified'] = null;
    }
    if (this.phoneVerified != null) {
      json[r'phoneVerified'] = this.phoneVerified;
    } else {
      json[r'phoneVerified'] = null;
    }
    if (this.picture != null) {
      json[r'picture'] = this.picture;
    } else {
      json[r'picture'] = null;
    }
    if (this.countryPOJO != null) {
      json[r'countryPOJO'] = this.countryPOJO;
    } else {
      json[r'countryPOJO'] = null;
    }
    if (this.profession != null) {
      json[r'profession'] = this.profession;
    } else {
      json[r'profession'] = null;
    }
      json[r'roles'] = this.roles.toList(growable: false);
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'createdAt'] = null;
    }
    return json;
  }

  /// Returns a new [UserPOJO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserPOJO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserPOJO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserPOJO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserPOJO(
        id: mapValueOfType<int>(json, r'id'),
        username: mapValueOfType<String>(json, r'username'),
        email: mapValueOfType<String>(json, r'email'),
        firstName: mapValueOfType<String>(json, r'firstName'),
        lastName: mapValueOfType<String>(json, r'lastName'),
        gender: UserPOJOGenderEnum.fromJson(json[r'gender']),
        phone: mapValueOfType<String>(json, r'phone'),
        emailVerified: mapValueOfType<bool>(json, r'emailVerified'),
        phoneVerified: mapValueOfType<bool>(json, r'phoneVerified'),
        picture: PicturePOJO.fromJson(json[r'picture']),
        countryPOJO: CountryPOJO.fromJson(json[r'countryPOJO']),
        profession: ProfessionPOJO.fromJson(json[r'profession']),
        roles: RolePOJO.listFromJson(json[r'roles']).toSet(),
        status: UserPOJOStatusEnum.fromJson(json[r'status']),
        createdAt: mapDateTime(json, r'createdAt', r''),
      );
    }
    return null;
  }

  static List<UserPOJO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserPOJO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserPOJO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserPOJO> mapFromJson(dynamic json) {
    final map = <String, UserPOJO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserPOJO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserPOJO-objects as value to a dart map
  static Map<String, List<UserPOJO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserPOJO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserPOJO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class UserPOJOGenderEnum {
  /// Instantiate a new enum with the provided [value].
  const UserPOJOGenderEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const MALE = UserPOJOGenderEnum._(r'MALE');
  static const FEMALE = UserPOJOGenderEnum._(r'FEMALE');
  static const OTHER = UserPOJOGenderEnum._(r'OTHER');

  /// List of all possible values in this [enum][UserPOJOGenderEnum].
  static const values = <UserPOJOGenderEnum>[
    MALE,
    FEMALE,
    OTHER,
  ];

  static UserPOJOGenderEnum? fromJson(dynamic value) => UserPOJOGenderEnumTypeTransformer().decode(value);

  static List<UserPOJOGenderEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserPOJOGenderEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserPOJOGenderEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UserPOJOGenderEnum] to String,
/// and [decode] dynamic data back to [UserPOJOGenderEnum].
class UserPOJOGenderEnumTypeTransformer {
  factory UserPOJOGenderEnumTypeTransformer() => _instance ??= const UserPOJOGenderEnumTypeTransformer._();

  const UserPOJOGenderEnumTypeTransformer._();

  String encode(UserPOJOGenderEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UserPOJOGenderEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserPOJOGenderEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'MALE': return UserPOJOGenderEnum.MALE;
        case r'FEMALE': return UserPOJOGenderEnum.FEMALE;
        case r'OTHER': return UserPOJOGenderEnum.OTHER;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UserPOJOGenderEnumTypeTransformer] instance.
  static UserPOJOGenderEnumTypeTransformer? _instance;
}



class UserPOJOStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const UserPOJOStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const ACTIVE = UserPOJOStatusEnum._(r'ACTIVE');
  static const INACTIVE = UserPOJOStatusEnum._(r'INACTIVE');
  static const PENDING = UserPOJOStatusEnum._(r'PENDING');
  static const DELETED = UserPOJOStatusEnum._(r'DELETED');
  static const SUSPENDED = UserPOJOStatusEnum._(r'SUSPENDED');

  /// List of all possible values in this [enum][UserPOJOStatusEnum].
  static const values = <UserPOJOStatusEnum>[
    ACTIVE,
    INACTIVE,
    PENDING,
    DELETED,
    SUSPENDED,
  ];

  static UserPOJOStatusEnum? fromJson(dynamic value) => UserPOJOStatusEnumTypeTransformer().decode(value);

  static List<UserPOJOStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserPOJOStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserPOJOStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UserPOJOStatusEnum] to String,
/// and [decode] dynamic data back to [UserPOJOStatusEnum].
class UserPOJOStatusEnumTypeTransformer {
  factory UserPOJOStatusEnumTypeTransformer() => _instance ??= const UserPOJOStatusEnumTypeTransformer._();

  const UserPOJOStatusEnumTypeTransformer._();

  String encode(UserPOJOStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a UserPOJOStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserPOJOStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'ACTIVE': return UserPOJOStatusEnum.ACTIVE;
        case r'INACTIVE': return UserPOJOStatusEnum.INACTIVE;
        case r'PENDING': return UserPOJOStatusEnum.PENDING;
        case r'DELETED': return UserPOJOStatusEnum.DELETED;
        case r'SUSPENDED': return UserPOJOStatusEnum.SUSPENDED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UserPOJOStatusEnumTypeTransformer] instance.
  static UserPOJOStatusEnumTypeTransformer? _instance;
}


