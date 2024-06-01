//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EmailSenderDTO {
  /// Returns a new [EmailSenderDTO] instance.
  EmailSenderDTO({
    this.emails = const [],
    this.template,
    this.bindings = const {},
    this.subject,
  });

  List<String> emails;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? template;

  Map<String, Object> bindings;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subject;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EmailSenderDTO &&
    _deepEquality.equals(other.emails, emails) &&
    other.template == template &&
    _deepEquality.equals(other.bindings, bindings) &&
    other.subject == subject;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (emails.hashCode) +
    (template == null ? 0 : template!.hashCode) +
    (bindings.hashCode) +
    (subject == null ? 0 : subject!.hashCode);

  @override
  String toString() => 'EmailSenderDTO[emails=$emails, template=$template, bindings=$bindings, subject=$subject]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'emails'] = this.emails;
    if (this.template != null) {
      json[r'template'] = this.template;
    } else {
      json[r'template'] = null;
    }
      json[r'bindings'] = this.bindings;
    if (this.subject != null) {
      json[r'subject'] = this.subject;
    } else {
      json[r'subject'] = null;
    }
    return json;
  }

  /// Returns a new [EmailSenderDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EmailSenderDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "EmailSenderDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "EmailSenderDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EmailSenderDTO(
        emails: json[r'emails'] is Iterable
            ? (json[r'emails'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        template: mapValueOfType<String>(json, r'template'),
        bindings: mapCastOfType<String, Object>(json, r'bindings') ?? const {},
        subject: mapValueOfType<String>(json, r'subject'),
      );
    }
    return null;
  }

  static List<EmailSenderDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EmailSenderDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EmailSenderDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EmailSenderDTO> mapFromJson(dynamic json) {
    final map = <String, EmailSenderDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EmailSenderDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EmailSenderDTO-objects as value to a dart map
  static Map<String, List<EmailSenderDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EmailSenderDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EmailSenderDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

